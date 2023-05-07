# Install Galera Loadbalancer
Cluster Nodes:
- Node 01 (Loadbalancer node as well)
- Node 02
- Node 03
 
 _Open a separate terminal for each Node in a different tab._

## 1. Set intial Mariadb security recommendations

**At Loadbalancer Node:**

Set the root Database User's Password:

Run the `mysql_secure_installation` or `mariadb-secure-installation`:
```
sudo mysql_secure_installation
```
or 
```
sudo mariadb-secure-installation
```
Create a Database User Account
```
mysql -u root -p
```

```
create user remote identified by 'mypasswd';

grant usage on *.* to 'remote'@'%' identified by 'mypasswd';
```

## 2. Install the Prerequisite Packages 
**At Loadbalancer Node:**

```
sudo yum -y install git autoconf automake libtool gcc-c++ nmap-ncat
```

## 3. Build the Galera Load Balancer Binaries
```
cd ~
git clone https://github.com/codership/glb
cd glb/
./bootstrap.sh
./configure
make
sudo make install

```
## 4. Configure and Start Galera Load Balancer

### 1. Configure and Start Galera Load Balancer as a Daemon
<!-- #### Build the Galera Load Balancer Binaries
**At Loadbalancer Node:**
Clone the GitHub repository:

```
git clone https://github.com/codership/glb
cd glb/
./bootstrap.sh
./configure
make
sudo make install

```
-->

#### Configure and Start Galera Load Balancer
```
sudo cp ~/glb/files/glbd.sh /etc/init.d/glb
sudo cp ~/glb/files/glbd.cfg /etc/sysconfig/glbd
sudo cp ~/glb/files/mysql.sh /usr/local/bin/mysql-check.sh
```

Add these lines to the configuration file
```
sudo bash -c 'cat << EOF >>  /etc/sysconfig/glbd

LISTEN_ADDR="<LoadBalancer Node IP>:13306"
CONTROL_ADDR="127.0.0.1:4444"
DEFAULT_TARGETS="<Node01 IP>:3306:1 <Node02 IP>:3306:1"

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
Query for load balancer statistics:
```
sudo service glb getstats
```

Add nodes:
```
sudo service glb add <Node IP>:3306:1
```
Remove nodes:
```
sudo service glb remove <Node IP>0:3306
```

### 2. Configure and Start Galera Load Balancer as a binary
**At Loadbalancer Node:**

Start the GLB manually on the command line:
```
glbd -v -c 127.0.0.1:4444 <Node01 IP>:13306 <Node01 IP>:3306:1
```
**At Node 02:**

Connect to the cluster on node1 using the newly created remote user login credentials:
```
mysql -u remote -h <Node01 IP> -P 13306 -p'mypasswd'
```
Opserve the node01 terminal and confirm the connection was made.


#### Add Nodes and Query Stats
**At Loadbalancer Node:**

Add a node using control port 4444:

> Note: This command must be run on the same node as the load balancer.
```
echo "<Node02 IP>:3306:1" | nc 127.0.0.1 4444
```

Query for statistics on the control port:
```
echo "getstat"  | nc 127.0.0.1 4444
```
