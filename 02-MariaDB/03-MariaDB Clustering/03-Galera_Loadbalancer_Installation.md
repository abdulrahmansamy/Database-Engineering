# Install Galera Loadbalancer
Cluster Nodes:
- Node 01
- Node 02
- Node 03

## 1. Set intial Mariadb security recommendations

### At Node 01:
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
### At Node 01:
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

Start the GLB manually on the command line:
```
glbd -v -c 127.0.0.1:4444 10.0.1.100:13306 10.0.1.100:3306:1
```
Open a second terminal window and log in to node1 using the provided lab credentials:
```
ssh cloud_user@<PUBLIC_IP_ADDRESS>
```
Connect to the cluster on node1 using the newly created remote user login credentials:
```
mysql -u remote -h 10.0.1.100 -P 13306 -p
```
Return to the node0 terminal and confirm the connection was made.


## 4. Add Nodes and Query Stats




## 5. Configure and Start Galera Load Balancer as a Daemon




