# PostgreSQL Installation

Refer to this to get the appropraite package for your OS: https://www.postgresql.org/download/

## For RHEL/Centos 7 x86_64

### Install the repository RPM:
```
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```

### Install PostgreSQL:
```
sudo yum install -y postgresql15-server
```

### Optionally initialize the database and enable automatic start:
```
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15
```

## For Fedora 37 x86_64

### Install the repository RPM:
```
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-37-x86_64/pgdg-fedora-repo-latest.noarch.rpm
```

### Install PostgreSQL:
```
sudo dnf install -y postgresql15-server
```

### Optionally initialize the database and enable automatic start:
```
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15
```