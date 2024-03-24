# KUBERNETES DEEP DIVE

## 1. Install
### 1. Kubectl
#### 1. Linux
##### 1. Binary
x86-64 latest:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
x86-64 specific version:
```
curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/amd64/kubectl
```

Arm64 latest:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
```
Arm64 specific version:
```
curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/arm64/kubectl
```

Checksum:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client --output=yaml
```

##### 2. Package manager
Yum:
```
# This overwrites any existing configuration in /etc/yum.repos.d/kubernetes.repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF
sudo yum install -y kubectl
```

Apt:
```
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl
```

Suse:
```
# This overwrites any existing configuration in /etc/zypp/repos.d/kubernetes.repo
cat <<EOF | sudo tee /etc/zypp/repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF
sudo zypper install -y kubectl
```

Snap:
```
snap install kubectl --classic
kubectl version --client
```

Homebrew:
```
brew install kubectl
kubectl version --client
```

Test `kubectl`:
```
kubectl cluster-info
kubectl cluster-info dump
```

#### 2. Window
##### 1. Binary
```
curl.exe -LO "https://dl.k8s.io/release/v1.29.2/bin/windows/amd64/kubectl.exe"
curl.exe -LO "https://dl.k8s.io/v1.29.2/bin/windows/amd64/kubectl.exe.sha256"
CertUtil -hashfile kubectl.exe SHA256
type kubectl.exe.sha256
$(Get-FileHash -Algorithm SHA256 .\kubectl.exe).Hash -eq $(Get-Content .\kubectl.exe.sha256)
kubectl version --client --output=yaml
```
##### 2. Package manager
Choco:
```
choco install kubernetes-cli
```

Scoop:
```
scoop install kubectl
```

Winget:
```
winget install -e --id Kubernetes.kubectl
```

### 2. Kubeconvert
#### 1. Linux
Amd:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert.sha256"
echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
kubectl convert --help
```

Arm:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl-convert"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl-convert.sha256"
echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
kubectl convert --help
```

#### 2. Window
```
curl.exe -LO "https://dl.k8s.io/release/v1.29.2/bin/windows/amd64/kubectl-convert.exe"
curl.exe -LO "https://dl.k8s.io/v1.29.2/bin/windows/amd64/kubectl-convert.exe.sha256"
CertUtil -hashfile kubectl-convert.exe SHA256
type kubectl-convert.exe.sha256
$($(CertUtil -hashfile .\kubectl-convert.exe SHA256)[1] -replace " ", "") -eq $(type .\kubectl-convert.exe.sha256)
```

## 2. Best practices
### 1. Large cluster
Limits:
* No more than 110 pods per node
* No more than 5,000 nodes
* No more than 150,000 total pods
* No more than 300,000 total containers


To avoid running into cloud provider `quota issues`, when creating a cluster with many nodes, consider:

Requesting a quota `increase` for cloud resources such as:
* Computer instances
* CPUs
* Storage volumes
* In-use IP addresses
* Packet filtering rule sets
* Number of load balancers
* Network subnets
* Log streams

Control plane components:
* Typically you would run `one or two control plane` instances `per failure zone`, scaling those instances `vertically first` and then `scaling horizontally after reaching` the point of falling returns to (vertical) scale.
* You should run at least one instance per failure zone to provide fault-tolerance. Kubernetes nodes do not automatically steer traffic towards control-plane endpoints that are in the same failure zone; however, your cloud provider might have its own mechanisms to do this.
* Using a managed `load balancer`, you configure the load balancer to `send traffic` that `originates from the kubelet and Pods in failure zone A`, and direct that traffic only to the control plane hosts that are also in zone A. If a single control-plane host or endpoint failure zone A goes offline, that means that all the control-plane traffic for nodes in zone A is now being sent between zones. Running `multiple control plane hosts` in `each zone` makes that outcome less likely.

etcd storage:
* To `improve performance` of large clusters, you can `store` Event objects in a `separate dedicated etcd instance`.
* start and configure additional etcd instance
* configure the `API server` to use it for `storing events`

Addon resources:
* resource limits help to `minimize` the `impact of memory leaks` and other ways that `pods and containers` can `impact on other components`.
```
  ...
  containers:
  - name: fluentd-cloud-logging
    image: fluent/fluentd-kubernetes-daemonset:v1
    resources:
      limits:
        cpu: 100m
        memory: 200Mi
```
* To avoid running into cluster addon resource issues, when creating a cluster with many nodes, consider the following:
  * `Some addons scale vertically` - there is `one replica` of the addon for the cluster or serving `a whole failure zone`. For these addons, `increase requests and limits as you scale out your cluster`.
  * Many addons scale horizontally - you add capacity by running more pods - but with a very large cluster you may also need to raise CPU or memory limits slightly. The `VerticalPodAutoscaler` can run in recommender mode to provide suggested figures for requests and limits.
  * Some addons run as `one copy per node`, controlled by a DaemonSet: for example, a `node-level log aggregator`. Similar to the case with horizontally-scaled addons, you may also need to `raise CPU or memory limits` slightly

### 2. Multiple zones
Control plane behavior:
* Kubernetes is designed so that a `single Kubernetes cluster can run across multiple failure zones, regions`. Within a region, each zone offers the same APIs and services.
* select at least `three failure zones and replicate each individual control plane component (API server, scheduler, etcd, cluster controller manager) across at least three failure zones`

