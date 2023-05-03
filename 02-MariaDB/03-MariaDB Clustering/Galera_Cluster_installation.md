# Galera Cluster Installation

## 1. Enable and Configure Swap Space

Check the currant swap space
```
swapon --summary
```

Create an empty file
```
fallocate -l 512M /swapfile
```
or
```
dd if=/dev/zero of=/swapfile bs=1M count=512
```

Assigne the permissions for the swap file
```
chmod 600 /swapfile
```

Check the swap file size and permissions
```
ll -h /swapfile
```

Format the swap file and turn it on: 
```
mkswap /swapfile
swapon /swapfile
```

Configure persistent swap mount
```
cat << EOF >> /etc/fstab

/swapfile none swap defaults 0 0
EOF
```
Check the swap configuration

```
swapon --summary

swapon --show

free -h
```


## 2. Configure the MariaDB for Galera Clustering

edit the /etc/my.cnf.d/galera.cnf

```
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
binlog_format=ROW
bind-address=0.0.0.0
default_storage_engine=innodb
innodb_autoinc_lock_mode=2
innodb_flush_log_at_trx_commit=0
innodb_buffer_pool_size=122M
wsrep_provider=/usr/lib/libgalera_smm.so
wsrep_provider_options="gcache.size=300M; gcache.page_size=300M"
wsrep_cluster_name="example_cluster"
wsrep_cluster_address="gcomm://IP.node1,IP.node2,IP.node3"
wsrep_sst_method=rsync

[mysql_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
```