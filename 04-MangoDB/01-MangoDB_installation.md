# MongoDB Installation

I'm explaining here the installation in redhat compatible linux, please refer to this (web site)[https://www.mongodb.com/docs/mongodb-shell/install/] for the other operating systems.

## Configure MongoDB Repository
Run this command to 
```
sudo bash -c 'cat << "EOF" > /etc/yum.repos.d/mongodb-org-6.0.repo
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF'
```

## Install mongodb shell

```
sudo yum install -y mongodb-mongosh
```
