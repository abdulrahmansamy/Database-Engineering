# Loading Data

## MYSQL

You can use this command to show the dump restore progress: 
```
pv -pert MYSQL_DUMP.sql | mysql -u root -p
```

Loop loading
```
for x in {1..100} ; do pv -pert persona.sql | mysql -u root  ; done
```

Validation
```
mysql persona -e 'select count(*) from person'
```

Taking dump
```
mysqldump --databases persona > persona_dump_XX.sql
```

## POSTGRES
