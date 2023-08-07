# Take DB server Backup

## Stop the database service
```
systemctl stop mariadb
```

```
mkdir ~/db_backups
```
## Dump all databases
### Simply you can use this command:
```
mysqldump -u root -p --all-databases > DB_BACKUP_LOCATION/all_databases.sql
```
### For best practice:
Backup command on source:
```
mysqldump -v -u root -p --single-transaction --skip-lock-tables --log-error=/DB_BACKUP_LOCATION/DUMP_log.err --all-databases | gzip > /DB_BACKUP_LOCATION/DUMP.sql.gz
```

<!-- or 
```
mysqldump -u root -p --opt wp_db > DB_BACKUP_LOCATION/wp_db.sql
```
 -->
## Transfer the Dump files to the target db server
Once backup is completed, please copy DUMP.sql.gz and DUMP_log.err from above location to the target.
```
scp -r /DB_BACKUP_LOCATION/ user@dbdest:~/
```

## Transfer MySQL Databases and User Permissions to Target Server

Check the current data directory `datadir` configuration
```
mysql -uroot -p -e 'SHOW VARIABLES LIKE "datadir"'
```

Backup `datadir` path, it is `/var/lib/mysql/` by default
```
sudo rsync -avz /var/lib/mysql/* root@dbdest:/var/lib/mysql/ 
```

## Import MySQL Databases Dump File on the Target Server
On the `Target Server`, run this:
Extract the commpressed files:
```
gunzip -kc ~/TARGET_LOCATION/DUMP.sql.gz > ~/TARGET_LOCATION/all_databases.sql
```
Import the `SQL` files:
```
mysql -u root -p < ~/TARGET_LOCATION/all_databases.sql
```
or without extracting the compressed file to save the disk size:
```
gunzip -c ~/TARGET_LOCATION/DB_BACKUP_LOCATION/DUMP.sql.gz | mysql -uroot -p
```
<!-- # mysql -u root -p wp_db < ~/db_backups/wp_db.sql  -->

## Validate the Transferred Data in the Target Server

### Validate the users and permissions
```
mysql -uroot -p -e 'select Host, user, password from mysql.user'
mysql -uroot -p -e 'SHOW GRANTS FOR "wp_user"@"localhost"';
```

### Validate the Target databases and tables
```
mysql -uroot -p -D wp_db -e 'SHOW TABLES'
```
<!-- select count(*) from wp_db.*; -->

#### Check table for errors:
```
CHECK TABLE tablename;
```

```
mysql -uroot -p -e 'CHECK TABLE wp_db.wp_links'
```
<!--
Repair table:
```
REPAIR TABLE tablename;
```
-->
#### Analyze given tables:
```
ANALYZE TABLE tablename;
```
```
mysql -uroot -p -e 'ANALYZE TABLE wp_db.wp_links'
```
<!--
Optimize table:
```
OPTIMIZE TABLE tablename;
```
-->