# RANCHER

## Prerequistes
* Helm

## Installation on kubernetes
Add helm repo:
```bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
```
Create namespace:
```bash
kubectl create namespace cattle-system
```
Apply cert manager:
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.yaml
```
Initialize rancher:
```bash
helm install rancher rancher-<CHART_REPO>/rancher \
  --namespace cattle-system \
  --set hostname=rancher.my.org \
  --set bootstrapPassword=admin
```
Get password if forgot:
```bash
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'
```
Patch rancher `service` to `Loadbalancer` type:
```bash
kubectl patch svc rancher -n loadbalancer -p '{"spec": {"type": "LoadBalancer"}}'
```
## Installation on docker
Install directly using command line:
```bash
docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
```
Get bootstrap password:
```bash
docker logs $RANCHERID 2>&1 | grep "Bootstrap Password:
```
Access UI [ Open browser ]:
```
127.0.0.1:80
```
