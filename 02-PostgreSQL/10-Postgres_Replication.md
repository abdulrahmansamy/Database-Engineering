# Postgres Replication Pre-configuration:

### In source instance:
#### 1. Check the `wal_level` parameter:

```
SHOW wal_level;
SELECT name,setting FROM pg_settings WHERE name ='wal_level';
```

#### 2. Set `wal_level` parameter to `logical`:
```
SET wal_level TO 'logical';
```
or
```
ALTER SYSTEM SET wal_level = logical;
```

#### 3. Unify `lc_monetary` Parametar across all instances:
```
SHOW lc_monetary;
SET lc_monetary TO "en_US.UTF8";
```


#### 4. Check the Replication Identifier

```
SELECT CASE relreplident
WHEN 'd' THEN 'default'
WHEN 'n' THEN 'nothing'
WHEN 'f' THEN 'full'
WHEN 'i' THEN 'index'
END AS replica_identity
FROM pg_class
WHERE oid = 'schema_name.table_name'::regclass;
```
or
```
\d+ schema_name.table_name;
```
#### 5. SET the Replication Identifier to Full
```
ALTER TABLE mytable REPLICA IDENTITY FULL;
```