# HAPROXY

## PostgreSQL
This config allow connect to a PostgreSQL on private subnet from internet
```
frontend postgres_front
    bind *:5432
    mode tcp
    default_backend postgres_back

backend postgres_back
    mode tcp
    server postgres_server 1.2.3.4:5432 check
```
