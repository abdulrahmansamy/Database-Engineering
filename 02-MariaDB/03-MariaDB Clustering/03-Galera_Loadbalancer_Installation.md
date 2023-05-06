# Install Galera Loadbalancer
Cluster Nodes:
- Node 01
- Node 02
- Node 03
 
 _Open a separate terminal for each Node in a different tab._

## 1. Set intial Mariadb security recommendations

### At Node 01 terminal:
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
### At Node 01 terminal:
```
sudo yum -y install git autoconf automake libtool gcc-c++ nmap-ncat
```

```
git clone https://github.com/codership/glb

cd glb/

./bootstrap.sh

./configure

make

sudo make install


```

## 3. Start Galera Load Balancer
### At Node 01 terminal:

Start the GLB manually on the command line:
```
glbd -v -c 127.0.0.1:4444 <Node01 IP>:13306 <Node01 IP>:3306:1
```
### At Node 02 terminal:

Connect to the cluster on node1 using the newly created remote user login credentials:
```
mysql -u remote -h <Node01 IP> -P 13306 -p'mypasswd'
```
Opserve the node01 terminal and confirm the connection was made.


## 4. Add Nodes and Query Stats
### At Node 01 terminal:
Add a node using port 4444:

> Note: This command must be run on the same node as the load balancer.
```
echo "<Node02 IP>:3306:1" | nc 127.0.0.1 4444
```

Query for statistics on the control port:
```
echo "getstat"  | nc 127.0.0.1 4444
```
## 5. Configure and Start Galera Load Balancer as a Daemon

Clone the GitHub repository:

git clone https://github.com/codership/glb


```
cd glb/files
sudo cp glbd.sh /etc/init.d/glb
sudo cp glbd.cfg /etc/sysconfig/glbd
```

```
sudo vim /etc/sysconfig/glbd

```
```
LISTEN_ADDR="13306"
CONTROL_ADDR="127.0.0.1:4444"
DEFAULT_TARGETS="<Node01 IP>:3306:1 <Node02 IP>:3306:1"
```

Start the service and check its status:
```
sudo service glb start
sudo service glb status
```
Query for load balancer statistics:
```
sudo service glb getstats
```
Remove nodes:
```
sudo service glb remove <Node01 IP>0:3306
```
Add nodes:
```
sudo service glb add <Node01 IP>:3306:1
```