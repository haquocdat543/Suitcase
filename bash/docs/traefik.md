# TRAEFIK

## 1. Docker compose

```yaml
labels:
  - "traefik.enable=true"
  - "traefik.port=3000"
  - "traefik.backend=<container_name>"
  - "traefik.frontend.rule=Host:<domain>"
  - "traefik.docker.network=<created_network>"
```
