# LONGHORN KUBERNETES

## Installation
### 1. Manifest file
Apply manifest file from internet:
```bash
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.6.0/deploy/longhorn.yaml
```
```bash
kubectl get pods --namespace longhorn-system --watch
```
```bash
kubectl -n longhorn-system get pod
```
### 2. Helm
Add helm repo:
```bash
helm repo add longhorn https://charts.longhorn.io
```
Update helm repo:
```bash
helm repo update
```
Install helm repo:
```bash
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.6.0
```
```bash
kubectl -n longhorn-system get pod
```
### 3. Fleet
Create `fleet.yaml` file:
```yaml
defaultNamespace: longhorn-system
```
```yaml
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
```yaml
helm:
  repo: https://charts.longhorn.io
  chart: longhorn
  version: v1.6.0 # Replace with the Longhorn version you'd like to install or upgrade to
  releaseName: longhorn
```
```yaml
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
```bash
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
```bash
kubectl apply -f longhorn-gitrepo.yaml
```
```bash
kubectl -n fleet-local get fleet -w
```
```
kubectl -n longhorn-system get pod
```
