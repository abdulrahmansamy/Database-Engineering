# Install MariaDB

## Adding MariaDB Repositories

```
sudo bash -c 'cat << "EOF" > /etc/yum.repos.d/MariaDB.repo
# MariaDB 10.11 Fedora repository list
# https://mariadb.org/download/
[mariadb]
name = MariaDB
# baseurl = https://rpm.mariadb.org/10.11/fedora/$releasever/$basearch
baseurl = https://mirror.its.dal.ca/mariadb/yum/10.11/fedora/$releasever/$basearch
# gpgkey= https://rpm.mariadb.org/RPM-GPG-KEY-MariaDB
gpgkey=https://mirror.its.dal.ca/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF'
```

## Install MariaDB Server & Client
```
sudo dnf install -y MariaDB-server MariaDB-client
```

## Secure Installation
```
sudo mariadb-secure-installation
```

### Set root Password
```
sudo mysqladmin -u root <password>
```
## Configure the firewall
```
sudo firewall-cmd --add-port=3306/tcp --permanent
sudo firewall-cmd --reload
```