# Data Loading

## MYSQL

### Assuming the table has `id` field with `AUTO_INCREMENT` attribute:
#### Loading `csv` data file without `id` field:
```sql
LOAD DATA LOCAL INFILE 'v2/persona_MYSQL_v2.1_without_id.csv' INTO TABLE person01
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(username,first_name,last_name,gender,birthdate,email,ip_address,age,country,postal_code,favorite_color);
```

#### Loading `csv` data file with `id` field:
```sql
LOAD DATA LOCAL INFILE 'v2/persona_MYSQL_v2.1_with_id.csv' INTO TABLE person01
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id,username,first_name,last_name,gender,birthdate,email,ip_address,age,country,postal_code,favorite_color)
set id = NULL;
```


### Loading data by restoring `dump file`:
```bash
mysql -u root -p < MYSQL_DUMP.sql 
```

### Loading data by restoring a `dump file` with `progress bar`:
```bash
pv -pert MYSQL_DUMP.sql | mysql -u root -p
```
```
0:01:00 [2.52MiB/s] [================================================================================================>] 100% 
```
<!-- 
### Loop loading
```bash
for x in {1..100} ; do pv -pert persona.sql | mysql -u root  ; done
```
-->

### Validation
```bash
mysql persona -e 'select count(*) from person'
```

### Taking dump
```bash
mysqldump --databases persona > persona_dump_XX.sql
```

## POSTGRES
