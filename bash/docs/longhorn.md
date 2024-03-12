# LONGHORN KUBERNETES

## Installation
### 1. Manifest file
Apply manifest file from internet:
```
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.6.0/deploy/longhorn.yaml
```
```
kubectl get pods --namespace longhorn-system --watch
```
```
kubectl -n longhorn-system get pod
```
### 2. Helm
Add helm repo:
```
helm repo add longhorn https://charts.longhorn.io
```
Update helm repo:
```
helm repo update
```
Install helm repo:
```
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.6.0
```
```
kubectl -n longhorn-system get pod
```
### 3. Fleet
Create `fleet.yaml` file:
```
defaultNamespace: longhorn-system
```
```
diff:
  comparePatches:
  - apiVersion: apiextensions.k8s.io/v1
    kind: CustomResourceDefinition
    name: engineimages.longhorn.io
    operations:
    - {"op": "replace", "path": "/status"}
  - apiVersion: apiextensions.k8s.io/v1
    kind: CustomResourceDefinition
    name: nodes.longhorn.io
    operations:
    - {"op": "replace", "path": "/status"}
  - apiVersion: apiextensions.k8s.io/v1
    kind: CustomResourceDefinition
    name: volumes.longhorn.io
    operations:
    - {"op": "replace", "path": "/status"}
```
```
helm:
  repo: https://charts.longhorn.io
  chart: longhorn
  version: v1.6.0 # Replace with the Longhorn version you'd like to install or upgrade to
  releaseName: longhorn
```
```
defaultNamespace: longhorn-system
helm:
  repo: https://charts.longhorn.io
  chart: longhorn
  version: 1.6.0
  releaseName: longhorn
diff:
  comparePatches:
  - apiVersion: apiextensions.k8s.io/v1
    kind: CustomResourceDefinition
    name: engineimages.longhorn.io
    operations:
    - {"op": "replace", "path": "/status"}
  - apiVersion: apiextensions.k8s.io/v1
    kind: CustomResourceDefinition
    name: nodes.longhorn.io
    operations:
    - {"op": "replace", "path": "/status"}
  - apiVersion: apiextensions.k8s.io/v1
    kind: CustomResourceDefinition
    name: volumes.longhorn.io
    operations:
    - {"op": "replace", "path": "/status"}
```
Create GitRepo custom resource:
```
cat > longhorn-gitrepo.yaml << "EOF"
apiVersion: fleet.cattle.io/v1alpha1
kind: GitRepo
metadata:
  name: longhorn
  namespace: fleet-local
spec:
  repo: https://github.com/your-username/your-gitops-repo.git
  revision: main
  paths:
  - .
EOF
```
```
kubectl apply -f longhorn-gitrepo.yaml
```
```
kubectl -n fleet-local get fleet -w
```
```
kubectl -n longhorn-system get pod
```
