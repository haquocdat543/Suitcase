# ISTIO

## 1. Customer resources definitions
* VirtualService
* DestinationRule
* ServiceEntry

If you want to inject `side car` to pod in a `namespace` [ ensure that namespace has `istio-injection=enabled` label ]:
```
kubectl get namespace --show-labels
```

### 1 Resources
VirtualService:
```
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: first-app
  namespace: staging
spec:
  hosts
    - first-app
  http:
    - route:
        - destination:
            host: first-app
            subset: v1
```

DestinationRule:
```
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
