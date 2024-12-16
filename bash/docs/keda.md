# KEDA KUBERNETES

## 1. Installation
### 1. Helm
#### 1. Add helm repo
```bash
helm repo add kedacore https://kedacore.github.io/charts
```
#### 2. Update helm repo
```bash
helm repo update
```
#### 3. Install helm repo
```bash
helm install keda kedacore/keda --namespace keda --create-namespace
```

### 2. Manifest file
```bash
# Including admission webhooks
kubectl apply --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0.yaml
# Without admission webhooks
kubectl apply --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0-core.yaml
```

### 3. Microk8s
```bash
microk8s enable keda
```

#### 1. Add helm repo
## 2. Uninstallation
### 1. Helm
#### 1. Install helm repo
```bash
helm uninstall keda
```
### 2. Manifest file
#### 2. Delete Manifest file
```bash
kubectl delete --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0.yaml
kubectl delete --server-side -f https://github.com/kedacore/keda/releases/download/v2.13.0/keda-2.13.0-core.yaml
```

### 3. Resources
#### 3. Remove resources
```bash
kubectl delete $(kubectl get scaledobjects.keda.sh,scaledjobs.keda.sh -A \
  -o jsonpath='{"-n "}{.items[*].metadata.namespace}{" "}{.items[*].kind}{"/"}{.items[*].metadata.name}{"\n"}')
helm uninstall keda -n keda
```
```bash
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

## 3. Usage
Cronjob scale:
```
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: nginx-scaler
  namespace: default
spec:
  scaleTargetRef:
    podname: nginx-pod
  minReplicaCount: 1
  cooldownPeriod: 60
  triggers:
  - type: cron
    metadata:
      timezone: Asia/Saigon
      start: 55 14 * * *
      end: 60 14 * * *
      desiredReplicas: "5"
```
