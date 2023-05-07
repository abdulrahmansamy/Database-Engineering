

### Determine the Most Advanced Node

We can check the sequence number of the node:
```
sudo -u mysql mysqld --wsrep_recover
```
Run this on all nodes, and the highest sequence number is the most advanced node.

### Bootstrap the Most Advanced Node

Edit the node configuration in /etc/my.cnf.d/:
```
wsrep_cluster_address=gcomm://
```
Start the node:
```
sudo systemctl start mariadb.service
```
### Check Status and Add Nodes to the Cluster

Connect with `mysql` client and query status variables:
```
SHOW GLOBAL STATUS WHERE Variable_name IN ('wsrep_ready', 'wsrep_cluster_size', 'wsrep_cluster_status', 'wsrep_connected');
```
Edit the node configuration in `/etc/my.cnf.d/`. Be certain to use the private IP of the running node:
```
wsrep_cluster_address=gcom://10.0.0.110
```
Start the node:

sudo systemctl start mariadb.service