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