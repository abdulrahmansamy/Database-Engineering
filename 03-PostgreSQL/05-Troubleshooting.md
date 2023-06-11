# Troubleshooting

```
SELECT table_name FROM information_schema.tables
WHERE table_schema NOT IN ('information_schema','pg_catalog');
```

```
SELECT pg_database_size(current_database());
SELECT pg_database_size('sales.payment');
```

```
SELECT datname,usename,client_addr,client_port FROM pg_stat_activity;
```

### to check table size
```
SELECT 
    table_schema || '.' || table_name AS table_full_name,
    pg_total_relation_size('"' || table_schema || '"."' || table_name || '"') AS size
FROM
    information_schema.tables
ORDER BY
    pg_total_relation_size('"' || table_schema || '"."' || table_name || '"') 
DESC;
```

```
SELECT migration.rtable AS Rtable, pg_total_relation_size('migration.rtable') AS size FROM information_schema.tables ORDER BY pg_total_relation_size('migration.rtable') DESC;
```


```
SELECT 'migration.rtable' AS Rtable, SUM(pg_total_relation_size('migration.rtable')) AS size, COUNT(pg_total_relation_size('migration.rtable')) AS Count FROM information_schema.tables ORDER BY pg_total_relation_size('migration.rtable') DESC;
```
```
SELECT 'migration.rtable' AS Rtable, pg_total_relation_size('migration.rtable') AS size FROM information_schema.tables ORDER BY pg_total_relation_size('migration.rtable') DESC;
```
