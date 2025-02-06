# HAPROXY

## PostgreSQL
### Allow from internet
This config allow connect to a PostgreSQL on private subnet from internet
```
vim /etc/haproxy/haproxy.cfg
```
```
frontend postgres_front
    bind *:5432
    mode tcp
    default_backend postgres_backend

backend postgres_backend
    mode tcp
    server postgres_server 1.2.3.4:5432 check
```

### Allow from whitelist ips
```
frontend postgres_front
    bind *:5432
    tcp-request content reject if !{ src 113.192.6.210 192.168.1.100 203.0.113.5 }  # Allow multiple IPs
    default_backend postgres_backend

backend postgres_backend
    mode tcp
    server postgres_server 1.2.3.4:5432 check
```
