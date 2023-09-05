# Implement a Write Scalable Cluster Using MariaDB Galera Cluster and Galera Load Balancer

### Add Node and Confirm New Connections Are Routed Correctly

Add the node:
```
sudo service glb add "<New Node IP>:3306:1"

```

Confirm connection, In another terminal:
```
watch service glb status

```