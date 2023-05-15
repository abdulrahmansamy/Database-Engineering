# MongoDB Installation

I'm explaining here the installation in redhat compatible linux, please refer to this [web site](https://www.mongodb.com/docs/mongodb-shell/install/) for the other operating systems.

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

## Install MongoDB Shell

To install the latest stable version of `mongosh`, issue the following command:
```
sudo yum install -y mongodb-mongosh
```
## Install MongoDB packages

To install the latest stable version of MongoDB, issue the following command:
```
sudo yum install -y mongodb-org

```
or
```
sudo yum install -y mongodb-mongosh mongodb-org
```

## Start `mongod` service
```
sudo systemctl start mongod
```

## Connect to the Database
```
mongosh
```
by default this command connect to the database server running on default port `27017` on localhost:


On start up, for the first time, by default , it reads shell configuration from this `js` file, after the JavaScript has finished processing to customize the prompt:
```
$HOME/.mongoshrc.js
```
To refer to defferent rc file:
```
--eval
```
To prevent reading the rc file, add this `--no-rc`