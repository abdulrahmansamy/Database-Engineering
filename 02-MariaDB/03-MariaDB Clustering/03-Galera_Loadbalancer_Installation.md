# Install Galera Loadbalancer

1. Run the `mysql_secure_installation`:
```
sudo mysql_secure_installation
```
```
mysql -u root -p
```

```
create user remote identified by 'mypasswd';

grant usage on *.* to 'remote'@'%' identified by 'mypasswd';
```

2. Install the Prerequisite Packages 
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

3. Start Galera Load Balancer

