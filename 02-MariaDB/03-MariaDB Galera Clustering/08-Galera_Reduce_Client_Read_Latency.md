# Implement a Cluster to Reduce Client Read Latency Using MariaDB Galera Cluster and Galera Load Balancer

### Configure Galera Load Balancer

We will use the Source Tracking `--source` policy to ensure that connections always go to the same node, reducing client latency:

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
DEFAULT_TARGETS="10.0.1.100:3306:10"

# Other glbd options if any as they would appear on the command line.
OTHER_OPTIONS="--source --watchdog exec:'/usr/local/bin/mysql-check.sh -uremote -pmypasswd'"
```

Start the service:
```
sudo service glb start
sudo service glb status
```

Confirm Connections
```
mysql -h 10.0.1.100 -P 13306 -u remote -p
```
Check GLB status to confirm:
In another terminal:
```
watch service glb status
```

### Test Failover Routing

Nodes in other regions can be added with a lower weight to provide failover capability:
```
sudo service glb add "10.0.1.110:3306:1"
```
We can then simulate a failure of `node0` and test the connection:
```
sudo systemctl stop mariadb.service
mysql -h 10.0.1.100 -P 13306 -u remote -p
```