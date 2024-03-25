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
### 1. Basic
#### 1. Deploy an application
* The Deployment instructs Kubernetes `how to create and update instances` of your application. Once you've created a Deployment, the Kubernetes control plane `schedules the application` instances included in that Deployment to run on `individual Nodes` in the cluster.
* Once the application instances are created, a Kubernetes `Deployment controller continuously monitors those instances`. If the `Node hosting` an instance `goes down` or is `deleted`, the Deployment controller `replaces` the instance with `an instance` on `another Node` in the cluster. This provides a `self-healing mechanism` to address machine failure or maintenance.

kubectl basic:
* `kubectl action resource`
* `--help`: You can use `--help` after the subcommand to get additional info about `possible parameters` ( for example: `kubectl get nodes --help`).
* `kubectl version`: Get `server` and `client` version

* Let’s deploy our `first app` on Kubernetes with the `kubectl create deployment` command
* We need to provide the `deployment name` and app `image location` (include the `full repository url` for images hosted `outside Docker Hub`).
```
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```
This `performed` a few things for you:
* searched for a `suitable node` where an instance of the `application could be run`
* `scheduled tha application` to run on `that Node`
* configured the cluster to `reschedule the instance` on a `new Node when needed`

To list deployment:
```
kubectl get deployments
```
* We see that there is `1 deployment` running a `single instance` of your app. The instance is running inside a container on `your node`.
* Pods that are running inside Kubernetes are running on a `private, isolated network`. By default they are `visible` from `other pods` and `services` within the `same Kubernetes cluster`, but `not outside` that network. When we use `kubectl`, we're interacting through an `API endpoint` to `communicate` with our `application`
* The `kubectl proxy` command can `create a proxy` that will `forward communications` into the `cluster-wide, private network.`

```
kubectl proxy
```
```
curl http://localhost:8001/version
```

* We now have a `connection` between our host (the terminal) and the `Kubernetes cluster`. The proxy enables `direct access to the API` from these terminals.
* You can see all those `APIs hosted` through the `proxy endpoint`

First we need to get the Pod name, and we'll store it in the environment variable POD_NAME:
```
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
```

You can access the Pod through the proxied API, by running:
```
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/
```

#### 2. Explore an application
##### 1. Kubernetes Pods
A Pod is a Kubernetes `abstraction` that represents `a group of one or more application containers` (such as Docker), and some `shared resources` for those containers. Those resources include:
* `Shared storage`, `as Volumes`
* `Networking`, as a `unique cluster IP address`
* Information about `how to run` each container, such as the `container image version` or `specific ports` to use
Pods are the `atomic unit` on the Kubernetes platform. When we create a Deployment on Kubernetes, that `Deployment creates Pods` with `containers inside them` (as opposed to creating containers directly). Each Pod is `tied to the Node where it is scheduled`, and remains there `until termination` (according to `restart policy`) or deletion. In case of a Node failure, identical Pods are `scheduled on other available Nodes` in the cluster.

##### 2. Deployment
A Pod always runs on a Node. A Node is a `worker machine` in Kubernetes and may be either a `virtual` or a `physical machine`, depending on the cluster. Each Node is `managed by the control plane`. A Node can have `multiple pods`, and the Kubernetes control plane `automatically handles scheduling the pods across the Nodes in the cluster`. The control plane's automatic scheduling takes into account the `available resources` on each Node.

Every Kubernetes Node runs at least:
* Kubelet, a process responsible for `communication between the Kubernetes control plane and the Node`; it manages the `Pods` and the `containers running on a machine`.
* A container runtime (like Docker) responsible for `pulling the container image from a registry`, `unpacking` the container, and `running` the application.

##### 3. Troubleshooting with kubectl
* `kubectl get` - list resources
* `kubectl describe` - show detailed information about a resource
* `kubectl logs` - print the logs from a container in a pod
* `kubectl exec` - execute a command on a container in a pod
You can use these commands to see `when` applications were deployed, `what` their `current statuses` are, `where` they are `running` and `what` their `configurations` are.

