# KERMADA KUBERNETES

## 1. Setup with Kind
### 1. Prepare repository
```
git clone https://github.com/karmada-io/karmada
cd karmada
```
### 2. Setup
```
hack/local-up-karmada.sh
```

## 2. Binary
### 1. One click installation
```
curl -s https://raw.githubusercontent.com/karmada-io/karmada/master/hack/install-cli.sh | sudo bash -s kubectl-karmada
```
### 2. Krew
```
kubectl krew install karmada
```
### 3. Build from source code
```
git clone https://github.com/karmada-io/karmada
cd karmada
make kubectl-karmada
```
## 3. High Availability ( HA )
### 1. Stacked controlplane nodes
* where etcd nodes are colocated with control plane nodes
### 2. External etcd nodes
* where etcd runs on separate nodes from the control plane
