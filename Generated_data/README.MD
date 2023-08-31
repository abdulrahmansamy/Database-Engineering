# Loading Data

## MYSQL

Loading `csv` data file:
```sql
LOAD DATA LOCAL INFILE 'abc.csv' INTO TABLE abc
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(col1, col2, col3, col4, col5...);
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