Node behavior:
* Kubernetes automatically `spreads the Pods for workload resources` (such as Deployment or StatefulSet) across `different nodes` in a cluster. This spreading helps `reduce the impact of failures`.
* you can use `node labels` in conjunction with Pod topology spread constraints to `control how Pods are spread across your cluster` among fault domains: `regions, zones`, and even `specific nodes`. These hints enable the scheduler to place Pods for `better expected availability`, reducing the risk that a `correlated failure affects your whole workload`.
* you can use `node labels` in conjunction with Pod topology spread constraints to `control how Pods are spread across your cluster` among fault domains: `regions, zones`, and even `specific nodes`. These hints enable the scheduler to place Pods for `better expected availability`, reducing the risk that a `correlated failure affects your whole workload`.
* For example, you can set a `constraint` to make sure that the `3 replicas of a StatefulSet` are all running in `different zones to each other`, whenever that is feasible. You can define this declaratively without explicitly defining which availability zones are in use for each workload.

Distributing nodes across zones:
* Kubernetes' core `does not` create nodes for you; you need to do that `yourself`, or use a tool such as the `Cluster API` to manage nodes on your behalf.
* Using tools such as the `Cluster API` you can define `sets of machines` to run as `worker nodes` for your cluster across `multiple failure domains`, and `rules to automatically heal the cluster` in case of `whole-zone service disruption`

Storage access for zones:
* When persistent volumes are created, Kubernetes automatically `adds zone labels` to any PersistentVolumes that are `linked to a specific zone`. The scheduler then ensures, through its NoVolumeZoneConflict predicate, that `pods which claim a given PersistentVolume` are only `placed into the same zone as that volume`.

Networking:
* By itself, Kubernetes `does not include zone-aware networking`. You can use a `network plugin` to configure cluster networking, and that network solution might have zone-specific elements. For example, if your cloud provider supports Services with type=LoadBalancer, the `load balancer` might only send traffic to Pods running in the `same zone as the load balancer` element processing a given connection. Check your cloud provider's documentation for details.
* For custom or on-premises deployments, similar considerations apply. `Service` and `Ingress` behavior, including handling of `different failure zones`, does vary `depending` on exactly `how your cluster is set up`.

Fault recovery:
* When you set up your cluster, you might also need to consider whether and how your setup can `restore service` if `all the failure zones in a region` go `off-line` at the `same time`. For example, do you rely on there being at least one node able to run Pods in a zone?
* Make sure that any `cluster-critical` repair work does not rely on there being at least one healthy node in your cluster. For example: `if all nodes are unhealthy`, you might need to run a `repair Job with a special toleration` so that the repair can complete enough to bring at least one node into service.

### 3. Validate node setup
#### 1. Node Conformance Test
`Node conformance test` is a `containerized test framework` that provides a `system verification` and functionality test for a node. The test validates whether the node `meets the minimum requirements for Kubernetes`; a node that `passes` the test is `qualified to join` a Kubernetes cluster

#### 2. Node Prerequisite
At a minimum, the node should have the following daemons installed:
* Kubelet
* CRI-compatible container runtimes such as `Docker`, `Containerd` and `CRI-O`

#### 3. Running Node Conformance Test
```
# $CONFIG_DIR is the pod manifest path of your Kubelet.
# $LOG_DIR is the test output path.
sudo docker run -it --rm --privileged --net=host \
  -v /:/rootfs -v $CONFIG_DIR:$CONFIG_DIR -v $LOG_DIR:/var/result \
  registry.k8s.io/node-test:0.2
```

### 4. Enforcing Pod Security Standards
```
```

### 5. PKI certificates and requirements
Kubernetes requires `PKI certificates` for `authentication over TLS`. If you install Kubernetes with `kubeadm`, the certificates that your cluster requires are `automatically generated`. You can also `generate your own certificates` -- for example, to keep your private keys more secure by not storing them on the API server. 

#### 1. How certificates are used by your cluster
* Client certificates for the kubelet to authenticate to the API server
* Kubelet server certificates for the API server to talk to the kubelets
* Server certificate for the API server endpoint
* Client certificates for administrators of the cluster to authenticate to the API server
* Client certificates for the API server to talk to the kubelets
* Client certificate for the API server to talk to etcd
* Client certificate/kubeconfig for the controller manager to talk to the API server
* Client certificate/kubeconfig for the scheduler to talk to the API server.
* Client and server certificates for the front-proxy

#### 2. Where certificates are stored
If you install Kubernetes with `kubeadm`, most certificates are `stored` in `/etc/kubernetes/pki`. All paths in this documentation are relative to that directory, with the exception of `user account certificates` which kubeadm places in `/etc/kubernetes`

#### 3. Configure certificates manually 
If you don't want kubeadm to generate the required certificates, you can create them using a `single root CA` or by providing `all certificates`

| path | Default CN | description |
| ca.crt,key | kubernetes-ca | Kubernetes general CA |
| etcd/ca.crt,key | etcd-ca | For all etcd-related functions |
| front-proxy-ca.crt,key | kubernetes-front-proxy-ca | For the front-end proxy |

```
/etc/kubernetes/pki/ca.crt
/etc/kubernetes/pki/ca.key
/etc/kubernetes/pki/etcd/ca.crt
/etc/kubernetes/pki/etcd/ca.key
/etc/kubernetes/pki/front-proxy-ca.crt
/etc/kubernetes/pki/front-proxy-ca.key
```

## 3. Concept
## 4. Task
## 5. Tutorial
## 6. Reference
## 7. Mine
