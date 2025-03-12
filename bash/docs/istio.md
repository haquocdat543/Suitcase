# ISTIO

## 1. Customer resources definitions
* VirtualService
* DestinationRule
* ServiceEntry

If you want to inject `side car` to pod in a `namespace` [ ensure that namespace has `istio-injection=enabled` label ]:
```bash
kubectl get namespace --show-labels
```

```bash
kubectl label namespace <NAMESPACE> istio-injection=enabled
```

get default istio-proxy envoy config:
```
curl -s http://localhost:15000/config_dump
```

### 1 Traffic routing
VirtualService:
```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: first-app
  namespace: staging
spec:
  hosts:
    - first-app
  http:
    - route:
        - destination:
            host: first-app
            subset: v1
```

DestinationRule:
```yaml
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
  name: first-app
  namespace: staging
spec:
  host: first-app
  subsets:
    - name: v1
      labels:
        app: first-app
        version: v1
    - name: v2
      labels:
        app: first-app
        version: v2
```

### 2 Expose service to internet
VirtualService:
```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: first-app
  namespace: production
spec:
  hosts:
    - app.devopsbyexample.com
    - second-app
  gateway:
    - api
  http:
    - match:
        - uri:
            prefix: /
    - route:
        - destination:
            host: second-app
            subset: v1
          weight: 10
        - destination:
            host: second-app
            subset: v1
          weight: 90
```

Gateway:
```yaml
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: api
  namespace: production
spec:
  selector:
    istio: gateway
  servers:
    - port:
        number: 80
        name: http
        protocol: http
      hosts:
        - app.devopsbyexample.com
```
