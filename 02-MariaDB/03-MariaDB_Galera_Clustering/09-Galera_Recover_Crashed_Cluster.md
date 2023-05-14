
# Galera Recover Crashed Cluster

### Determine the Most Advanced Node

Check the cluster status
```
systemctl status mariadb.service
```
We can check the sequence number of the node:
```
sudo -u mysql mysqld --wsrep_recover
```
Run this on all nodes, and the highest sequence number is `the most advanced node`.

### Bootstrap the Most Advanced Node

Edit the node configuration in /etc/my.cnf.d/:
```
vim /etc/my.cnf.d/galera.cnf
```

Remove all the nodes IP address following `gcomm://`:
```
wsrep_cluster_address=gcomm://
```
Start the node:
```
sudo systemctl start mariadb.service
```
### Check Status and Add Nodes to the Cluster

Connect with `mysql` client,
```
mysql
```
And query status variables:
```
SHOW GLOBAL STATUS WHERE Variable_name IN ('wsrep_ready', 'wsrep_cluster_size', 'wsrep_cluster_status', 'wsrep_connected');
```
In the other nodes, Confirm it is configured to connect to the primary node `the most advanced node`:
```
vim /etc/my.cnf.d/galera.cnf
```

Be certain to use the private IP of the running node
```
wsrep_cluster_address=gcom://10.0.0.110
```
Start the node:
```
sudo systemctl start mariadb.service
```

Switch back to the primary node, 

Re-run the status query:
```
SHOW GLOBAL STATUS WHERE Variable_name IN ('wsrep_ready', 'wsrep_cluster_size', 'wsrep_cluster_status', 'wsrep_connected');
```
