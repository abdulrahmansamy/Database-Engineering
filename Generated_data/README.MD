# Loading Data

## MYSQL

Loading `csv` data file:
```sql
LOAD DATA LOCAL INFILE 'data.csv' INTO TABLE person01
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(username,first_name,last_name,gender,birthdate,email,ip_address,age,country,postal_code,favorite_color);
```


Loading data using restoring `dump file`:
```bash
mysql -u root -p < MYSQL_DUMP.sql 
```

Loading data using restoring `dump file` with `progress bar`:
```bash
pv -pert MYSQL_DUMP.sql | mysql -u root -p
```
```
0:01:00 [2.52MiB/s] [================================================================================================>] 100% 
```

Loop loading
```bash
for x in {1..100} ; do pv -pert persona.sql | mysql -u root  ; done
```

Validation
```bash
mysql persona -e 'select count(*) from person'
```

Taking dump
```bash
mysqldump --databases persona > persona_dump_XX.sql
```

## POSTGRES
