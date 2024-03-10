# RANCHER

## Prerequistes
* Helm

## Installation
Add helm repo:
```
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
```
Create namespace:
```
kubectl create namespace cattle-system
```
Apply cert manager:
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.yaml
```
Initialize rancher:
```
helm install rancher rancher-<CHART_REPO>/rancher \
  --namespace cattle-system \
  --set hostname=rancher.my.org \
  --set bootstrapPassword=admin
```
Get password if forgot:
```
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'
```
Patch rancher `service` to `Loadbalancer` type:
```
kubectl patch svc rancher -n loadbalancer -p '{"spec": {"type": "LoadBalancer"}}'
```
