
# MariaDB installation

### MariaDB Repositories

https://mariadb.org/download/?t=repo-config

### Pepare MariaDB repo for Fedora

```
cat << EOF > /etc/yum.repos.d/MariaDB.repo 
# MariaDB 10.11 Fedora repository list - created 2023-05-02 12:07 UTC
# https://mariadb.org/download/
[mariadb]
name = MariaDB
# baseurl = https://rpm.mariadb.org/10.11/fedora/$releasever/$basearch
baseurl = https://mirror.yer.az/mariadb/yum/10.11/fedora/$releasever/$basearch
# gpgkey= https://rpm.mariadb.org/RPM-GPG-KEY-MariaDB
gpgkey=https://mirror.yer.az/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF
```

### Install MariaDB Server & Client
```
sudo dnf install MariaDB-server MariaDB-client
```
