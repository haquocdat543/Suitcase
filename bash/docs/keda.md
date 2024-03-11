# KEDA KUBERNETES

## Installation
### 1. Helm
#### 1. Add helm repo
```
helm repo add kedacore https://kedacore.github.io/charts
```
#### 2. Update helm repo
```
helm repo update
```
#### 3. Install helm repo
```
helm install keda kedacore/keda --namespace keda --create-namespace
```
## Uninstallation
### 1. Helm
#### 1. Install helm repo
```
helm uninstall keda
```
