# MongoDB Installation

This guide covers MongoDB installation on RedHat-based Linux distributions. For other operating systems, see the [MongoDB Shell Installation Docs](https://www.mongodb.com/docs/mongodb-shell/install/).

## Configure MongoDB Repository

Choose one of the following commands based on the MongoDB version you want to install:

### For MongoDB 6.0
```bash
sudo bash -c 'cat << "EOF" > /etc/yum.repos.d/mongodb-org-6.0.repo
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF'
```

### For MongoDB 8.0
```bash
sudo bash -c 'cat << "EOF" > /etc/yum.repos.d/mongodb-org-8.0.repo
[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc
EOF'
```

## Install MongoDB Server 

Install the latest stable version using one of these commands:

```bash
# Basic installation
sudo yum install -y mongodb-org

# Or, for a more complete installation
sudo yum install -y mongodb-mongosh mongodb-org
```

## Install MongoDB Shell (mongosh)

To install only the MongoDB shell:
```bash
sudo yum install -y mongodb-mongosh
```

## Start MongoDB Service
```bash
sudo systemctl start mongod
```

## Connect to MongoDB
Connect to the local MongoDB instance (default port 27017):
```bash
mongosh
```

### Shell Configuration
- By default, mongosh reads its configuration from `~/.mongoshrc.js`
- Use `--eval` to specify a different configuration file
- Use `--norc` to skip reading the configuration file