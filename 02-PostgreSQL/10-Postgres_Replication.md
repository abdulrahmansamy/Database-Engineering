# Postgres Replication Pre-configuration:

### In source instance:
#### Check the `wal_level` parameter:

```
SHOW wal_level;
SELECT name,setting FROM pg_settings WHERE name ='wal_level';
```

#### Set `wal_level` parameter to `logical`:
```
SET wal_level TO 'logical';
ALTER SYSTEM SET wal_level = logical;
```

#### Unify `lc_monetary` Parametar across all instances:
```
SHOW lc_monetary;
SET lc_monetary TO "en_US.UTF8";
```


#### Check the Replication Identifier

```
SELECT CASE relreplident
WHEN 'd' THEN 'default'
WHEN 'n' THEN 'nothing'
WHEN 'f' THEN 'full'
WHEN 'i' THEN 'index'
END AS replica_identity
FROM pg_class
WHERE oid = 'mtable'::regclass;
```
#### SET the Replication Identifier to Full
```
ALTER TABLE mytable REPLICA IDENTITY FULL;
```