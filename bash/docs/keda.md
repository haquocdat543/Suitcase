# KEDA KUBERNETES

## Installation
### 1. Helm
#### 1. Add helm repo
```
helm repo add kedacore https://kedacore.github.io/charts
```
#### 2. Update helm repo
```
helm repo update
```
#### 3. Install helm repo
```
helm install keda kedacore/keda --namespace keda --create-namespace
```

### 2. Manifest file
```
# Including admission webhooks
kubectl apply --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0.yaml
# Without admission webhooks
kubectl apply --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0-core.yaml
```

### 3. Microk8s
```
microk8s enable keda
```

#### 1. Add helm repo
## Uninstallation
### 1. Helm
#### 1. Install helm repo
```
helm uninstall keda
```
### 2. Manifest file
#### 2. Delete Manifest file
```
kubectl delete --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0.yaml
kubectl delete --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0-core.yaml
```

### 3. Resources
#### 3. Remove resources
```
kubectl delete $(kubectl get scaledobjects.keda.sh,scaledjobs.keda.sh -A \
  -o jsonpath='{"-n "}{.items[*].metadata.namespace}{" "}{.items[*].kind}{"/"}{.items[*].metadata.name}{"\n"}')
helm uninstall keda -n keda
```
```
for i in $(kubectl get scaledobjects -A \
  -o jsonpath='{"-n "}{.items[*].metadata.namespace}{" "}{.items[*].kind}{"/"}{.items[*].metadata.name}{"\n"}');
do kubectl patch $i -p '{"metadata":{"finalizers":null}}' --type=merge
done

for i in $(kubectl get scaledjobs -A \
  -o jsonpath='{"-n "}{.items[*].metadata.namespace}{" "}{.items[*].kind}{"/"}{.items[*].metadata.name}{"\n"}');
do kubectl patch $i -p '{"metadata":{"finalizers":null}}' --type=merge
done
```
### 4. Microk8s
```
microk8s disable keda
```
