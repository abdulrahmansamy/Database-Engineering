#
## Generate a file containing all users and roles for a self-managed instance

### Source DB

In the SSH session, install the pglogical database extension.
```
sudo apt-get install postgresql-12-pglogical
```
Reconfigure replication related parameters to create replication slots and enable changes capture for tables with primary key.
```
sudo vim /etc/postgresql/12/main/postgresql.conf
```
Add the following parameters at the end of the file:

```
wal_level = logical         # minimal, replica, or logical
max_worker_processes = 10   # one per database needed on provider node
                            # one per node needed on subscriber node
max_replication_slots = 10  # one per node needed on provider node
max_wal_senders = 10        # one per node needed on provider node
shared_preload_libraries = 'pglogical'
max_wal_size = 1GB
min_wal_size = 80MB
```

```
sudo systemctl restart postgresql
```

```
export PGPASSWORD=$PASSWORD
psql -h localhost -U postgres -d 'cymbal_investments' -c 'CREATE EXTENSION IF NOT EXISTS pglogical;'
```
### Create a migration user

```
create user replication_user_name login password 'cymbal@migration';
ALTER USER replication_user_name with REPLICATION;
```


#### Grant necessary privileges to the user for each db
```
\c database_name
```

```
GRANT USAGE on SCHEMA pglogical to PUBLIC;
GRANT SELECT on ALL TABLES in SCHEMA pglogical to replication_user_name;
grant select on ALL TABLES in SCHEMA public to replication_user_name;
GRANT SELECT on ALL SEQUENCES in SCHEMA public to replication_user_name;
```

### configure remote connection for the newly created migration user

```
sudo vim /etc/postgresql/12/main/pg_hba.conf
```
Add the following line at the end of the file
```
host    all    <replication_user_name>       <NETWORK_RANGE>      scram-sha-256
```

```
sudo systemctl restart postgresql
```


##
```
export PG_SOURCE_IP='10.142.0.2'
export Alloy_DB_IP='10.25.0.2'

PGPASSWORD='cymbal@rawn' pg_dump -h $PG_SOURCE_IP -U postgres -d cymbal_investments --schema-only --no-owner --no-acl | PGPASSWORD='cymbal@7494905b0e' psql -h $Alloy_DB_IP -U postgres -d cymbal_investments
```

## Migrate users, roles and grants
```bash
PASSWORD=<source db password>
export PGPASSWORD=$PASSWORD
```

```bash
PGPASSWORD=$PASSWORD pg_dumpall -h localhost -U postgres -r --no-role-passwords| sed 's/NOSUPERUSER//g;s/SUPERUSER//g' > roles.sql
```

```bash
PGPASSWORD=$PASSWORD pg_dumpall -h localhost -U postgres --exclude-database="alloydbadmin|cloudsqladmin|rdsadmin|template0|template1" --schema-only --no-role-passwords | sed '/replication_user/d;' | grep -e '^\(GRANT\|REVOKE\|\\connect\|ALTER.*OWNER.*\)' > grants.sql
```

### Destination DB

```bash
PASSWORD=<destination db password>
export PGPASSWORD=$PASSWORD

DESTINATION_DB_IP=<Dest DB IP>
```

```bash
PGPASSWORD=$PASSWORD psql -h $DESTINATION_DB_IP -U postgres < roles.sql
PGPASSWORD=$PASSWORD psql -h $DESTINATION_DB_IP -U postgres < grants.sql
```