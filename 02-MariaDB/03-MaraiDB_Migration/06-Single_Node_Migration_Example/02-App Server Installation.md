# Install Wordpress

## Install the packages
```
sudo dnf update -y
sudo dnf install -y wordpress php-mysqlnd 
sudo dnf install -y @"Web Server"
```

## Start and Enable the web service 
```
sudo systemctl enable httpd.service --now
```

## tune the SELinux parameter
```
sudo setsebool -P httpd_can_network_connect_db=1
sudo setsebool -P httpd_can_sendmail=1
```

## Configure the firewall
```
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
```

## Configure the http server
```
sudo vim /etc/httpd/conf.d/wordpress.conf
```
Configure the Directory Directive as following
```
<Directory /usr/share/wordpress>
  AllowOverride Options
    Require all granted
</Directory>
```


## Configure the Wordpress
```
vim /etc/wordpress/wp-config.php
```

```
define( 'DB_NAME', 'wp_db' );

define( 'DB_USER', 'wp_user' );

define( 'DB_PASSWORD', 'password' );

define( 'DB_HOST', '192.168.10.128' );
```

## Finally, restart the web server
```
systemctl restart httpd
```

## Visit the wordpress site
Using the web brawser follow this url: http://192.168.10.130/wordpress