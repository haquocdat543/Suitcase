# ROOK KUBERNETES
* CEPH
* OpenShift

## 1. Installation
### 1. Manifest file

Replace `version` with specific one:
```
git clone --single-branch --branch v1.13.6 https://github.com/rook/rook.git
cd rook/deploy/examples
kubectl create -f crds.yaml -f common.yaml -f operator.yaml
kubectl create -f cluster.yaml
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
