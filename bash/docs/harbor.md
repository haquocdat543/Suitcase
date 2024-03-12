# HARBOR KUBERNETES

Container registry

## 1. Installation
### 1. Helm
```
helm repo add harbor https://helm.goharbor.io
helm fetch harbor/harbor --untar
helm install my-release harbor/
```
