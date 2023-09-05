## Set intial Mariadb security recommendations

Set the root Database User's Password:

Run the `mysql_secure_installation` or `mariadb-secure-installation`:
```
sudo mysql_secure_installation
```
or 
```
sudo mariadb-secure-installation
```

Create a Database `remote` User Account with password `mypasswd`:
```
mysql -u root -p
```

```
create user remote identified by 'mypasswd';

grant usage on *.* to 'remote'@'%' identified by 'mypasswd';
```