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
Pods:
```
kubectl get pods -n crossplane-system
```
Deployments:
```
kubectl get deployments -n crossplane-system
```
Api resources:
```
kubectl api-resources  | grep crossplane
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
## 2. AWS Provider
### 1.Install AWS S3 provider
```
cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-s3
spec:
  package: xpkg.upbound.io/upbound/provider-aws-s3:v1.1.0
EOF
```
```
kubectl get providers
```

### 2. Configure access key
Create `aws-credentials.txt` file:
```
[default]
aws_access_key_id = 
aws_secret_access_key = 
```

### 3. Create kubernetes secret
```
kubectl create secret \
generic aws-secret \
-n crossplane-system \
--from-file=creds=./aws-credentials.txt
```
```
kubectl describe secret aws-secret -n crossplane-system
```

### 4. Create provider config
```
cat <<EOF | kubectl apply -f -
apiVersion: aws.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: default
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: aws-secret
      key: creds
EOF
```

### 5. Create managed resources
```
cat <<EOF | kubectl create -f -
apiVersion: s3.aws.upbound.io/v1beta1
kind: Bucket
metadata:
  name: hqdbucket
  generateName: hqdbucket
spec:
  forProvider:
    region: us-east-2
  providerConfigRef:
    name: default
EOF
```
```
kubectl get buckets
```
### 6. Delete resources
```
kubectl delete bucket <bucket-name>
```

## 3. Azure Provider
### 1.Install Azure network provider
```
cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-network
spec:
  package: xpkg.upbound.io/upbound/provider-azure-network:v0.34.0
EOF
```
```
kubectl get providers
```

### 2. Create Azure RBAC
Save this to `azure-credentials.json`:
```
az ad sp create-for-rbac \
--sdk-auth \
--role Owner \
--scopes /subscriptions/
```
Create kubernetes secret:
```
kubectl create secret \
generic azure-secret \
-n crossplane-system \
--from-file=creds=./azure-credentials.json
```
```
kubectl describe secret azure-secret -n crossplane-system
```

### 3. Create provider config
```
cat <<EOF | kubectl apply -f -
apiVersion: azure.upbound.io/v1beta1
metadata:
  name: default
kind: ProviderConfig
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: azure-secret
      key: creds
EOF
```

### 4. Create Azure virtual network
```
cat <<EOF | kubectl create -f -
apiVersion: network.azure.upbound.io/v1beta1
kind: VirtualNetwork
metadata:
  name: crossplane-quickstart-network
spec:
  forProvider:
    addressSpace:
      - 10.0.0.0/16
    location: "Sweden Central"
    resourceGroupName: docs
EOF
```
```
kubectl get virtualnetwork.network
```

### 5. Delete Azure virtual network
```
kubectl delete virtualnetwork.network crossplane-quickstart-network
```
## 3. GCP Provider
### 1.Install GCP Cloud storage provider
```
cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-gcp-storage
spec:
  package: xpkg.upbound.io/upbound/provider-gcp-storage:v0.41.0
EOF
```
```
kubectl get providers
```

### 2. Get service account json file
[GCP_SA](https://cloud.google.com/iam/docs/keys-create-delete)
Create file `gcp-credentials.json`

### 3. Create kubernetes secret 
```
kubectl create secret \
generic gcp-secret \
-n crossplane-system \
--from-file=creds=./gcp-credentials.json
```
```
kubectl describe secret gcp-secret -n crossplane-system
```

### 4. Create provider config
```
cat <<EOF | kubectl apply -f -
apiVersion: gcp.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: default
spec:
  projectID: 
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: gcp-secret
      key: creds
EOF
```

### 5. Create managed resource
```
cat <<EOF | kubectl create -f -
apiVersion: storage.gcp.upbound.io/v1beta1
kind: Bucket
metadata:
  generateName: crossplane-bucket-
  labels:
    docs.crossplane.io/example: provider-gcp
spec:
  forProvider:
    location: US
  providerConfigRef:
    name: default
EOF
```
```
kubectl get bucke
```

### 6. Delete resources
```
kubectl delete bucket --selector docs.crossplane.io/example=provider-gcp
```
