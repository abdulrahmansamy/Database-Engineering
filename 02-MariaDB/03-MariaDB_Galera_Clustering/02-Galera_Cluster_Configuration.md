# Galera Cluster Configuration

Cluster Nodes:
- Node 01 
- Node 02
- Node 03

<!-- ## 5. Configure the MariaDB for Galera Clustering

Edit the /etc/my.cnf.d/galera.cnf

```
cat << EOF >> /etc/my.cnf.d/galera.cnf
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
-->

## Bootstrap Galera Cluster

### 1. In Node one apply this configuration
```
sudo bash -c 'cat << EOF > /etc/my.cnf.d/galera.cnf
[mysqld]
bind-address=0.0.0.0

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/galera-4/libgalera_smm.so 
binlog_format=ROW 
wsrep_cluster_name='galera_cluster' 
wsrep_node_name='gdb01' 
wsrep_cluster_address='gcomm://'
EOF'
```

```
sudo systemctl status mariadb.service --no-pager
sudo systemctl enable mariadb.service --now
sudo systemctl status mariadb.service --no-pager --full
```


```
mysql
```

```
SHOW GLOBAL VARIABLES LIKE 'wsrep_cluster_address';
```

```
SHOW GLOBAL STATUS WHERE Variable_name IN ('wsrep_ready','wsrep_cluster_size','wsrep_cluster_status','wsrep_connected');
```

### 2. In Node two apply this configuration 

```
sudo bash -c 'cat << EOF > /etc/my.cnf.d/galera.cnf
[mysqld]
bind-address=0.0.0.0

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/galera-4/libgalera_smm.so 
binlog_format=ROW 
wsrep_cluster_name='galera_cluster' 
wsrep_node_name='gdb02' 
wsrep_cluster_address='gcomm://<Node 1 IP>'
EOF'
```
Set `wsrep_cluster_address` to Node 1 IP

```
sudo systemctl status mariadb.service --no-pager
sudo systemctl enable mariadb.service --now
sudo systemctl status mariadb.service --no-pager --full
```

### 3. In Node three apply this configuration 

```
sudo bash -c 'cat << EOF > /etc/my.cnf.d/galera.cnf
[mysqld]
bind-address=0.0.0.0

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/galera-4/libgalera_smm.so 
binlog_format=ROW 
wsrep_cluster_name='galera_cluster' 
wsrep_node_name='gdb03' 
wsrep_cluster_address='gcomm://<Node 1 IP>,<Node 2 IP>,<Node 3 IP>'
EOF'
```
Set `wsrep_cluster_address` to Node 1,2 IPs

```
sudo systemctl status mariadb.service --no-pager
sudo systemctl enable mariadb.service --now
sudo systemctl status mariadb.service --no-pager --full
```

### 4. In all nodes set `wsrep_cluster_address` to all ather nods IPs

```
sudo vim /etc/my.cnf.d/galera.cnf
```
```
wsrep_cluster_address='gcomm://<Node 1 IP>,<Node 2 IP>,<Node 3 IP>'
```

```
sudo systemctl restart mariadb
```