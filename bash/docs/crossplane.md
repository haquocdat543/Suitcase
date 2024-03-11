# CROSSPLANE KUBERNETES

## 1. Installation
### 1. HELM
#### 1. Add helm repo
```
helm repo add crossplane-stable https://charts.crossplane.io/stable
```
#### 2. Update helm repo
```
helm repo update
```
#### 3. Install helm repo
```
helm install crossplane \
--namespace crossplane-system \
--create-namespace crossplane-stable/crossplane 
```
#### 4. Install helm repo with specific version
```
helm install crossplane \
--namespace crossplane-system \
--create-namespace crossplane-stable/crossplane 
--version 1.10.0
```
#### 5. Check resources
Deployments:
```
kubectl get deployments -n crossplane-system
```
