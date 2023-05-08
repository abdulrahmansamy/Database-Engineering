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