#### 3. Expose application
##### 1. Overview of Kubernetes Services
* Kubernetes Pods are `mortal`. Pods have a `lifecycle`. When a `worker node dies`, the `Pods running` on the Node are `also lost`. A `ReplicaSet` might then dynamically drive the cluster `back` to the `desired state` via the `creation of new Pods` to `keep your application running`. As another example, consider an image-processing backend with 3 replicas. Those replicas are exchangeable; the front-end system should not care about backend replicas or `even if a Pod is lost and recreated`. That said, each Pod in a Kubernetes cluster has `a unique IP address`, even Pods on the same Node, so there needs to be a way of automatically reconciling changes among Pods so that your applications continue to function.
* A Service in Kubernetes is an `abstraction` which defines a `logical set of Pods` and a policy by which to access them. Services enable a loose coupling between dependent Pods. A Service is defined using `YAML or JSON`, like all Kubernetes object manifests. The set of Pods `targeted` by a Service is usually determined by a `label selector`
* Although each Pod has `a unique IP address`, those IPs are `not exposed outside` the cluster without a Service. Services `allow` your applications to `receive traffic`. Services can be `exposed in different ways` by specifying a `type` in the `spec` of the Service:
  * `ClusterIP` (default) - Exposes the Service on an `internal IP` in the cluster. This type makes the Service `only reachable` from `within` the `cluster`.
  * `NodePort` - Exposes the Service on the `same port` of each `selected Node` in the cluster `using NAT`. Makes a Service `accessible from outside the cluster` using `<NodeIP>:<NodePort>`. Superset of ClusterIP.
  * `LoadBalancer` - Creates an `external load balancer` in the `current cloud` (if supported) and `assigns a fixed, external IP` to the Service. Superset of NodePort.
  * `ExternalName` - Maps the Service to the contents of the `externalName field` (e.g. `foo.bar.example.com`), by returning a `CNAME record` with its value. No proxying of any kind is set up. This type requires v1.7 or higher of `kube-dns`, or CoreDNS version 0.0.8 or higher.

* note that there are some use cases with Services that involve `not defining a selector` in the spec. A Service created `without selector` will also `not create the corresponding Endpoints object`. This allows users to `manually map` a Service to `specific endpoints`. Another possibility why there may be no selector is you are strictly using type: `ExternalName`.

##### 2. Services and Labels
* A Service `routes traffic` across a set of Pods. Services are the `abstraction` that allows pods to `die and replicate` in Kubernetes `without impacting` your application.
* Services `match` a set of Pods using `labels and selectors`, a `grouping primitive` that allows `logical operation` on objects in Kubernetes. Labels are `key/value` pairs attached to objects and can be used in any number of ways:
  * Designate objects for `development`, `test`, and `production`
  * Embed `version` tags
  * `Classify` an object using `tags`
Labels can be attached to objects at `creation time` or `later on`. They can be `modified` at `any time`. 

##### 3.  Creating a new Service
let’s list the `current Services` from our cluster:
```
kubectl get services
```

To `create` a new service and `expose` it to `external traffic` we'll use the `expose` command with `NodePort` as parameter
```
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
```

Get services again:
```
kubectl get services
```

We have now a running Service called `kubernetes-bootcamp`. Here we see that the Service received a `unique cluster-IP`, an `internal port` and an `external-IP` (the IP of the Node).
```
kubectl describe services/kubernetes-bootcamp
```

##### 4. Using label
```
kubectl get pods -l app=kubernetes-bootcamp
```
```
kubectl get services -l app=kubernetes-bootcamp
```

To apply a `new label` we use the label subcommand followed by the object type, object name and the new label:
```
kubectl label pods "$POD_NAME" version=v1
```

##### 4. Delete services
```
kubectl delete service -l app=kubernetes-bootcamp
```

```
kubectl get service
```

#### 4. Scale application
##### 1. Scaling overview
* When traffic `increases`, we will need to `scale` the application to keep up with `user demand`.
* Scaling is accomplished by `changing` the `number` of `replicas` in a Deployment.

