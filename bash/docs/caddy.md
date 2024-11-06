# CADDY

## Usage
### Reverse proxy
Edit caddy config file
```
vim /etc/caddy/Caddyfile
```

Reverse proxy for private MySQL db
```
:3306 {
    reverse_proxy 10.0.1.10:3306
}
```

Reverse proxy for private PostgreSQL db
```
:5432 {
    reverse_proxy 10.0.1.10:5432
}
```

Restart
```
sudo systemctl restart caddy
```

