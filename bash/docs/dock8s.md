# K8S DOCUMENTATION BY HAQUOCDAT
## COMMANDS
## 1 Backup
#### 1. Get certs locations
```
kubectl -n kube-system get pod kube-apiserver-$(hostname) -o=jsonpath='{.spec.containers[0].command}' |jq |grep etcd
```
#### 2. Backup
Replace `$location` with your desire:
```
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key snapshot save $location
```
#### 3. Create data directory
Replace `$datadir` and `$snapshotdir` with your desire:
```
etcdutl snapshot restore --data-dir $datadir $snapshotdir
```

#### 4. Restore
```
vi /etc/kubernetes/manifests/etcd.yaml
```
At `volume`->> `hostPath`->> `etcd-data`

Change `/var/lib/etcd` with your desire `$datadir`
#### 5. Wait a little bit to see result
