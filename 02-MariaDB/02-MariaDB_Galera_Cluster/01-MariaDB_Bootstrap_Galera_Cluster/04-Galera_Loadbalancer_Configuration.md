# Galera Loadbalancer Configration

## Configure Galera Load Balancer

```
sudo cp ~/glb/files/glbd.sh /etc/init.d/glb
sudo cp ~/glb/files/glbd.cfg /etc/sysconfig/glbd
sudo cp ~/glb/files/mysql.sh /usr/local/bin/mysql-check.sh
```

Add these lines to the configuration file
```
cat << "EOF" | sudo tee -a /etc/sysconfig/glbd
LISTEN_ADDR="<LoadBalancer Node IP>:13306"
CONTROL_ADDR="127.0.0.1:4444"
DEFAULT_TARGETS="<Node01 IP>:3306:1 <Node02 IP>:3306:1 <Node02 IP>:3306:1"
# Other glbd options to Enable Watchdog if any as they would appear on the command line.
OTHER_OPTIONS="--single --watchdog exec:'/usr/local/bin/mysql-check.sh -uremote -pmypasswd'" 
EOF
```

Start the service and check its status:
```
sudo service glb start
sudo service glb status
```

---

## Node Management

### Add Node
At loadbalancer node run this:
```
sudo service glb add IP Address:port:weight
```
```
sudo service glb add <Node IP>:3306:1
```
After the last colon set the `node weight`
here the node weight is `1`

### Remove Node
```
sudo service glb remove <Node IP>:3306
```

## Performance Stats

### Query stats

Query for load balancer statistics:
```
sudo service glb getstats
```
---
# Destination Selection Policies

Galera Load Balancer–both the system daemon and the shared library–supports five destination selection policies. When you run it from the command-line, you can define these using the command-line arguments. Otherwise, you’ll have to add the arguments to the OTHER_OPTIONS parameter in the glbd.cfg configuration file.

1. Least Connected: This directs new connections to the server using the smallest number of connections possible. It will be adjusted for the server weight. This is the default policy.
2. Round Robin: This sets new connections to the next destination in the circular order list. You can enable it with the `--round` option.
3. Single: This directs all connections to the single server with the highest weight of those available. Routing continues to that server until it fails, or until a server with a higher weight becomes available. You can enable it with the `--single` option.
4. Random: This will direct connections randomly to available servers. You can enable it using the `--random` option.
5. Source Tracking: This will direct connections originating from the same address to the same server. You can enable it with the `--source` option.

> Note: Enables balancing to top weights only, add `--top` option.
> So, for example to enable Round Robin policy, and rotating within the top weight nodes, the options would be like this:
`OTHER_OPTIONS="--round --top"`


