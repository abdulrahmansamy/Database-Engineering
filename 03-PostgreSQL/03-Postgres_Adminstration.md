## Access postgres instance
```
sudo -u postgres psql
```
or)
```
sudo su - postgres
psql
```
## Check Postgres Version
```
SELECT version();
```
## Change the Owner password
```
\password postgres
```

```
psql --help

psql -h localhost -p 5432 -U username database_name
\?

\q      #quit
\l      #show databases
\c database_name   # use database_name

SELECT inet_server_addr(), inet_server_port();

\h      #help

\dt migration.person
\dt migration.*;
\dt *.*;


\dt[S+] [PATTERN]      list tables
\dv[S+] [PATTERN]      list views
\dn[S+] [PATTERN]      list schemas

\du                     list users roles 
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




