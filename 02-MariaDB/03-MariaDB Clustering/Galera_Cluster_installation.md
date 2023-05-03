# Galera Cluster Installation

## 1. Install the Galera Packages

```
sudo yum install -y galera-4
```
```
yum install MariaDB-client MariaDB-Galera-server galera
```

## 2. Configure the Firewall

```
firewall-cmd --add-port=4567/tcp --permanent
firewall-cmd --add-port=4568/tcp --permanent
firewall-cmd --add-port=4444/tcp --permanent
firewall-cmd --add-port=3306/tcp --permanent
firewall-cmd --add-port=13306/tcp --permanent
firewall-cmd --reload
```

## 3. Configure SELinux

Open the relevant ports
```
semanage port -a -t mysqld_port_t -p tcp 4567
semanage port -a -t mysqld_port_t -p tcp 4568
semanage port -a -t mysqld_port_t -p tcp 4444
semanage port -a -t mysqld_port_t -p udp 4567
```

```
semanage permissive -a mysqld_t
```

## 4. Enable and Configure Swap Space

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


## 5. Configure the MariaDB for Galera Clustering

Edit the /etc/my.cnf.d/galera.cnf

```
cat 
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