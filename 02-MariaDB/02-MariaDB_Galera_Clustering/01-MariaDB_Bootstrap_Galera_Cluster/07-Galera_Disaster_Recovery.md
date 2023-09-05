# Implement a Disaster Recovery Cluster Using MariaDB Galera Cluster and Galera Load Balancer

### Configure Galera Load Balancer

The primary node will have a weight of 10. Adding the DR site with a lower weight provides automatic failover should the primary node fail.

Using the `--single` option causes all connections to go to a single server with the highest weight of those available:

```
sudo vim /etc/sysconfig/glbd
```

```
# Address to listen for client connections at. Mandatory parameter.
# To bind to all interfaces only port should be specified.
LISTEN_ADDR="10.0.1.100:13306"

# Address for controlling connection. Mandatory part is port.
# If not specified control socket will not be opened
CONTROL_ADDR="127.0.0.1:4444"

# Target servers for client connections, space separated.
# Target specification: IP[:PORT[:WEIGHT]] (WEIGHT and PORT optional)
# WEIGHT defaults to 1, PORT defaults to LISTEN_ADDR port.
DEFAULT_TARGETS="10.0.1.100:3306:10 10.0.1.110:3306:1"

# Other glbd options if any as they would appear on the command line.
OTHER_OPTIONS="--single --watchdog exec:'/usr/local/bin/mysql-check.sh -uremote -pmypasswd'"
```

Start the service:
```
sudo service glb start
sudo service glb status
```

### Confirm Connections to Primary

Connect to the load balancer:
```
mysql -h 10.0.1.100 -P 13306 -u remote -p
```
Confirm the connection is sent to the single server with the highest weight of those available, in this case node0.

Open another terminal for monitoring the Galera Load Balancer service, Observe its status:
```
watch service glb status
```

### Failover to DR Site

A manual failover can be triggered by changing the weight of the node:
```
service glb add 10.0.1.100:3306:1
service glb add 10.0.1.110:3306:10
```
A failure of `node1` can be simulated by stopping the `mariadb` service:
```
sudo systemctl stop mariadb.service
```
Connect to the load balancer:
```
mysql -h 10.0.1.100 -P 13306 -u remote -p
```
You can observe the connections now is routed to the DR site automatically.

## Failback to the Main Site
Start the `mariadb` service as failback simulation:
```
sudo systemctl start mariadb.service
```

Retrieving the weight of all nodes:
```
service glb add 10.0.1.100:3306:10
service glb add 10.0.1.110:3306:1
```

Connect to the load balancer:
```
mysql -h 10.0.1.100 -P 13306 -u remote -p
```

Now, the `node1` rejoined the cluster, and the cluster is working normally.

