# Implement a Primary-Replica Cluster Using MariaDB Galera Cluster and Galera Load Balancer

### Confirm Connections to Primary and Replica Nodes
Connect to the primary node via the load balancer:
```
mysql -h 10.0.1.100 -P 13306 -u remote -p
```
The connection is sent to the single server with the highest weight of those available, in this case `node0`.

Connections to the replica can be made directly on port 3306:
```
mysql -h 10.0.1.110 -P 3306 -u remote -p
```

### Promote Replica to Primary

A replica node can become the primary node by changing each of their weights:
```
service glb add 10.0.1.100:3306:1
service glb add 10.0.1.110:3306:10
```

Confirm connections are routed to `node1`:

```
mysql -h 10.0.1.100 -P 13306 -u remote -p
service glb status
```