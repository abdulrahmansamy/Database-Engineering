sudo vim /var/lib/pgsql/15/data/postgresql.conf


listen_addresses = '*' 
port = 5432
max_connections = 500   
shared_buffers = 256MB 


HBA Host Based Authentication 

sudo vim /var/lib/pgsql/15/data/pg_hba.conf

# TYPE  DATABASE        USER            ADDRESS                 METHOD

local   all             all                                     peer
# "local" is for Unix domain socket connections onlylocal   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            scram-sha-256
# IPv6 local connections:
host    all             all             ::1/128                 scram-sha-256
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     peer
host    replication     all             127.0.0.1/32            scram-sha-256
host    replication     all             ::1/128                 scram-sha-256

# Remote host connections
host    all             all             0.0.0.0/0               md5



Authentication Methods

peer    same host users
Ident   same host users with ssl
password    plan password


Authorization Methods

Roles
Users 