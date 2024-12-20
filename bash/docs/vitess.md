# VITESS KUBERNETES

## 1. Components
* etcd
* vttablet
* vtgate
* vtadmin
* vtclient
* vtorc

## 2. Installation on server
```
```

## 3. Installation on kubernetes
### 1. Prepare repository
```bash
git clone https://github.com/vitessio/vitess
cd vitess/examples/operator
```
### 2. Apply operator
```bash
kubectl apply -f operator.yaml
```
### 3. Init vitess cluster
```bash
kubectl apply -f 101_initial_cluster.yaml
```
```bash
kubectl get pods
```
### 4. Setup aliases and port forward
```bash
./pf.sh &
alias vtctldclient="vtctldclient --server=localhost:15999"
alias mysql="mysql -h 127.0.0.1 -P 15306 -u user"
```
### 5. Create schema
```bash
vtctldclient ApplySchema --sql-file="create_commerce_schema.sql" commerce
vtctldclient ApplyVSchema --vschema-file="vschema_commerce_initial.json" commerce
```
### 6. Delete schema
```bash
kubectl delete -f 101_initial_cluster.yaml
```
