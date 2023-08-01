# Take DB server Backup

## Stop the database service
```
systemctl stop mariadb
```

```
mkdir ~/db_backups
```
## Dump all databases

```
mysqldump -u root -p --all-databases > db_backups/all_databases.sql
```
<!-- or 
```
mysqldump -u root -p --opt wp_db > db_backups/wp_db.sql
```
 -->
## Transfer the Dump files to redundant db server
```
scp -r db_backups/ user@dbdest:~/
```

## Transfer MySQL Databases and User Permissions to Target Server

Check the data directory `datadir` configuration
```
mysql -uroot -p -e 'SHOW VARIABLES LIKE "datadir"'
```
Use the output path from the last command to back it up
```
sudo rsync -avz /var/lib/mysql/* root@dbdest:/var/lib/mysql/ 
```

## Import MySQL Databases Dump File on the Target Server
On the `Target Server`, run this:
```
mysql -u root -p < ~/db_backups/all_databases.sql
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