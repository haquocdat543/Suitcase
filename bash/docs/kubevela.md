# KUBERNETES KUBEVELA

## Installation
### 1. Helm
```
helm repo add kubevela https://kubevela.github.io/charts
helm repo update
helm install --create-namespace -n vela-system kubevela kubevela/vela-core --wait
```
### 2. Binary
```
curl -fsSl https://kubevela.io/script/install.sh | bash
```
