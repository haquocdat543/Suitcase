# Nginx
## 1. Context
* Event
* Http
* Server
* Upstream
* Location

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
* Server address
* Server hostname 
* Date
* URI
```
docker run -p 80:80 -d nginxdemos/hello"
```

## 3. Build docker nginx image
that show:
* Server address
* Server hostname 

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
