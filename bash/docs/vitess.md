# VITESS KUBERNETES

## 1. Installation
### 1. Prepare repository
```
git clone https://github.com/vitessio/vitess
cd vitess/examples/operator
```
### 2. Apply operator
```
kubectl apply -f operator.yaml
```
### 3. Init vitess cluster
```
kubectl apply -f 101_initial_cluster.yaml
```
```
kubectl get pods
```
### 4. Setup aliases and port forward
```
./pf.sh &
alias vtctldclient="vtctldclient --server=localhost:15999"
alias mysql="mysql -h 127.0.0.1 -P 15306 -u user"
```
### 5. Create schema
```
vtctldclient ApplySchema --sql-file="create_commerce_schema.sql" commerce
vtctldclient ApplyVSchema --vschema-file="vschema_commerce_initial.json" commerce
```
### 6. Delete schema
```
kubectl delete -f 101_initial_cluster.yaml
```