##### 2. Scaling a Deployment
To `list` your Deployments, use the get deployments subcommand:
```
kubectl get deployments
```
* `NAME` lists the names of the Deployments in the cluster.
* `READY` shows the ratio of CURRENT/DESIRED replicas
* `UP-TO-DATE` displays the number of replicas that have been updated to achieve the desired state.
* `AVAILABLE` displays how many replicas of the application are available to your users.
* `AGE` displays the amount of time that the application has been running.

To see the ReplicaSet created by the Deployment, run:
```
kubectl get rs
```
* `DESIRED` displays the desired number of replicas of the application, which you define when you create the Deployment. This is the desired state.
* `CURRENT` displays how many replicas are currently running.

let’s `scale` the Deployment to `4 replicas`. We’ll use the `kubectl` scale command, followed by the `Deployment type`, name and `desired number` of instances:
```
kubectl scale deployments/kubernetes-bootcamp --replicas=4
```
```
kubectl get deployments
```
```
kubectl describe deployments/kubernetes-bootcamp
```

##### 3. Load Balancing
Let's check that the Service is `load-balancing` the traffic. To find out the `exposed IP` and `Port` we can use the describe service
```
kubectl describe services/kubernetes-bootcamp
```

```
export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')"
echo NODE_PORT=$NODE_PORT
```

##### 4. Scale Down
```
kubectl scale deployments/kubernetes-bootcamp --replicas=2
```

```
kubectl get deployments
```

```
kubectl get pods -o wide
```

#### 5. Update application
##### 1. Updating an application
* Rolling updates allow Deployments' update to take place with `zero downtime` by incrementally updating Pods instances with new ones.
* Similar to `application Scaling`, if a Deployment is `exposed publicly`, the Service will `load-balance` the traffic only to available Pods `during the update`. An available Pod is an instance that is `available` to the users of the application.
* Rolling updates `allow` the following `actions`:
  * Promote an application from `one environment` to `another` (via container image updates)
  * `Rollback` to `previous` versions
  * Continuous Integration and Continuous Delivery of applications with `zero downtime`
##### 2. Update the version of the app
Get deployments:
```
kubectl get deployments
```

Get pods:
```
kubectl get pods
```

Describe pods:
```
kubectl describe pods
```

To `update` the `image` of the application to `version 2`, use the `set image` subcommand, followed by the `deployment name` and the `new image version`:
```
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=docker.io/jocatalin/kubernetes-bootcamp:v2
```

Check the status of the new Pods, and view the old one terminating with the get pods subcommand
```
kubectl get pods
```

##### 3. Verify an update
First, check that the app is `running`. To find the `exposed IP address` and `port`, run the describe service command:
```
kubectl describe services/kubernetes-bootcamp
```

You can also `confirm` the update by `running` the rollout status subcommand:
```
kubectl rollout status deployments/kubernetes-bootcamp
```

```
kubectl describe pods
```

##### 4. Roll back an update
Let’s perform `nother update`, and try to `deploy` an image tagged with `v10`:
```
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10
```
```
kubectl get deployments
```
Notice that the output doesn't list the `desired number` of available Pods. Run the get pods subcommand to list all Pods:
```
kubectl get pods
```
Notice that some of the Pods have a status of `ImagePullBackOff`


Perform rollout:
```
kubectl rollout undo deployments/kubernetes-bootcamp
```
```
kubectl get pods
```
```
kubectl describe pods
```

Delete deployment:
```
kubectl delete deployments/kubernetes-bootcamp services/kubernetes-bootcamp
```
##### 5. Revision
Check rollout history [ revision ]:
```
kubectl rollout history deployments/kubernetes-bootcamp
```
`Default amount` of revision is `10`. You can adjust amount using `revisionHistoryLimit`

To rollback to a `specific revision` use:
```
kubectl rollout undo deployments/kubernetes-bootcamp --to-revision=2
```

## 6. Reference
## 7. Mine
