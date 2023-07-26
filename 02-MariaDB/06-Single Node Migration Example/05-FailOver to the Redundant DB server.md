# FailOver to the Redundant DB server



## Start the database service
```
systemctl start mariadb
```
## Allow `3306` port in the firewall
sudo firewall-cmd --add-port=3306/tcp --permanent
sudo firewall-cmd --reload

## Configure the new database in Wordpress

```
sudo vim /etc/wordpress/wp-config.php
```

```
define( 'DB_HOST', '192.168.10.129' );
```