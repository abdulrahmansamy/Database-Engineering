## Login to Postgres Instance
```
sudo -u postgres psql
```
or:
```
sudo su - postgres
psql
```
or:
```
psql -h localhost -p 5432 -U <username> <database_name>
```
Login without prompting for a password:
```
PGPASSWORD=<password> psql -h localhost -p <port> -U <username> <database_name>
```

Run a query from bash
```
sudo -u postgres -H -- psql -d database_name -c 'select * from table_name;'
```

## Check Postgres Version
Without Login to Postgres:
```
psql --version
```
or login  to Postgres, then:
```
SELECT version();
SHOW server_version;

```
## Change the Owner password
```
\password postgres
```

## Getting help
```
psql --help
\h      #help
\?
```

# Create user
```
postgres=# CREATE USER acwebapp WITH SUPERUSER;
CREATE ROLE
postgres=# \password acwebapp
Enter new password for user "acwebapp": P@$$W0rd
Enter it again: P@$$W0rd
postgres=# \q

[user@db01 ~]$ psql -U acwebapp -d postgres -h 172.31.30.21
postgres=# SELECT name, setting FROM pg_settings WHERE name IN ('port','max_connections','shared_buffers')
```


Log into PostgreSQL from the postgres user
```
$ sudo -u postgres psql postgres
```
Once in, create the user and database
```
CREATE ROLE myuser LOGIN PASSWORD 'mypass';
CREATE DATABASE mydatabase WITH OWNER = myuser;
```
Log into PostgreSQL from the new user account
```
$ psql -h localhost -d mydatabase -U myuser -p <port>
```



```
postgres=# SHOW timezone;
postgres=# SET TimeZone='Europe/Rome';
```

## Users And Roles
```
postgres=# CREATE USER lkftest;
postgres=# CREATE ROLE lkftest2;         # Cannot Login

postgres=# ALTER ROLE lkftest2 LOGIN;              # enable login

postgres=# CREATE ROLE select_role;
postgres=# GRANT SELECT ON ALL TABLES IN SCHEMA sales TO select_role;
postgres=# GRANT select_role TO lkftest;
postgres=# 
```


# Create Database 
```
-bash-4.2$ createdb database_name
```


```
\q                  #quit
\l                  #show databases
\c database_name   # use database_name

SELECT inet_server_addr(), inet_server_port();



\dt migration.person
\dt migration.*;
\dt *.*;

\dn[S+] [PATTERN]                       list schemas
\dt[S+] [PATTERN]                       list tables
\dv[S+] [PATTERN]                       list views
\du                                     list users roles 
```

# To select schema
```
SET search_path TO <schema_name>;       # use schema or change schema to <schema_name>
#or
SET schema '<schema_name>';

\d                                      shows all relations in <schema_name>
\dt                                     shows tables in <schema_name>
```


