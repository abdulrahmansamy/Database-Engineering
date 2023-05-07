
# MariaDB installation

#### MariaDB Repositories

Referring to the official [MariaDB Repository](https://mariadb.org/download/?t=repo-config)

### Prepare MariaDB 10.11 repo for Fedora 37

```
sudo bash -c 'cat << "EOF" > /etc/yum.repos.d/MariaDB.repo
# MariaDB 10.11 Fedora repository list - created 2023-05-03 11:40 UTC
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

Or

```
cat << "EOF" | sudo tee -a /etc/yum.repos.d/MariaDB.repo 
# MariaDB 10.11 Fedora repository list - created 2023-05-03 11:40 UTC
# https://mariadb.org/download/
[mariadb]
name = MariaDB
# baseurl = https://rpm.mariadb.org/10.11/fedora/$releasever/$basearch
baseurl = https://mirror.its.dal.ca/mariadb/yum/10.11/fedora/$releasever/$basearch
# gpgkey= https://rpm.mariadb.org/RPM-GPG-KEY-MariaDB
gpgkey=https://mirror.its.dal.ca/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF
```

### Install MariaDB Server & Client
```
sudo dnf install -y MariaDB-server MariaDB-client
```

