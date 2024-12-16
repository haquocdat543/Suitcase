# ROOK KUBERNETES
* CEPH
* OpenShift

## 1. Installation
### 1. Manifest file
If you are learn Rook please untaint your nodes:

Get taint:
```bash
kubectl get taint
```
Untaint:
```bash
kubectl untaint node $NODE_NAME $TAINT_NAME-
```

Replace `version` with specific one:
```bash
git clone --single-branch --branch v1.13.6 https://github.com/rook/rook.git
cd rook/deploy/examples
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
kubectl create -f cluster.yaml
kubectl create -f toolbox.yaml
kubectl create -f dashboard-loadbalancer.yaml
```
### 3. Helm repo
```bash
helm repo add rook-release https://charts.rook.io/release
helm repo update
helm install --create-namespace --namespace rook-ceph rook-ceph rook-release/rook-ceph -f values.yaml
```
## 2. Deploy
```bash
kubectl create -f cluster.yaml
```
```bash
kubectl -n rook-ceph get pod
```
```bash
kubectl create -f toolbox.yaml
```
```bash
kubectl create -f dashboard-loadbalancer.yaml
```
Get dashboard password:
```bash
kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo
```
