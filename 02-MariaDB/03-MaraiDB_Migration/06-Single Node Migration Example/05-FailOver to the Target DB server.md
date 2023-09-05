# FailOver to the Target DB server



## Start the database service
```
systemctl start mariadb
```

## Configure the new database in Wordpress
<!--
```
sudo vim /etc/wordpress/wp-config.php
```

```
define( 'DB_HOST', '192.168.10.129' );
```

or -->

```
sudo sed -i s/'192.168.10.128'/'192.168.10.129'/g /etc/wordpress/wp-config.php
sudo grep -i DB_HOST /etc/wordpress/wp-config.php
```

## Check the App
```
firefox http://192.168.10.130/wordpress/ &
```