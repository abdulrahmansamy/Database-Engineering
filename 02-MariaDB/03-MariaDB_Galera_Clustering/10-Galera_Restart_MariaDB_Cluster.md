# Restart This Running MariaDB Galera Cluster

### Stop All Nodes

The MariaDB server needs to be stopped on all nodes:
```
sudo systemctl stop mariadb.service
```
### Determine Most Advanced Node

The `grastate.dat` file needs to be examined on **each node**, to determine which is most advanced:
```
sudo cat /var/lib/mysql/grastate.dat
```

We're looking here to see whether or not it's safe to bootstrap. If the `safe_to_bootstrap` line is set to 1, then it is. 

Note the `sequno` as well.
### Bootstrap the Most Advanced Node

The following commands will be run only on the most advanced, node as determined in the previous step.

Edit node configuration in `/etc/my.cnf.d/`:
```
sudo vim /etc/my.cnf.d/node1.cnf
```
Change the wsrep_cluster_address from the private one that's there now to just `gcomm://`
```
wsrep_cluster_address=gcomm://
```
Start the node:
```
sudo systemctl start mariadb.service
```
### Check Status and Add Nodes to the Cluster

Now we can connect to the server using using the `mysql` client on the node we bootstrapped in the previous step:
```
mysql
```
Once connected, we can run the following SQL statement to confirm the cluster is running:
```
SHOW GLOBAL STATUS WHERE Variable_name IN ('wsrep_ready', 'wsrep_cluster_size', 'wsrep_cluster_status', 'wsrep_connected');
```
A cluster size of 1 means only one node is connected.

To join the other node to the cluster, we need to edit its configuration in `/etc/my.cnf.d/`. Be certain to use the private IP of the already running node for the cluster address:
```
wsrep_cluster_address=gcom://10.0.1.110
```
Start the node:
```
sudo systemctl start mariadb.service
```