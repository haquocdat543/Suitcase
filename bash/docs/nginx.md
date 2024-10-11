# Nginx

## 1. Context

- Event
- Http
- Server
- Upstream
- Location

## 1. Kubernetes nginx controller

Install using manifest from internet:

```
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/v3.5.0/deploy/crds.yaml
```

Delete using manifest from internet:

```
kubectl delete -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/v3.5.0/deploy/crds.yaml
```

## 2. Docker nginx

that show:

- Server address
- Server hostname
- Date
- URI

```
docker run -p 80:80 -d nginxdemos/hello"
```

## 3. Build docker nginx image

that show:

- Server address
- Server hostname

Dockerfile:

```
# Dockerfile
FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
```

nginx.conf:

```
# nginx.conf
events {}

http {
    server {
        listen 80;
location / {
            default_type text/html;
            return 200 "IP Address: $remote_addr\nHostname: $hostname\n";
        }
    }
}
```

build image:

```
docker build -t custom-nginx .
```

Run nginx from built image:

```
docker run -d -p 80:80 custom-nginx
```

Run nginx without build:

```
docker run -d -p 80:80 --name custom-nginx -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro nginx:alpine
```

check result:

```
curl http://localhost
```

## 4. Crawl protection implemented in Kubernetes

Kubernetes:

```
kind: Ingress
metadata:
  name: ingress-ghxv-backend
  annotations:
    nginx.ingress.kubernetes.io/server-snippet: |
      if ($request_uri = /robots.txt) {
          return 444;
      }
spec:
  ingressClassName: nginx
  rules:
```

## 5. Certbot renewal

```
DOMAIN="*.icapasia.com"
certbot --nginx -d ${DOMAIN} --non-interactive --agree-tos --email wwwdatha543@gmail.com --redirect
```

## 6. Configure domain use ssl certification

```
server {
    listen 443 ssl;
    server_name <domain>;

    location / {
        proxy_pass http://127.0.0.1:3000;  # Replace with your backend service port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # SSL configuration
    ssl_certificate /etc/letsencrypt/live/<domain>/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/<domain>/privkey.pem;
}
```

## 7. Configure request body size

- Default is 1MB

```
client_max_body_size 100M;
```

## 8. Configure whitelist for ip address

```
# Allow access from specific IP address
allow 203.0.113.1;

# Block access for all other IPs
deny all;

# Proxy settings, or other configuration here
```

## 9. SSL configuration
```
listen 443 ssl; # managed by Certbot
ssl_certificate /etc/letsencrypt/live/domain/fullchain.pem; # managed by Certbot
ssl_certificate_key /etc/letsencrypt/live/domain/privkey.pem; # managed by Certbot
include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
```

```
server {
    if ($host = <domain>) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name <domain>;
    return 404; # managed by Certbot


}
```

## 10. Cronjob for nginx
Every month:
```
0 0 1 * * /usr/bin/certbot renew --quiet --nginx
```
