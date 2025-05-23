# Galera Cluster Installation

Cluster Nodes:
- Node 01 
- Node 02
- Node 03

## 1. Install the Galera Packages

```
sudo yum install -y galera-4 galera
```


## 2. Configure the Firewall

```
sudo firewall-cmd --add-port=4567/tcp --permanent
sudo firewall-cmd --add-port=4568/tcp --permanent
sudo firewall-cmd --add-port=4444/tcp --permanent
sudo firewall-cmd --add-port=3306/tcp --permanent
sudo firewall-cmd --add-port=13306/tcp --permanent
sudo firewall-cmd --reload
```
or
```
sudo firewall-cmd --add-port={4567,4568,4444,3306,13306}/tcp --permanent
sudo firewall-cmd --reload
```
For Validation
```
sudo firewall-cmd --list-all
```

## 3. Configure SELinux

Open the relevant ports
```
sudo semanage port -m -t mysqld_port_t -p tcp 4567
sudo semanage port -a -t mysqld_port_t -p tcp 4568
sudo semanage port -m -t mysqld_port_t -p tcp 4444
sudo semanage port -a -t mysqld_port_t -p udp 4567
```
<!--
If get already defined error, use modify instead:
```
semanage port -m -t mysqld_port_t -p tcp 4567
semanage port -m -t mysqld_port_t -p tcp 4568
semanage port -m -t mysqld_port_t -p tcp 4444
semanage port -m -t mysqld_port_t -p udp 4567
```
-->

Set permissive mode for the database service.
```
sudo semanage permissive -a mysqld_t
```

For validation
<!-- semanage port -l | egrep "4567|4568|4444" -->
```
sudo semanage port -l | grep mysqld_port_t | egrep "mysqld_port_t|4567|4568|4444" 
```
```
sudo semanage permissive -l
```

## 4. Enable and Configure Swap Space

Check the currant swap space
```
swapon --summary
```

Create an empty file
```
sudo fallocate -l 512M /swapfile
```
or
```
sudo dd if=/dev/zero of=/swapfile bs=1M count=512
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
sudo mkswap /swapfile
sudo swapon /swapfile
```

Configure persistent swap mount
```
sudo bash -c 'cat << EOF >> /etc/fstab

/swapfile none swap defaults 0 0
EOF'
```

Check the swap configuration

```
swapon --summary

swapon --show

free -h
```

Validate the swap mount in fstab file
```
grep swap /etc/fstab
```

<!--
## 5. Configure the MariaDB for Galera Clustering

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

```
cat << EOF > node0.cnf
[mysqld]
bind-address=10.0.1.100

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/gatera-4/libgalera_smm.so
wsrep_cluster_name= 'galera_cluster'
wsrep_node_name= 'node0'
wsrep_cluster_address= 'gcomm://'
EOF
sudo cp node0.cnf /etc/my.cnf.d/
```
-->