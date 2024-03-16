# ROOK KUBERNETES
* CEPH
* OpenShift

## 1. Installation
### 1. Manifest file
If you are learn Rook please untaint your nodes:

Get taint:
```
kubectl get taint
```
Untaint:
```
kubectl untaint node $NODE_NAME $TAINT_NAME-
```

Replace `version` with specific one:
```
git clone --single-branch --branch v1.13.6 https://github.com/rook/rook.git
cd rook/deploy/examples
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
kubectl create -f cluster.yaml
kubectl create -f toolbox.yaml
```
### 3. Helm repo
```
helm repo add rook-release https://charts.rook.io/release
helm repo update
helm install --create-namespace --namespace rook-ceph rook-ceph rook-release/rook-ceph -f values.yaml
```
## 2. Deploy
```
kubectl create -f cluster.yaml
```
```
kubectl -n rook-ceph get pod
```
```
kubectl create -f toolbox.yaml
```
Get dashboard password:
```
kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo
```
