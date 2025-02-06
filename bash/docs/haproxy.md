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
    acl allowed_ips src 192.168.1.100 192.168.1.101 10.0.0.0/24  # Allowed IPs
    http-request deny if !allowed_ips  # Deny if IP is NOT in the list
    default_backend postgres_backend

backend postgres_backend
    mode tcp
    server postgres_server 1.2.3.4:5432 check
```
