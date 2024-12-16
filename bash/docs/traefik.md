# TRAEFIK

## 1. Docker compose [ service ]

```yaml
labels:
  - "traefik.enable=true"
  - "traefik.port=3000"
  - "traefik.backend=<container_name>"
  - "traefik.frontend.rule=Host:<domain>"
  - "traefik.docker.network=<created_network>"
```

## 2. Docker compose [ traefik ]
```toml
defaultEntryPoints = ["http", "https"]

logLevel = "ERROR"
#InsecureSkipVerify = true

[entryPoints]
    [entryPoints.http]
        address = ":80"
    [entryPoints.https]
        address = ":443"
    [entryPoints.https.redirect]
        permanent=true
        regex = "^https://www.(.*).example.com/(.*)"
        replacement = "https://$1.example.com/$2"
    [entryPoints.https.tls]

# Enable ACME (Let's Encrypt): automatic SSL
[acme]
email = "name@email.com"
storage = "acme.json"
entryPoint = "https"
OnHostRule = true
[acme.httpChallenge]
entryPoint = "http"

# Docker
[docker]
endpoint = "unix:///var/run/docker.sock"
domain = "example.com"
watch = true
exposedByDefault = false
```
