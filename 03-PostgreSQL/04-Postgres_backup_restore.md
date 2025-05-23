# Postgres Backup and restore

## Restore a Backup

### Become the postgres user:
```
sudo su - postgres
```
### Create the database to be restored:
```
createdb acweb
```

### Download the backup from GitHub:
```
wget https://github.com/linuxacademy/content-postgresql-deepdive/raw/master/acweb/acweb.tar
```

### Use pg_restore to restore the backup:
```
pg_restore --dbname=acweb --verbose /var/lib/pgsql/acweb.tar
```

### Launch psql and verify the data is present:
```
psql
```

### List the databases:
```
\l
```

### Connect to acweb:
```
\c acweb
```

### Get a count for the payment table:
```
SELECT COUNT(*) FROM sales.payment;
```

## Perform a Backup

### Exit psql:
```
\q
```

### Download a script to create our access log table in the dev database:
```
wget  https://raw.githubusercontent.com/linuxacademy/content-postgresql-deepdive/master/acweb/accessLog.sql
```

### Use psql to execute the script:
```
psql -f accessLog.sql acweb
```

### Make a directory for our backups:
```
mkdir backups
```

### Back up the dev version of the database that includes our new table:
```
pg_dump -F t acweb > backups/acwebdev.tar
```

## Schedule a Backup

### Download this backup script:
```
wget https://raw.githubusercontent.com/linuxacademy/content-postgresql-deepdive/master/acweb/pg_backup.sh
```

### Make the script executable:
```
chmod +x pg_backup.sh
```

### Test the script by executing it:
```
./pg_backup.sh
```

### Check for a backup file:
```
ls backups
```

### Edit crontab:
```
crontab -e
```

### Add the following entry (after pressing i to insert):
```
0 1 * * * /var/lib/pgsql/pg_backup.sh
```

### Save and exit:
```
:wq
```

### Verify the entry:
```
crontab -l
```