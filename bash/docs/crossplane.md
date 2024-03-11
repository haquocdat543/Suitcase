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
### 2. CLI
#### 1. Get latest binary
```
curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | sh
```
#### 2. Get specific version binary
```
curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | XP_VERSION=v1.14.0 sh
```
#### 3. Move binary to bin folder
```
mv crossplane /usr/local/bin
```
