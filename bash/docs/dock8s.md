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
mv /etc/kubernetes/manifests/* /etc/kubernetes/
```
```
vi /etc/kubernetes/etcd.yaml
```
At `volume`->> `hostPath`->> `etcd-data`

Change `/var/lib/etcd` with your desire `$datadir`
```
mv /etc/kubernetes/*.yaml /etc/kubernetes/manifests
```
#### 5. Wait a little bit to see result
## 2 Upgrade ( Centos 9 )
#### 1. Check version
```
kubeadm version
kubectl version --short
kubelet --version
```

#### 2. Check kubedm yum package version
```
sudo yum list --showduplicates kubeadm --disableexcludes=kubernetes
```

#### 3. Install newer kubeadm version
```
sudo yum install -y kubeadm-'1.29.x-*' --disableexcludes=kubernetes
```

#### 4. Check upgrade plan
```
sudo kubeadm upgrade apply $version
```

#### 5. Drain node ( mark node unschedulable and evicting the workloads )
```
kubectl drain <node-to-drain> --ignore-daemonsets
```

#### 6. Upgrade kubectl and kubelet
```
sudo yum install -y kubelet-'1.29.x-*' kubectl-'1.29.x-*' --disableexcludes=kubernetes
```

#### 7. Reload 
```
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

#### 8. Uncordon node ( mark node schedulable )
```
kubectl uncordon <node-to-uncordon>
```
