# K8S DOCUMENTATION BY HAQUOCDAT

## HELP
If you want more info about specific command, just add `-h` at the end:
Eg:
```bash
kubectl create role -h
```
Output:
```bash
Create a role with single rule.

Examples:
  # Create a role named "pod-reader" that allows user to perform "get", "watch" and "list" on pods
  kubectl create role pod-reader --verb=get --verb=list --verb=watch --resource=pods

  # Create a role named "pod-reader" with ResourceName specified
  kubectl create role pod-reader --verb=get --resource=pods --resource-name=readablepod --resource-name=anotherpod

  # Create a role named "foo" with API Group specified
  kubectl create role foo --verb=get,list,watch --resource=rs.apps

  # Create a role named "foo" with SubResource specified
  kubectl create role foo --verb=get,list,watch --resource=pods,pods/status

Options:
    --allow-missing-template-keys=true:
        If true, ignore any errors in templates when a field or map key is missing in the template. Only applies to golang and jsonpath output formats.

    --dry-run='none':
        Must be "none", "server", or "client". If client strategy, only print the object that would be sent, without sending it. If server strategy, submit server-side request without persisting the resource.

    --field-manager='kubectl-create':
        Name of the manager used to track field ownership.

    -o, --output='':
        Output format. One of: (json, yaml, name, go-template, go-template-file, template, templatefile, jsonpath, jsonpath-as-json, jsonpath-file).

    --resource=[]:
        Resource that the rule applies to

    --resource-name=[]:
        Resource in the white list that the rule applies to, repeat this flag for multiple items

    --save-config=false:
        If true, the configuration of current object will be saved in its annotation. Otherwise, the annotation will be unchanged. This flag is useful when you want to perform kubectl apply on this object in the future.

    --show-managed-fields=false:
        If true, keep the managedFields when printing objects in JSON or YAML format.

    --template='':
        Template string or path to template file to use when -o=go-template, -o=go-template-file. The template format is golang templates [http://golang.org/pkg/text/template/#pkg-overview].

    --validate='strict':
        Must be one of: strict (or true), warn, ignore (or false).              "true" or "strict" wil:
```
## WHY KUBERNETES
It’s one of only a `few companies` in the world that runs `hundreds of thousands of servers` and has had t`o deal with managing deployments` on such a `massive scale`
### 1. HELPING DEVELOPERS FOCUS ON THE CORE APP FEATURES
* This includes things such as `service discovery`, `scaling`, `load-balancing`, `self-healing`, and even `leader election`
* `Application developers` can therefore `focus on implementing` the `actual features` of the applications and `not waste time figuring out how to integrate them with the infrastructure`.

### 2. HELPING OPS TEAMS ACHIEVE BETTER RESOURCE UTILIZATION
* your application `doesn’t care` which `node it’s running on`, Kubernetes can `relocate` the app `at any time`, and by mixing and matching apps, achieve far `better resource utilization` than is possible with manual scheduling.

### 3. Benefit
If you have Kubernetes deployed on all your servers, the ops team `doesn’t need to deal with deploying` your apps anymore. Because a `containerized application already contains all it needs to run`, the `system administrators don’t need to install anything` to deploy and run the app. On any node where Kubernetes is deployed, Kubernetes can run the app `immediately without any help from the sysadmins`.

#### 1. SIMPLIFYING APPLICATION DEPLOYMENT
* Because Kubernetes `exposes all its worker nodes` as a `single deployment platform`, application developers can start `deploying applications on their own` and `don’t need to know anything about the servers` that make up the cluster. 
* In essence, all the nodes are now a `single bunch of computational resources` that are `waiting` for `applications` to `consume them`. A developer `doesn’t usually care what kind of server the application is running on`, as long as the server can provide the application with adequate system resources. 
* For example, one of your apps may require being run on a system with SSDs instead of HDDs, while other apps run fine on HDDs. In such cases, you obviously want to ensure that particular app is always scheduled to a node with an SSD
* Without using Kubernetes, the sysadmin would select one specific node that has an SSD and deploy the app there. But when using Kubernetes, instead of selecting a specific node where your app should be run, it’s more appropriate to tell Kubernetes to only choose among nodes with an SSD
#### 2. ACHIEVING BETTER UTILIZATION OF HARDWARE
* By setting up Kubernetes on your servers and using it to run your apps instead of running them manually, you’ve decoupled your app from the infrastructure. When you tell Kubernetes to run your application, you’re letting it choose the most appropriate node to run your application on based on the description of the application’s resource requirements and the available resources on each node. 
* By using containers and not tying the app down to a specific node in your cluster, you’re allowing the app to freely move around the cluster at any time, so the different app components running on the cluster can be mixed and matched to be packed tightly onto the cluster nodes. This ensures the node’s hardware resources are utilized as best as possible.
* The ability to move applications around the cluster at any time allows Kubernetes to utilize the infrastructure much better than what you can achieve manually. Humans aren’t good at finding optimal combinations, especially when the number of all possible options is huge, such as when you have many application components and many server nodes they can be deployed on. Computers can obviously perform this work much better and faster than humans. 

#### 3. HEALTH CHECKING AND SELF-HEALING
* Having a system that allows moving an application across the cluster at any time is also valuable in the event of server failures. As your cluster size increases, you’ll deal with failing computer components ever more frequently. 
* Kubernetes monitors your app components and the nodes they run on and automatically reschedules them to other nodes in the event of a node failure. This frees the ops team from having to migrate app components manually and allows the team to immediately focus on fixing the node itself and returning it to the pool of available hardware resources instead of focusing on relocating the app.
* If your infrastructure has enough spare resources to allow normal system operation even without the failed node, the ops team doesn’t even need to react to the failure immediately, such as at 3 a.m. They can sleep tight and deal with the failed node during regular work hours.

#### 4. AUTOMATIC SCALING
* Using Kubernetes to manage your deployed applications also means the ops team doesn’t need to constantly monitor the load of individual applications to react to sudden load spikes. As previously mentioned, Kubernetes can be told to monitor the resources used by each application and to keep adjusting the number of running instances of each application. 
* If Kubernetes is running on cloud infrastructure, where adding additional nodes is as easy as requesting them through the cloud provider’s API, Kubernetes can even automatically scale the whole cluster size up or down based on the needs of the deployed applications.

#### 5. SIMPLIFYING APPLICATION DEVELOPMENT
* The features described in the previous section mostly benefit the operations team. But what about the developers? Does Kubernetes bring anything to their table? It definitely does.
* If you turn back to the fact that apps run in the same environment both during development and in production, this has a big effect on when bugs are discovered. We all agree the sooner you discover a bug, the easier it is to fix it, and fixing it requires less work. It’s the developers who do the fixing, so this means less work for them. 
* Then there’s the fact that developers don’t need to implement features that they would usually implement. This includes discovery of services and/or peers in a clustered application. Kubernetes does this instead of the app. Usually, the app only needs to look up certain environment variables or perform a DNS lookup. If that’s not enough, the application can query the Kubernetes API server directly to get that and/or other information. Querying the Kubernetes API server like that can even save developers from having to implement complicated mechanisms such as leader election.
* As a final example of what Kubernetes brings to the table, you also need to consider the increase in confidence developers will feel knowing that when a new version of their app is going to be rolled out, Kubernetes can automatically detect if the new version is bad and stop its rollout immediately. This increase in confidence usually accelerates the continuous delivery of apps, which benefits the whole organization.

## ARCHITECTURE
### 1. Control plane
The `master node`, which hosts the `Kubernetes Control Plane` that `controls and manages` the `whole Kubernetes system`
* The `Kubernetes API Server`, which `you` and the `other Control Plane components` `communicate with`
* The `Scheduler`, which `schedules your apps` (assigns a `worker node` to each `deployable component` of your application) 
* The `Controller Manager`, which performs `cluster-level functions`, such as `replicating components`, keeping `track of worker nodes`, handling `node failures`, and so on
* `etcd`, a reliable `distributed data store` that `persistently stores` the `cluster configuration`.

### 2. Worker node
`Worker nodes` that `run` the `actual applications you deploy`
* `Docker`, `rkt`, or `other container runtime` ( Cri-O,...) , which `runs your containers`
* The `Kubelet`, which `talks to the API server` and `manages containers on its node`
* The `Kubernetes Service Proxy` (kube-proxy), which `load-balances` network `traffic` between `application` components

### 1. Checking the status of the Control Plane components
```bash
kubectl get componentstatuses
```

### 2. how these components communicate
* Kubernetes `system components` `communicate only` with `the API server`. They `don’t talk` to `each other directly`. The `API server` is the `only component` that `communicates with etcd`. `None` of the `other components` communicate with `etcd directly`, but `instead modify` the `cluster state` by `talking to the API server`.

### 3. how components are run
* The `Control Plane components`, as well as `kube-proxy`, can either be `deployed` on the `system directly` or they `can run as pods`.
* The `Kubelet` is the `only component` that `always runs` as a `regular system component`, and it’s the `Kubelet` that then `runs all` the `other components as pods`. To run the `Control Plane components` as `pods`, the `Kubelet` is also `deployed` on the `master`. The next listing shows pods in the `kube-system namespace` in a `cluster created with kubeadm`, which is explained in appendix B

```bash
kubectl get po -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system
```

### 3. How Kubernetes uses etcd
* `Pods`, `ReplicationControllers`, `Services`, `Secrets`, and so on—need to be stored somewhere in a `persistent` manner so their `manifests survive` API server restarts and failures. For this, Kubernetes uses `etcd`, which is a `fast`, `distributed`, and consistent `key-value store`. Because it’s `distributed`, you can run `more than one` `etcd instance` to provide both `high availability` and `better performance`.
* The `only component` that `talks to etcd directly` is the `Kubernetes API server`. All other components `read` and `write` data to `etcd indirectly` through `the API server`. This brings a few benefits, among them a more `robust optimistic locking` system as well as `validation`; and, by abstracting away the actual storage mechanism from all the other components, it’s much simpler to replace it in the future. It’s worth emphasizing that `etcd` is the only place Kubernetes stores `cluster state` and `metadata`

### 4. how resources are stored in etcd
* Kubernetes stores all its data in etcd under `/registry`. The following listing shows a `list of keys` stored under `/registry`.
```bash
etcdctl ls /registry
```

Pods:
```bash
etcdctl ls /registry/pods
```

Pods in default namespace:
```bash
etcdctl ls /registry/pods/default
```

Specific pods in default namespace:
```bash
etcdctl get /registry/pods/default/kubia-xxxx
```
### 5. ensuring consistency when etcd is clustered
* For ensuring `high availability,` you’ll usually run `more than a single` instance of `etcd`. `Multiple etcd` instances will need to `remain consistent`. Such a `distributed system` needs to reach a consensus on what the actual state is. `etcd` uses the `RAFT consensus algorithm` to achieve this, which ensures that at any given moment, each node’s state is either what the majority of the `nodes` agrees is the `current state` or is one of the previously agreed upon states. 

### 6. What the API server does
* The `Kubernetes API server` is the central component used by all other components and by clients, such as `kubectl`. It provides a `CRUD` (`Create`, `Read`, `Update`, `Delete`) interface for `querying` and `modifying` the `cluster state` over a `RESTful API`. It stores that `state` in `etcd`.

#### 1. authenticating the client with authentication plugins
* First, the API server needs to `authenticate` the `client` sending the request. This is `performed by one` or more `authentication plugins` configured in `the API server`. The API server calls these plugins in turn, until one of them `determines who` is `sending the request`. It does this by inspecting the HTTP request. 

#### 2. authorizing the client with authorization plugins
* Besides `authentication plugins`, `the API server` is also configured to use one or `more authorization plugins`. Their job is to determine whether the authenticated user can perform the requested action on the requested resource. For example, `when creating pods`, `the API server` consults `all authorization` plugins in turn, to determine whether the user can create pods in the `requested namespace`. As soon as a plugin says the user can perform the action, the API server progresses to the next stage.

#### 3. validating and/or modifying the resource in the request with admission control plugins
* If the request is trying to `create`, `modify`, or `delete` a `resource`, the request is sent through `Admission Control.` Again, the server is configured with `multiple Admission Control plugins`. These plugins `can modify` the resource for `different reasons`. They may `initialize fields missing` from the `resource specification` to the `configured default values` or even `override them`. They may even `modify` other related resources, which aren’t in the request, and can also `reject a request` for whatever reason. The resource passes through all `Admission Control` plugins.
* `NOTE`: When the request is `only` trying to `read data`, the request `doesn’t go` through the `Admission Control`.
* Examples of Admission Control plugins include:
  * `AlwaysPullImages` Overrides the `pod’s imagePullPolicy` to `Always`, forcing the image to be pulled `every time` the pod is deployed.
  * `ServiceAccount` Applies the `default service account` to pods that `don’t specify` it `explicitly`.
  * `NamespaceLifecycle` Prevents `creation of pods` in `namespaces` that are in the `process of being deleted`, as well as in `non-existing` namespaces.
  * `ResourceQuota` Ensures pods in a `certain namespace` only use as `much CPU and memory` as has been allotted to the namespace.

#### 4. validating the resource and storing it persistently
* After letting the `request pass` through all the `Admission Control` plugins, the API server then `validates the object`, stores it in `etcd`, and returns a `response` to the client.

### 7. How API Server notifies clients of resource change
* 1. GET /.../pods?watch=true [ `Client` ->> `API Server` ]
* 2. POST /.../pods/pod-xyz [ `kubectl` ->> `API Server` ]
* Update object in etcd [ `API Server` ->> `ETCD` ]
* Modification notification [ `ETCD` ->> `API Server` ]
* Send updated object to all watchers [ `API Server` ->> `Clients` ]

### 8. Understanding the Scheduler
#### 1. understanding the default scheduling algorithm
The selection of a node can be broken down into two parts:
* Filtering the `list of all nodes` to `obtain` a `list` of `acceptable nodes` the `pod can be scheduled` to.
* `Prioritizing` the `acceptable nodes` and `choosing the best one`. If `multiple nodes` have the `highest score`, `round-robin` is used to ensure pods are `deployed across all` of them evenly.

#### 2. finding acceptable nodes
To `determine which nodes` are `acceptable` for the `pod`, the Scheduler passes each node through a `list of configured` predicate functions. These check various things such as:
* Can the `node fulfill` the `pod’s requests` for `hardware resources`?
* Is the node `running out of resources` (is it reporting a memory or a disk pressure condition)? 
* If the `pod requests` to be `scheduled to a specific node` (by name), is this the node?  Does the node have a `label` that `matches` the `node selector` in the `pod specification` (if one is defined)?
* If the `pod requests` to be bound to a `specific host port`, is that port `already taken` on this node `or not`? 
* If the `pod requests` a `certain type of volume`, can `this volume` be `mounted` for this pod `on this node`, or is `another pod` on the node `already` using the `same volume`?
* Does the `pod tolerate` the `taints of the node`?
* Does the pod `specify node` and/or `pod affinity` or `anti-affinity` rules? If yes, would scheduling the pod to this node break those rules?

### 9. advanced scheduling of pods
### 10. using multiple schedulers
* Instead of running a `single Scheduler` in `the cluster`, you can run `multiple Schedulers`. Then, `for each pod`, you `specify` the Scheduler that should schedule this particular pod by setting the `schedulerName` `property` in the `pod spec`.
* Pods `without` this `property` set are scheduled using the `default Scheduler`, and so are pods with `schedulerName` set to `default-scheduler`. All other pods are ignored by the default Scheduler, so they need to be scheduled either manually or by `another Scheduler` watching for such pods. 

### 11. Introducing the controllers running in the Controller Manager
As previously mentioned, the API server `doesn’t do anything` except store resources in etcd and `notify clients` about the change. The `Scheduler` only `assigns a node` to the pod, so you need `other active components` to make sure the `actual state` of the `system converges` toward the desired state, as specified in the resources deployed through the API server. This work is done by `controllers` running inside the `Controller Manager`. 
* Replication Manager (a controller for ReplicationController resources)
* ReplicaSet, DaemonSet, and Job controllers
* Deployment controllers
* Stateful controllers
* Node controllers
* Service controllers
* Endpoint controllers
* Namespace controllers
* Persistent controllers
* Other controllers

### 12. understanding what controllers do and how they do it
All these `controllers` operate on the `API objects` through the API server. They `don’t communicate` with the `Kubelets directly` or issue any kind of `instructions` to them. In fact, they don’t even know Kubelets exist. After a controller `updates a resource` in `the API server`, the `Kubelets` and `Kubernetes Service Proxies`, also oblivious of the controllers’ existence, `perform their work`, such as `spinning up` a pod’s containers and `attaching network storage` to them, or in the case of services, setting up the `actual load balancing` across pods. 

### 13. What the Kubelet does
* In a nutshell, the Kubelet is the component `responsible` for `everything running` on a `worker node`. `Its initial job` is to `register the node` it’s running on by creating a `Node resource` in `the API server`. Then it needs to `continuously monitor` `the API server` for Pods that have been `scheduled to the node`, and `start` the `pod’s containers`. It does this by telling the `configured container runtime` (which is `Docker`, `CoreOS`’ `rkt`, or something else) to `run a container` from a `specific container image`. The Kubelet then `constantly monitors` running containers and reports their `status`, `events`, and `resource consumption` to the API server. 
* The Kubelet is also the component that runs the container `liveness probes`, `restarting` containers when the `probes fail`. Lastly, it `terminates` containers when their Pod is `deleted` `from the API server` and `notifies` the `server` that the `pod has terminated`.

### 14. The role of the Kubernetes Service Proxy
* Beside the `Kubelet`, `every worker node` also runs the `kube-proxy`, whose purpose is to make sure `clients can connect` to the `services` you define through the `Kubernetes API`. The `kube-proxy` makes sure `connections` to the `service IP` and `port` end up at one of the `pods backing that service` (or other, non-pod service endpoints). When a service is backed by more than one pod, the `proxy performs load balancing` across those pods. 
* The `initial implementation of` the `kube-proxy` was the `userspace` proxy. It used an `actual server` process to `accept connections` and proxy them to the pods. To intercept connections destined to the `service IPs`, the proxy configured `iptables rules` (`iptables` is the tool for managing the `Linux kernel’s packet filtering` features) to `redirect` the `connections` to the `proxy server`.
* The `kube-proxy` `got its name` because it was an `actual proxy`, but the current, much better performing implementation only uses `iptables rules` to redirect packets to a randomly selected backend pod without passing them through an `actual proxy server`. This mode is called the iptables proxy mode

### 14. Chain of events
  Imagine you prepared the `YAML file` containing the `Deployment manifest` and you’re about to submit it to Kubernetes through `kubectl`. `kubectl` sends the `manifest` to the `Kubernetes API server` in an `HTTP POST` request. `The API server` validates the `Deployment specification`, stores it in `etcd`, and returns a response to `kubectl`. Now a chain of events starts to unfold.
* Creates Deployment resource
* Notification through watch
* Creates ReplicaSet
* Notification
* Creates pod
* Notification through watch
* Assigns pod to node
* Notification through watch
* Tells Docker to run containers
* Runs containers

get real events:
```bash
kubectl get events --watch
```

### 14. Inter-pod networking
By now, you know that each pod gets its own `unique IP address` and can communicate `with all other pods` through a `flat`, `NAT-less network`. How exactly does Kubernetes achieve this? In short, it doesn’t. The network is set up by the `system administrator` or by a `Container Network Interface` (CNI) plugin, not by Kubernetes itself. 

### 15. What the network must be like
* Kubernetes doesn’t require you to use a `specific networking technology`, but it does mandate that the pods (or to be more precise, their containers) `can communicate` with `each other`, regardless if they’re running on the `same worker node` `or not`. The network the pods use to communicate must be such that the `IP address` a pod sees as its own is the exact same address that all other pods see as the `IP address` of the pod in question. 
* When `pod A` connects to (sends a `network packet` to) `pod B`, the `source IP` `pod B` sees must be the `same IP` that `pod A` sees as its own. There should be no `network address translation` (NAT) performed in between—the packet sent by `pod A` must reach `pod B` with both the source and destination address unchanged.

### 1. enabling communication between pods on the same node
* Before the infrastructure container is `started`, a `virtual Ethernet interface pair` (a `veth pair`) is created for the `container`. `One interface` of the `pair` remains in the `host’s namespace` (you’ll see it listed as `vethXXX` when you run `ifconfig` on the `node`), whereas the other is moved into the `container’s network namespace` and renamed `eth0`. The `two virtual interfaces` are like `two ends` of `a pipe` (or like `two network devices` connected by `an Ethernet cable`)—what goes in on one side comes out on the other, and vice-versa. 
* The interface in the `host’s network` namespace is attached to a `network bridge` that the container runtime is configured to use. The `eth0` interface in the container is `assigned an IP address` from the bridge’s address range. Anything that an application running inside the container sends to the eth0 network interface (the one in the container’s namespace), comes out at the other veth interface in the host’s namespace and is sent to the bridge. This means it can be received by any network interface that’s connected to the bridge. 

### 2. enabling communication between pods on the different node
* For pods on different nodes to `communicate`, the `bridges` need to be `connected somehow`.
* You have `many ways` to `connect bridges` on `different nodes`. This can be done with `overlay` or `underlay` networks or by `regular layer 3` routing, which we’ll look at next.
* You know `pod IP addresses` must be `unique` across the `whole cluster`, so the `bridges across` the nodes must use `non-overlapping` address ranges to prevent pods on `different nodes` from getting the `same IP`. In the example shown in figure 11.16, the bridge on `node A` is using the `10.1.1.0/24 IP range` and the bridge on `node B` is using `10.1.2.0/24`, which ensures no IP address `conflicts` exist.

### 15. How kube-proxy uses iptables
* When a service is created in the `API server`, the `virtual IP address` is `assigned` to it `immediately`. Soon afterward, `the API server` notifies all `kube-proxy` agents running on the `worker nodes` that a new Service has been created. Then, each `kube-proxy` makes that service `addressable on the node` it’s running on. It does this by `setting up` a `few iptables rules`, which make sure `each packet destined` for the `service IP/port` pair is `intercepted` and its `destination address modified`, so the packet is redirected to one of the pods backing the service. 
* Besides `watching` the `API server` for `changes` to Services, `kube-proxy` also `watches` for `changes` to `Endpoints` objects. Let me refresh your memory, as it’s easy to forget they even exist, because you `rarely` create them `manually`. An Endpoints object holds the `IP/port` pairs of all the `pods` that `back` the `service` (an `IP/port` pair can also point to something other than a pod). That’s why the `kube-proxy` must also watch all Endpoints objects. After all, an Endpoints object `changes every time` a new backing pod is `created` or `deleted`, and when the `pod’s readiness` status changes or the `pod’s labels change` and it falls in or out of scope of the service. 

## BEHIND THE SCENE
#### 1. Docker build
#### 2. Docker push
#### 3. Image is pushed to Container Registry
#### 4. Run Kubectl...
#### 5. Kubectl issue REST call
#### 6. Pod created and schedule to worker node
#### 7. Kubelet is notified
#### 8. Kubelet instruct container runtime run the image

## RESOURCES
### 1. Pod
#### 1. Introduction
* The pod has its own unique private IP address and hostname.
* A Pod can have multiple containers
* All containers of a pod run on the same node. A pod never spans two nodes.

#### 2. WHY MULTIPLE CONTAINERS ARE BETTER THAN ONE CONTAINER RUNNING MULTIPLE PROCESSES
* Imagine an app consisting of `multiple processes` that either `communicate through IPC (Inter-Process Communication)` or through `locally stored files`, which requires them to run on the `same machine`. Because in Kubernetes you always run `processes in containers` and `each container is much like an isolated machine`, you may think it makes sense to run `multiple processes` in a `single container`, but you `shouldn’t do that`. 
* Containers are designed to run only a `single process per container` (unless the process `itself spawns child processes`). If you run `multiple unrelated processes` in a `single container`, it is your `responsibility` to `keep all those processes running`, `manage their logs`, and so on. For example, you’d have to include a `mechanism for automatically restarting individual processes if they crash`. Also, all those processes would log to the `same standard output`, so you’d have a `hard time figuring out what process logged what`. 
* A `pod of containers` allows you to run `closely related processes` together and provide them with (almost) the `same environment` as if they were all running in a `single container`, while keeping them `somewhat isolated`. This way, you get the best of both worlds. You can take advantage of `all the features containers provide`, while at the same time giving the processes the illusion of running together.
* Because `all containers` of a pod run under the `same Network and UTS namespaces` (we’re talking about Linux namespaces here), they `all share the same hostname and network interfaces`. Similarly, `all containers` of a pod `run under the same IPC namespace` and can `communicate through IPC`. In the latest Kubernetes and Docker versions, they `can also share the same PID namespace`, but that feature `isn’t enabled by default`. 
* When containers of the same pod use `separate PID namespaces`, you `only see` the `container’s own processes` when running `ps aux` in the container.
* But when it comes to the `filesystem`, things are a `little different`. Because most of the `container’s filesystem` comes from the container image, by `default`, the filesystem of each container is `fully isolated` from other containers. However, it’s `possible` to have them `share file directories` using a Kubernetes concept called a `Volume`

#### 3. CONTAINERS SHARE THE SAME IP AND PORT SPACE
* One thing to stress here is that because `containers in a pod` run in the `same Network namespace`, they share the `same IP address` and `port space`. This means `processes running in containers` of the same pod need to take care `not to bind to the same port numbers` or `they’ll run into port conflicts`. But this only concerns containers in the same pod. Containers of `different pods can never run into port conflicts`, because each pod has a `separate port space`. All the containers in a pod also have the same loopback network interface, so a container can communicate with other containers in the same pod through localhost.

#### 4. INTRODUCING THE FLAT INTER-POD NETWORK
* All pods in a Kubernetes cluster reside in a single flat, shared, network-address space, which means every pod can access every other pod at the other pod’s IP address. No NAT (Network Address Translation) gateways exist between them. When two pods send network packets between each other, they’ll each see the actual IP address of the other as the source IP in the packet

#### 5. DECIDING WHEN TO USE MULTIPLE CONTAINERS IN A POD
* Do they need to be run together or can they run on different hosts? 
* Do they represent a single whole or are they independent components? 
* Must they be scaled together or individually? 

#### 6. Use kubectl explain
```bash
kubectl explain pods
```
```bash
kubectl explain pod.spec
```

Command
```bash
kubectl create pod firstpod --image=nginx
```
Yaml:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```
Apply yaml:
```bash
kubectl apply -f $POD_FILE
```

Command
```bash
kubectl create pod firstpod --image=nginx
```
Yaml:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```
Apply yaml:
```bash
kubectl apply -f $POD_FILE
```
Get pod:
```bash
kubectl get pod
```

Selection node:
```yaml
spec:
  nodeSelector:
    gpu: "true"  
```

## ReplicaController
* A `ReplicationController` is a Kubernetes resource that ensures `its pods` are always kept `running`. If the `pod disappears` for any reason, such as in the event of a `node disappearing` from the cluster or because the pod was `evicted` from the `node`, the `ReplicationController` `notices` the `missing pod` and `creates` a `replacement pod`. 
* A `ReplicationController` constantly `monitors` the `list` of `running pods` and makes sure the `actual number` of pods of a “type” `always matches` the `desired number`. If too `few` such pods are `running`, it `creates` `new replicas` from a `pod template`. If `too many` such pods are running, it `removes` the `excess replicas`

Excess reason:
* Someone creates a pod of the same type manually.
* Someone changes an existing pod’s “type.”
* Someone decreases the desired number of pods, and so on.

### 1. three parts of a replicationcontroller
* A `label selector`, which determines `what pods` are in the ReplicationController’s scope
* A `replica count`, which specifies the `desired number` of pods that should be `running`
* A `pod template`, which is used when `creating new pod` replicas

### 2. benefits of using a replicationcontroller
* It makes sure a pod (or multiple pod replicas) is `always running` by `starting` a `new pod` when an `existing one` `goes missing`.
* When a `cluster node fails`, it `creates replacement replicas` for `all the pods` that `were running` on the `failed node` (those that were `under` the `ReplicationController’s control`).
* It enables easy `horizontal scaling` of pods—both `manual` and `automatic`

```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: kubia
spec:
  replicas: 3
  selector:
    app: kubia 
template:
  metadata:
    labels:
      app: kubia
  spec:
    containers:
    - name: kubia
      image: luksa/kubia
      ports:
      - containerPort: 8080 
```

Apply resources:
```bash
kubectl create -f kubia-rc.yaml
```

### 3. Add additional label of pod
It does not effect tk RC

### 4. Change label of pod
After changed label, RC recognize that there are too few pods is running so it create new pod that match template

### 5. Change label selector
it would make `all the pods` fall out of the `scope` of the `ReplicationController`, which would result in it `creating new pods`

### 6. Change pod template
Changing a ReplicationController’s `pod template` only `affects pods` `created afterward` and has `no effect` on `existing pods`

### 7. Scale RC
```bash
kubectl scale rc kubia --replicas=10
```

### 8. Scale RC by edit
```bash
kubectl edit rc kubia
```
When you `save the` file and `close the editor`, the `ReplicationController is updated` and `it immediately scales` the number of pods to `10`:

### 9. Delete RC only and pods still alive
Deleting a replication controller with `--cascade=false` leaves pods `unmanaged`.
```bash
kubectl delete rc kubia --cascade=false
```

Conclusion:
* You usually won’t create them `directly`, but instead have them `created automatically` when you create the `higher-level` Deployment resource.

## 2. ReplicaSet
### 1. Keeping the pod healthy
* pods represent the `basic deployable unit` in Kubernetes. You know how to `create, supervise, and manage them manually`. But in `real-world` use cases, you want your `deployments to stay up and running automatically` and `remain healthy without any manual intervention`. To do this, you almost `never create pods directly`. Instead, you `create other types of resources`, such as `ReplicationControllers` or `Deployments`, which then create and manage the `actual pods`.

### 2. Liveness probe
Kubernetes can probe a container using one of the three mechanisms:
* An HTTP GET probe performs an HTTP GET request on the container’s IP address, a port and path you specify. If the probe receives a response 2xx or 3xx, it is living
```yaml
apiVersion: v1
kind: pod
metadata:
  name: kubia-liveness
spec: 
  containers:
   - image: luksa/kubia-unhealthy
     name: kubia
     livenessProbe:
       httpGet:
       path: /
       port: 8080  
```
 
```bash
kubectl get po kubia-liveness
```
The `RESTARTS` column shows that the pod’s container has `been restarted once` (if you wait another `minute and a half`, it gets `restarted again`, and then the `cycle continues indefinitely`).

Get log from previous run:
```bash
kubectl logs mypod --previous
```

Add delay to http probe
```yaml
initialDelaySeconds: 15
```

* A TCP Socket probe tries to open a TCP connection to the specified port of the container. If the connection is established successfully, the probe is successful. Otherwise, the container is restarted
* An Exec probe executes an arbitrary command inside the container and checks the command’s exit status code. If the status code is 0, the probe is successful. All other codes are considered failures. 

### Readiness probes
* An `Exec` probe, where a `process is executed`. The container’s status is `determined` by the `process’ exit status code`.
* An `HTTP GET` probe, which sends an `HTTP GET request` to the container and the `HTTP status code` of the response determines whether the container is `ready or not`.
* A `TCP Socket` probe, which opens a `TCP connection` to a `specified port` of the container. If the connection is `established`, the container is `considered ready`
```yaml
apiVersion: v1
kind: ReplicationController
...
spec:
 ...
template:
   ...
   spec:
     containers:
     - name: kubia
       image: luksa/kubia
       readinessProbe:
         exec:
           command:
             - ls
             - /var/ready
```
* The `readiness probe` will periodically `perform` the `command` `ls /var/`ready inside the container. The ls command `returns exit code zero` if the `file exists`, or a `non-zero` exit code `otherwise.` If the `file exists`, the readiness probe will `succeed`; `otherwise`, it will fail. 

### 1. Differences from ReplicaController
* The `main improvements` of R`eplicaSets` over `ReplicationControllers` are their `more expressive` `label selectors`. You intentionally used the simpler matchLabels selector in the first ReplicaSet example to see that ReplicaSets are no different from ReplicationControllers. Now, you’ll rewrite the selector to use the `more powerful matchExpressions` property, as shown in the following listing.
```yaml
selector:
  matchExpressions:
  - key: app
    operator: In
    values:
    - kubia  
```
* You can `add additional expressions` to the selector. As in the example, each expression must contain a key, an operator, and possibly (depending on the operator) a list of values. You’ll see four valid operators:
  * `In`—Label’s value `must match one` of the `specified values`.
  * `NotIn`—Label’s value `must not match any` of the `specified values`.
  * `Exists`—Pod must `include` a label with the `specified key` (the value isn’t important). When using this operator, you `shouldn’t specify` the values field.
  * `DoesNotExist`—Pod `must not include` a label with the `specified key`. The values property must not be specified.

Full command:
```bash
kubectl create replicaset firstrs --image=nginx
```

Short command:
```bash
kubectl create rs firstrs--image=nginx
```

Yaml:
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: us-docker.pkg.dev/google-samples/containers/gke/gb-frontend:v5
```

Apply yaml:
```bash
kubectl apply -f $REPLICASET_FILE
```

Get replicaset:
```bash
kubectl get rs
```
## 3. Deployment
##### 1. Updating an application
* Rolling updates allow Deployments' update to take place with `zero downtime` by incrementally updating Pods instances with new ones.
* Similar to `application Scaling`, if a Deployment is `exposed publicly`, the Service will `load-balance` the traffic only to available Pods `during the update`. An available Pod is an instance that is `available` to the users of the application.
* Rolling updates `allow` the following `actions`:
  * Promote an application from `one environment` to `another` (via container image updates)
  * `Rollback` to `previous` versions
  * Continuous Integration and Continuous Delivery of applications with `zero downtime`
##### 2. replacing old pods with new ones by scaling the two replicationcontrollers
* `Step 1`: Scaling kubia-v2 up to `1`
* `Step 2`: Scaling kubia-v1 down to `2`

##### 3. Update the version of the app
Get deployments:
```bash
kubectl get deployments
```

Get pods:
```bash
kubectl get pods
```

Describe pods:
```bash
kubectl describe pods
```

To `update` the `image` of the application to `version 2`, use the `set image` subcommand, followed by the `deployment name` and the `new image version`:
```bash
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=docker.io/jocatalin/kubernetes-bootcamp:v2
```

Check the status of the new Pods, and view the old one terminating with the get pods subcommand
```bash
kubectl get pods
```

##### 4. Verify an update
First, check that the app is `running`. To find the `exposed IP address` and `port`, run the describe service command:
```bash
kubectl describe services/kubernetes-bootcamp
```

You can also `confirm` the update by `running` the rollout status subcommand:
```bash
kubectl rollout status deployments/kubernetes-bootcamp
```

```bash
kubectl describe pods
```

##### 5. Roll back an update
Let’s perform `nother update`, and try to `deploy` an image tagged with `v10`:
```bash
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10
```
```bash
kubectl get deployments
```
Notice that the output doesn't list the `desired number` of available Pods. Run the get pods subcommand to list all Pods:
```bash
kubectl get pods
```
Notice that some of the Pods have a status of `ImagePullBackOff`


Perform rollout:
```bash
kubectl rollout undo deployments/kubernetes-bootcamp
```
```bash
kubectl get pods
```
```bash
kubectl describe pods
```

Delete deployment:
```bash
kubectl delete deployments/kubernetes-bootcamp services/kubernetes-bootcamp
```
##### 6. Revision
Check rollout history [ revision ]:
```bash
kubectl rollout history deployments/kubernetes-bootcamp
```
`Default amount` of revision is `10`. You can adjust amount using `revisionHistoryLimit`

To rollback to a `specific revision` use:
```bash
kubectl rollout undo deployments/kubernetes-bootcamp --to-revision=2
```

##### 7. maxsurge and maxunavailable properties
```yaml
spec:
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
    type: RollingUpdate
```
* `maxSurge`: Determines `how many pod instances` you allow to `exist above` the `desired replica count` configured on the Deployment. It `defaults to 25%`, so there can be at most `25% more` pod instances than the `desired count`. If the desired `replica count` is set to `four`, there will `never` be `more than five pod` instances running `at the same time` during an update. When `converting a percentage` to an `absolute number`, the `number is rounded up`. Instead of a `percentage`, the `value` can also be an `absolute value` (for example, one or two additional pods can be allowed).
* `maxUnavailable`: Determines `how many pod` instances can be `unavailable` relative to the `desired replica count` during the update. It also `defaults to 25%`, so the number of `available pod instances` must `never` fall `below 75%` of the `desired replica count`. Here, when `converting` a `percentage` to an `absolute number`, the number is `rounded down`. If the `desired replica count` is set to four and the `percentage is 25%`, only one pod can be `unavailable`. There will always be `at least three` pod instances available to serve requests during the whole rollout. As with maxSurge, you can also specify an `absolute value` instead of a `percentage`.

##### 8. Pausing the rollout process
After the `bad experience` with `version 3` of `your app`, imagine you’ve now `fixed the bug` and `pushed version 4` of your image. You’re a little apprehensive about rolling it out across all your pods the way you did before. What you want is to run a `single v4 pod` next to your `existing v2 pods` and see how it behaves with `only a fraction` of `all your users`. Then, once you’re sure `everything’s okay`, you can `replace all` the old pods with new ones. 
```bash
kubectl set image deployment kubia nodejs=luksa/kubia:v4
```

```bash
kubectl rollout pause deployment kubia
```

##### 9. kubectl rollout resume deployment kubia
```bash
kubectl rollout resume deployment kubia
```

##### 10. Blocking rollouts of bad versions
```yaml
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: kubia
spec:
  replicas: 3
  minReadySeconds: 10
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
        type: RollingUpdate
  template:
    metadata:
      name: kubia
      labels:
        app: kubia
    spec:
      containers:
      - image: luksa/kubia:v3
        name: nodejs
        readinessProbe:
          periodSeconds: 1
            httpGet:
            path: /
            port: 8080
```
* The fact that the `deployment` is `stuck` is a `good thing`, because if it had `continued replacing` the `old pods` with the `new ones`, you’d end up with a completely non-working service, like you did when you first `rolled out version 3`, when you weren’t using the `readiness probe`. But now, with the `readiness probe` in place, there was virtually `no negative impact` on your `users`. `A few users` may have experienced the internal server error, but that’s not as big of a problem as if the rollout had `replaced all pods` with the faulty version 3.

##### 11. configuring a deadline for the rollout
```yaml
spec:
  progressDeadlineSeconds: 10m
```

Eg:
```bash
kubectl create deployment firstdpl --image=nginx --replicas=3
```
## 4. DaemonSets
* Both `ReplicationControllers` and `ReplicaSets` are used for running a `specific number` of pods `deployed anywhere` in the `Kubernetes cluster`. But certain cases exist when you want `a pod` to run `on each` and `every node` in `the cluster` 
* `For example`, you’ll want to run a `log collector` and a `resource monitor` on `every node`. Another good example is `Kubernetes’ own kube-proxy process`, which needs to run on `all nodes` to `make services work`.

### 1. Using a DaemonSet to run a pod on every node
* To run a pod on `all cluster nodes`, you create a DaemonSet object, which is much like a `ReplicationController` or a `ReplicaSet`, except that pods created by a DaemonSet already have a `target node specified` and `skip` the `Kubernetes Scheduler`. They `aren’t scattered` around the cluster `randomly`. 
* If a `node goes down`, the DaemonSet `doesn’t cause` the pod to be `created elsewhere`. But when a `new node` is `added` to the cluster, the DaemonSet `immediately deploys` a `new pod` instance to it. It also does the same if `someone inadvertently deletes one` of the pods, leaving the node without the DaemonSet’s pod. Like a ReplicaSet, a DaemonSet creates the pod from the pod template configured in it.

### 2. Using a DaemonSet to run a pod on certain node
* A DaemonSet deploys pods to `all nodes` in the cluster, unless you specify that the pods should only run on a `subset of all the nodes`. This is done by specifying the `nodeSelector property` in the `pod template`, which is part of the DaemonSet definition (similar to the pod template in a ReplicaSet or ReplicationController). 

Example:
```yaml
apiVersion: apps/v1beta2
kind: DaemonSet
metadata:
  name: ssd-monitor
spec:
  selector:
    matchLabels:
      app: ssd-monitor
template:
  metadata:
    labels:
      app: ssd-monitor
  spec:
    nodeSelector:
    disk: ssd
    containers:
    - name: main
      image: luksa/ssd-monitor
```
* You’re defining a DaemonSet that will run a pod with a single container based on the `luksa/ssd-monitor` container image. An instance of this pod will be created for `each node` that has the `disk=ssd` label.

### 3. adding the required label to your node(s)
Now, add the `disk=ssd` label to one of `your nodes` like this:
```bash
kubectl label node NewNode disk=ssd
```
If you have `multiple nodes` and you add the `same label` to further nodes, you’ll see the DaemonSet `spin up pods` for `each of them`. 

### 4. Removing  the required label to your node(s)
imagine you’ve made a `mistake` and have `mislabeled` one of the nodes. It has a `spinning disk drive`, `not an SSD`. What `happens` if you `change` the `node’s label`?

```bash
kubectl label node minikube disk=hdd --overwrite
```
The pod is being `terminated`. But you knew that was going to happen, right? This wraps up your exploration of DaemonSets, so you may want to delete your `ssd-monitor DaemonSet`. If you still have any other daemon pods running, you’ll see that deleting the DaemonSet deletes those pods as well. 

Eg:
```bash
kubectl create daemonsets firstdms --image=fluentd
```
## 5. StatefulSets
Eg:
```bash
kubectl create statefulsets firststs --image=mysql --replicas=3
```
## 6. Service
### 1. Problem of Pod's network
* Pods are `ephemeral`. They may `come and go` at any time, whether it’s because a pod is `removed from a node` to make r`oom for other pods`, because `someone scaled down` the number of pods, or because a `cluster node has failed`.
* Kubernetes assigns `an IP address` to a pod after the pod has `been scheduled to` a node and before it’s started—Clients thus can’t know the IP address of the server pod up front.
* Horizontal scaling means `multiple pods` may provide the same service—Each of those pods `has its own IP address`. Clients shouldn’t care how many pods are backing the service and what their IPs are. They shouldn’t have to keep a list of all the individual IPs of pods. Instead, all those pods should be accessible through a single IP address.

* A Kubernetes Service is a resource you create to make a `single`, `constant point` of `entry` to a `group of pods` providing the `same service`. Each service has `an IP address` and `port` that` never change` while the `service exists`
* Clients can `open connections` to that `IP` and `port`, and those connections are then `routed` to one of the `pods backing that service`. This way, clients of a service `don’t need to know` the `location` of `individual pods` providing the service, `allowing those pods` to be `moved around the cluster` at any time. 
* Connections to the service are `load-balanced` `across all` the `backing pods`.

### 2. Testing your service within cluster
* The obvious way is to `create a pod` that will `send the request` to the `service’s clustera IP` and log the response. You can then examine the pod’s log to see what the service’s response was.
* You can `ssh` into one of the Kubernetes `nodes` and use the `curl` command.
* You can execute the `curl` command inside one of your `existing pods` through the `kubectl exec` command.

### 3. configuring session affinity on the service
* If you execute the `same command` a `few more times`, you should `hit a different` pod with `every invocation`, because the service proxy normally forwards `each connection` to a randomly `selected backing pod`, even if the connections are coming from the `same client`. 
* If, on the `other hand`, you want `all requests made` by a `certain client` to be `redirected` to the `same pod every time`, you can set the `service’s sessionAffinity` property to `ClientIP (`instead of `None`, which is the `default`), as shown in the following listing.

### 4. discovering services through environment variables
* When a pod is `started`, Kubernetes `initializes` a `set of environment variables` pointing to `each service` that `exists at that moment`. If you `create the service` `before` creating the `client pods`, processes in those pods `can get the IP address and port` of the service by `inspecting` their `environment variables`. 
```bash
kubectl exec kubia-xxxxx env
```

Output:
```bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=kubia-3inly
KUBERNETES_SERVICE_HOST=10.111.240.1
KUBERNETES_SERVICE_PORT=443
...
KUBIA_SERVICE_HOST=10.111.249.153
KUBIA_SERVICE_PORT=80
...
```

### 5. discovering services through dns
* the pod runs a `DNS server`, which all other pods `running` in the cluster are `automatically configured` to use (Kubernetes does that by modifying each container’s `/etc/resole.conf` file)
* `Each` service gets `a DNS entry` in the `internal DNS server`, and client pods that know the `name of the service` can access it through its `fully qualified domain name` (FQDN) instead of `resorting` to `environment variables`

### 6. connecting to the service through its fqdn
* To revisit the `frontend-backend` example, a frontend pod can `connect` to the `backenddatabase` service by `opening a connection` to the `following FQDN`
```bash
backend-database.default.svc.cluster.local
```
* `backend-database` corresponds to the `service name`, `default` stands for the `namespace` the service is defined in, and `svc.cluster.local` is a `onfigurable` cluster domain suffix used in all cluster local service names. 

### 7. running a shell in a pod’s container
```bash
curl http://kubia.default.svc.cluster.local
```

```bash
curl http://kubia.default
```

```bash
curl http://kubia
```

```bash
cat /etc/resolv.conf
```

### 8. understanding why you can’t ping a service ip
Inside container:
```bash
ping kubia
```
* `curl-ing` the `service works`, but `pinging` it `doesn’t`. That’s because the service’s `cluster IP` is a `virtual IP`, and only has meaning when combined with the service port

### 9. Endpoint
* An Endpoints resource (yes, plural) is a `list of IP addresses` and `ports` exposing a service. The Endpoints resource is like any other` Kubernetes resource`, so you can `display its basic` info with `kubectl` get:
```bash
kubectl get endpoints kubia
```

### 10. Manually configuring service endpoints
Service:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: external-service
    spec:
      ports:  - port: 80    
```

Endpoint:
```yaml
apiVersion: v1
kind: Endpoints
metadata:
  name: external-service
subsets:
  - addresses:
    - ip: 11.11.11.11
    - ip: 22.22.22.22
    ports:
    - port: 80     
```

### 11. Creating an alias for an external service
```yaml
apiVersion: v1
kind: Service
metadata:
  name: external-service
spec:
  type: ExternalName
  externalName: someapi.somecompany.com
    ports:
    - port: 80
```

### 12. preventing unnecessary network hops
```yaml
spec:
  externalTrafficPolicy: Local
```

### 13. Creating a headless service
* You’ve seen how services can be used to provide a `stable IP address` allowing clients to `connect to pods` (or other `endpoints`) backing each service. `Each connection` to the service is `forwarded` to one randomly selected backing pod. But what if the client needs to `connect to all` of `those pods`?
* For a client to connect to `all pods`, it needs to `figure out` the the `IP` of `each individual pod`.
```yaml
apiVersion: v1
kind: Service
metadata:
  name: kubia-headless
spec:
  clusterIP: None
    ports:
    - port: 80
      targetPort: 8080
      selector:
        app: kubia
```

### 14. understanding dns a records returned for a headless service
```bash
kubectl exec dnsutils nslookup kubia-headless
```

### 15. Discovering all pods—even those that aren’t ready
```yaml
kind: Service
metadata:
 annotations: service.alpha.kubernetes.io/tolerate-unready-endpoints: "true"
```

```yaml
apiVersion: v1
kind: Service
spec:
  sessionAffinity: ClientIP
```

yaml:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```
## 7. Ingress
### 1. Configuring Ingress to handle TLS traffic

creating a tls certificate for the ingress:
```bash
openssl genrsa -out tls.key 2048
openssl req -new -x509 -key tls.key -out tls.cert -days 360 -subj /CN=kubia.example.com
```

Create secret like this:
```bash
kubectl create secret tls tls-secret --cert=tls.cert --key=tls.key
```

Signing certificates through the CertificateSigningRequest resource:
```bash
kubectl certificate approve <name of the CSR>
```

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: kubia
spec:
  tls:
  - hosts:
    - kubia.example.com
    secretName: tls-secret
  rules:
  - host: kubia.example.com
    http:
      paths:
      - path: /
        backend:
          serviceName: kubia-nodeport
          servicePort: 80
```

Curl 
```bash
curl -k -v https://kubia.example.com/kubia
```

yaml:
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: minimal-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx-example
  rules:
  - http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: test
            port:
              number: 80
```
## 8. Network Policy
yaml:
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: test-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: db
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24
    - namespaceSelector:
        matchLabels:
          project: myproject
    - podSelector:
        matchLabels:
          role: frontend
    ports:
    - protocol: TCP
      port: 6379
  egress:
  - to:
    - ipBlock:
        cidr: 10.0.0.0/24
    ports:
    - protocol: TCP
      port: 5978
```
## 9. Service Account
* Each pod is `associated` with a `single ServiceAccount` in the `pod’s namespace` [ you cannot bind a pod with other namespace's serviceaacount ]

### 1. creating a serviceaccount
Command line:
```bash
kubectl create serviceaccount foo
```

Describe sa:
```bash
kubectl describe sa foo
```
* You can see that a `custom token Secret` has been created and associated with the `ServiceAccount`. If you look at the `Secret’s data` with `kubectl` describe secret `foo-token-xxxxx`, you’ll see it contains the same items (the `CA certificate`, `namespace`, and `token`) as the `default ServiceAccount’s does` (the token itself will obviously be different), as shown in the following listing.

Inspect custom service account secret:
```bash
kubectl describe secret foo-token-xxxxx
```

### 2. understanding a serviceaccount’s mountable secrets
* By `default`, a pod can `mount any Secret` it wants. But the `pod’s ServiceAccount` can be configured to `only allow` the pod to `mount Secrets` that are `listed` as `mountable Secrets` on the `ServiceAccount`. To `enable` this feature, the ServiceAccount `must contain` the following `annotation`: `kubernetes.io/enforce-mountable-secrets="true". `
* If the ServiceAccount is `annotated` with `this annotation`, any pods using it `can mount only` the `ServiceAccount’s mountable` Secrets they can’t use any other Secret.

### 3. understanding a serviceaccount’s image pull secrets
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
imagePullSecrets:
- name: my-dockerhub-secret
```

### 4. Assigning a ServiceAccount to a pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: curl-custom-sa
spec:
  serviceAccountName: foo
  containers:
  - name: main
    image: tutum/curl
    command: ["sleep", "9999999"]
  - name: ambassador
    image: luksa/kubectl-proxy:1.6.2
```

Test:
```bash
kubectl exec -it curl-custom-sa -c main 
cat /var/run/secrets/kubernetes.io/serviceaccount/token
```

```bash
kubectl exec -it curl-custom-sa -c main curl localhost:8001/api/v1/pods
```

yaml:
```yaml
piVersion: v1
kind: ServiceAccount
metadata:
  creationTimestamp: 2019-06-16T00:12:34Z
  name: build-robot
  namespace: default
  resourceVersion: "272500"
  uid: 721ab723-13bc-11e5-aec2-42010af0021e
```
## 10. Role
### 1. Enable RBAC
```bash
kubectl delete clusterrolebinding permissive-binding
```


```yaml
piVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

Verbs: [ get, watch, list, create, update, delete, patch ]

## 11. RoleBinding
### 1. including serviceaccounts from other namespaces in a rolebinding
```yaml
subjects:
- kind: ServiceAccount
  name: default
  namespace: bar  
```

### 2. allowing access to cluster-level resources
* A `RoleBinding` referencing a `ClusterRole` `doesn’t grant access` to `clusterlevel` resources.

yaml:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
# This role binding allows "jane" to read pods in the "default" namespace.
# You need to already have a Role named "pod-reader" in that namespace.
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
# You can specify more than one "subject"
- kind: User
  name: jane # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  # "roleRef" specifies the binding to a Role / ClusterRole
  kind: Role #this must be Role or ClusterRole
  name: pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```

## 12. ClusterRole
* A `ClusterRoleBinding` and `ClusterRole` must be used to `grant access` to `clusterlevel` resources.
* A `ClusterRoleBinding` and `ClusterRole` grants `permission` to resources across `all namespaces`.

### 1. allowing access to non-resource url
```bash
kubectl get clusterrole system:discovery -o yaml
kubectl get clusterrolebinding system:discovery -o yaml
```

### 2. using clusterroles to grant access to resources in specific namespaces
* ClusterRoles `don’t always` need to be `bound` with `cluster-level ClusterRoleBindings`. They can also be `bound` with `regular`, `namespaced RoleBindings`. You’ve already started looking at predefined ClusterRoles, so let’s look at another one called view, which is shown in the following listing.
```bash
kubectl get clusterrole view -o yaml
```

### 3. Understanding default ClusterRoles and ClusterRoleBindings
* Kubernetes comes with a `default set` of `ClusterRoles` and `ClusterRoleBindings`, which are `updated every time` the `API server starts`. This `ensures` `all` the `default roles` and `bindings` are `recreated` if you `mistakenly` `delete` them or if a `newer version` of Kubernetes uses a `different configuration` of cluster `roles` and `bindings`.
```bash
kubectl get clusterrolebindings
```

```bash
kubectl get clusterroles
```

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  #
  # at the HTTP level, the name of the resource for accessing Secret
  # objects is "secrets"
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
```
## 13. ClusterRoleBinding
yaml:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
# This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
- kind: Group
  name: manager # Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```
## 14. Config
Regardless if you’re using a `ConfigMap` to store `configuration data` or not, you can configure your apps by
* Passing `command-line arguments` to containers
* Setting `custom environment variables` for each container
* Mounting `configuration files` into containers through a `special type of volume`

### 1. Passing command-line arguments to containers
* In all the `examples so far`, you’ve created containers that ran the `default command` defined in the `container image`, but Kubernetes allows `overriding the command` as part of the `pod’s container` definition when you want to run a `different executable` instead of the `one specified in the image`, or want to run it with a `different set` of `command-line arguments`.
Example bash:
```bash
#!/bin/bash
trap "exit" SIGINT
INTERVAL=$1
echo Configured to generate new fortune every $INTERVAL seconds
mkdir -p /var/htdocs
while :
do
 echo $(date) Writing fortune to /var/htdocs/index.html
 /usr/games/fortune > /var/htdocs/index.html
sleep $INTERVAL
done
```

Example dockerfile:
```dockerfile
FROM ubuntu:latest
RUN apt-get update ; apt-get -y install fortune
ADD fortuneloop.sh /bin/fortuneloop.sh
ENTRYPOINT ["/bin/fortuneloop.sh"]
CMD ["10"]  
```

Build:
```bash
docker build -t docker.io/luksa/fortune:args .
docker push docker.io/luksa/fortune:args
```

Run:
```bash
docker run -it docker.io/luksa/fortune:args
```
```bash
Configured to generate new fortune every 15 secon
```

### 2. Overriding the command and arguments in Kubernetes
```yaml
kind: Pod
spec:
  containers:
  - image: some/image
    command: ["/bin/command"]
    args: ["arg1", "arg2", "arg3"]
```
* In `most cases`, you’ll only `set custom arguments` and `rarely override` the command (except in `general-purpose` images such as `busybox`, which `doesn’t define` an `ENTRYPOINT` at all). 

### 3. running the fortune pod with a custom interval
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune2s 
spec:
  containers:
  - image: luksa/fortune:args
    args: ["2"]
    name: html-generator
    volumeMounts:
    - name: html
      mountPath: /var/htdo
```

### 4. Setting environment variables for a container
```yaml
kind: Pod
spec:
  containers:
  - image: luksa/fortune:env
    env:
    - name: INTERVAL
      value: "30"
    name: html-generator
```

### 5. Referring to other environment variables in a variable’s value
```yaml
env:
- name: FIRST_VAR
  value: "foo"
- name: SECOND_VAR
  value: "$(FIRST_VAR)bar"
```

### 6. Creating a ConfigMap
### 1. From literal
* `ConfigMap keys` must be a `valid DNS subdomain` (they may only contain `alphanumeric characters`, `dashes`, `underscores`, and `dots`). They may optionally `include a leading dot`.
```bash
kubectl create configmap fortune-config --from-literal=sleep-interval=25
```
```bash
kubectl create configmap myconfigmap --from-literal=foo=bar --from-literal=bar=baz --from-literal=one=two
```

### 2. creating a configmap entry from the contents of a file
```bash
kubectl create configmap my-config --from-file=config-file.conf
```

### 3. creating a configmap from files in a directory
```bash
kubectl create configmap my-config --from-file=/path/to/dir
```

### 4. combining different options
```bash
kubectl create configmap my-config  --from-file=foo.json --from-file=bar=foobar.conf --from-file=config-opts/ --from-literal=some=thing
```

### 5. Passing a ConfigMap entry to a container as an environment variable
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune-env-from-configmap
spec:
  containers:
  - image: luksa/fortune:env
    env:
    - name: INTERVAL
      valueFrom:
        configMapKeyRef:
          name: fortune-config
          key: sleep-interval
```
#### 1. referencing non-existing configmaps in a pod
* You might wonder what happens if the referenced ConfigMap doesn’t exist when you create the pod. Kubernetes schedules the pod normally and tries to run its containers. The container referencing the non-existing ConfigMap will fail to start, but the other container will start normally. If you then create the missing ConfigMap, the failed container is started without requiring you to recreate the pod.

### 6. Passing all entries of a ConfigMap as environment variables at once
* When your ConfigMap contains `more than` just a `few entries`, it becomes `tedious` and `error-prone` to create `environment variables` from each entry `individually`. Luckily, Kubernetes version 1.6 provides a way to expose `all entries` of a ConfigMap as `environment variables`
```yaml
spec:
  containers:
  - image: some-image
    envFrom:
    - prefix: CONFIG_
      configMapRef:
        name: my-config-map
```

* NOTE: The prefix is optional, so if you omit it the environment variables will have the same name as the keys. 

### 7. Passing a ConfigMap entry as a command-line argument
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune-args-from-configmap
spec:
  containers:
  - image: luksa/fortune:args
    env:
    - name: INTERVAL
      valueFrom:
        configMapKeyRef:
          name: fortune-config
          key: sleep-interval
    args: ["$(INTERVAL)"] 

```
* You defined the `environment variable` `exactly` as you did before, but then you used the `$(ENV_VARIABLE_NAME)` syntax to have Kubernetes `inject` the `value` of the `variable` into the `argument`. 

### 8. Using a configMap volume to expose ConfigMap entries as files
* Passing configuration options as `environment variables` or `command-line arguments` is usually used for `short variable values`. A ConfigMap, as you’ve seen, can also contain `whole config files`. When you want to expose those to the container, you can use one of the `special volume types`
Nginx config file:
```nginx
server {
 listen              80;
 server_name         www.kubia-example.com;

 gzip on;
 gzip_types text/plain application/xml;

 location / {
   root   /usr/share/nginx/html;
   index  index.html index.htm;
  }
}
```

Create configmap:
```bash
kubectl create configmap nginx-config --from-file=configmap-files
```

### 9. using the configmap's entries in a volume 

Map as volume:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - image: nginx:alpine
      name: web-server
      volumeMounts:
        - mountPath: /etc/nginx/conf.d 
          name: config
          readOnly: true
  volumes:
    - name: config 
      configMap:
        name: nginx-config
```

### 10. setting the file permissions for files in a configmap volume
```yaml
volumes:
  - name: config
    configMap:
      name: fortune-config
      defaultMode: "6600"   
```

### 11. Updating an app’s config without having to restart the app
* Be aware that as I’m writing this, it takes a `surprisingly long time` for the files to be `updated after` you update the ConfigMap (it can take up to `one whole minute`).
```bash
kubectl edit configmap fortune-config
```
```bash
kubectl exec fortune-configmap-volume -c web-server
cat /etc/nginx/conf.d/my-nginx-config.conf
```

Restart nginx:
```bash
kubectl exec fortune-configmap-volume -c web-server -- nginx -s reload
```

### 12. understanding how the files are updated atomically
* You may wonder what happens if an app can `detect config file changes` on its own and reloads them before Kubernetes has finished `updating all` the `files` in the `configMap volume`. Luckily, this can’t happen, because all the files are `updated atomically`, which means all updates occur at once
```bash
kubectl exec -it fortune-configmap-volume -c web-server -- ls -lA /etc/nginx/conf.d
```
* As you can see, the files in the `mounted configMap volume` are `symbolic links` pointing to `files` in the `..data` dir. The `..data` dir is also a `symbolic link` pointing to a directory called `..4984_09_04_something`. `When` the ConfigMap is `updated,` Kubernetes creates a `new directory like this`, writes all the files to it, and then `re-links` the `..data symbolic link` to the `new directory`, effectively `changing all files` `at once`

### 13. understanding that files mounted into existing directories don’t get updated
* For now, if you need to `add an individual file` and have it `updated` when you `update` its `source ConfigMap`, one workaround is to mount the `whole volume` into a `different directory` and then create a `symbolic link` pointing to the `file` in question. The `symlink` can either be created in the `container image itself`, or you `could` create the `symlink` when the container starts.

### 14. understanding the consequences of updating a configmap
 * If the app does support `reloading`, `modifying` the ConfigMap usually isn’t such a big deal, but you do need to be `aware` that because files in the ConfigMap volumes `aren’t updated synchronously` across `all running instances`, the files in `individual pods` may be `out of sync` for up to a `whole minute`.

yaml:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5    
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```

Reference:
```yaml
- image: 080196/hello-cm
    name: hello-cm
    ports:
      - containerPort: 3000
    envFrom: # using envFrom instead of env
      - configMapRef: # referencing the ConfigMap
          name: postgres-config # name of the ConfigMap
        prefix: POSTGRES_ # All environment variables will be prefixed with POSTGRES_
```

Map as volume:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - image: nginx:alpine
      name: web-server
      volumeMounts:
        - mountPath: /etc/nginx/conf.d # mount content of the configmap to container
          name: config
          readOnly: true
  volumes:
    - name: config # volume use configmap as content
      configMap:
        name: nginx-config # configmap name
```

Other way to map as volume:
```yaml
...
  volumes:
    - name: config
      configMap:
        name: nginx-config
        items:
          - key: my-nginx-config.conf
            path: gzip.conf # change name of file from my-nginx-config.conf to gzip.conf
```

```yaml
...
  containers:
    - image: nginx:alpine
      name: web-server
      volumeMounts:
        - name: config
          mountPath: /etc/nginx/conf.d/gzip.conf # mount content of my-nginx-config.conf file to gzip.conf file
          subPath: my-nginx-config.conf # Instead of mounting the whole volume, you’re only mounting the my-nginx-config.conf
          readOnly: true
...
```

```yaml
...
  containers:
    - image: nginx:alpine
      name: web-server
      volumeMounts:
        - name: config
          mountPath: /etc/nginx/conf.d/gzip.conf # mount content of my-nginx-config.conf file to gzip.conf file
          subPath: my-nginx-config.conf # Instead of mounting the whole volume, you’re only mounting the my-nginx-config.conf
          readOnly: true
...
```
```yaml
...
  volumes:
    - name: config # volume use configmap as content
      configMap:
        name: nginx-config # configmap name
        defaultMode: "0600"
```

## 15. Secret
### 1. Introduction 
* To `store and distribute` such `information`, Kubernetes provides a `separate object` called a `Secret`. `Secrets` are much `like ConfigMaps` they’re also maps that hold `key-value pairs`. They can be used the same way as a `ConfigMap`. You can
* Pass `Secret entries` to the container as `environment variables`
* Expose Secret entries as `files in a volume`

Kubernetes helps `keep` your Secrets `safe` by making sure each Secret is only `distributed` to the `nodes` that run the `pods` that `need access` to the `Secret`. Also, on the `nodes themselves`, Secrets are `always stored in memory` and `never written` to `physical storage`, which would require `wiping the disks` after `deleting` the Secrets from them. 

On the master `node itself` (more specifically in `etcd`), Secrets used to be stored in `unencrypted form`, which meant the `master node` needs to be `secured` to keep the `sensitive data` stored in `Secrets secure`. This didn’t only include keeping the `etcd storage secure`, but also `preventing unauthorized users` from using the API server, because anyone who can create `pods can mount` the Secret into the pod and `gain access` to the `sensitive data` through it. From Kubernetes version `1.7`, etcd stores Secrets in `encrypted form`, making the system much more secure.

it’s imperative you properly choose when to use a Secret or a ConfigMap. Choosing between them is simple:
* Use a ConfigMap to store `non-sensitive`, `plain configuration data`.
* Use a Secret to store any data that is `sensitive` in nature and needs to be kept under key. If a config file includes both `sensitive` and `not-sensitive` data, you should store the file in a Secret.

### 2. Introducing the default token Secret
You’ll start learning about Secrets by examining a Secret `that’s mounted into every container you run`. You may have noticed it when using kubectl describe on a pod. The `command’s output` has always contained something like this:
```bash
kubectl get secrets
```
 
You can also use `kubectl describe` to learn a bit more about it

* You can see that the Secret contains three entries `ca.crt`, `namespace`, and `token` which represent everything you need to securely talk to the Kubernetes API server from within your pods, should you need to do that. Although ideally you want your application to be completely Kubernetes-agnostic, when there’s no alternative other than to talk to Kubernetes directly, you’ll use the `files` provided through `this secret volume`. 

The kubectl describe pod command shows where the secret volume is mounted
```yaml
Mounts:
  /var/run/secrets/kubernetes.io/serviceaccount from default-token-xxxxx
```
* By `default`, the `default-token` Secret is `mounted` into `every container`, but you can `disable` that in each pod by `setting` the `automountServiceAccountToken field` in the `pod spec` to `false` or by setting it to `false` on the `service account` the pod is using.
```bash
kubectl exec mypod ls /var/run/secrets/kubernetes.io/serviceaccount/
```
```bash
ca.crt
namespace
token
```

### 3. Create secret
* First, generate the certificate and private key files:
```bash
openssl genrsa -out https.key 2048
openssl req -new -x509 -key https.key -out https.cert -days 3650 -subj /CN=www.kubia-example.com
```

Now you can use kubectl create secret to create a Secret from the three files
```bash
kubectl create secret generic fortune-https --from-file=https.key --from-file=https.cert --from-file=foo
```

### 4. Comparing ConfigMaps and Secrets
* The contents of a Secret’s entries are shown as `Base64-encoded` strings, whereas those of a ConfigMap are shown in `clear text`

### 5. using secrets for binary data
* The reason for using `Base64 encoding` is simple. A Secret’s entries `can contain binary values`, `not only plain-text`. `Base64 encoding` allows you to include the `binary data` in YAML or JSON, which are both plain-text formats. 
* You can use Secrets even for `non-sensitive` `binary data`, but be aware that the `maximum size` of a Secret is limited to `1MB`

### 6. introducing the stringdata field
```yaml
kind: Secret
apiVersion: v1
stringData:
  foo: plain text
```

### 7. Using the Secret in a pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune-https
spec:
  containers:
  - image: luksa/fortune:env
    name: html-generator
    env:
    - name: INTERVAL
      valueFrom:
        configMapKeyRef:
          name: fortune-config
          key: sleep-interval
      volumeMounts:
      - name: html
        mountPath: /var/htdocs
    - image: nginx:alpine
      name: web-server
      volumeMounts:
      - name: html
        mountPath: /usr/share/nginx/html
        readOnly: true
      - name: config
        mountPath: /etc/nginx/conf.d
        readOnly: true
      - name: certs
        mountPath: /etc/nginx/certs/
        readOnly: true
      ports:
      - containerPort: 80
      - containerPort: 443
  volumes:
  - name: html
    emptyDir: {}
  - name: config
    configMap:
      name: fortune-config
      items:
      - key: my-nginx-config.conf
        path: https.conf
  - name: certs
    secret:
      secretName: fortune-https 
```

### 8. exposing a secret’s entries through environment variables
```yaml
env:
- name: FOO_SECRET
  valueFrom:
    secretKeyRef:
      name: fortune-https
      key: foo     
```

### 9. creating a secret for authenticating with a docker registry
```bash
kubectl create secret docker-registry mydockerhubsecret \
--docker-username=myusername --docker-password=mypassword \ 
--docker-email=my.email@provider.com
```

### 10. creating a secret for authenticating with a docker registry
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: private-pod
spec:
  imagePullSecrets:
  - name: mydockerhubsecret
  containers:
  - image: username/private:tag
    name: main
```

### 11. not having to specify image pull secrets on every pod
* Image pull Secrets can be added to all your pods `automatically` if you add the `Secrets` to a `ServiceAccount`.

literal:
```bash
kubectl create secret generic postgres-config --from-literal=DB=postgres --from-literal=USER=postgres --from-literal=PASSWORD=postgres
```

yaml:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: dotfile-secret
data:
  .secret-file: dmFsdWUtMg0KDQo=
```
## 16. StorageClass
yaml:
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: low-latency
  annotations:
    storageclass.kubernetes.io/is-default-class: "false"
provisioner: csi-driver.example-vendor.example
reclaimPolicy: Retain # default value is Delete
allowVolumeExpansion: true
mountOptions:
  - discard # this might enable UNMAP / TRIM at the block storage layer
volumeBindingMode: WaitForFirstConsumer
parameters:
  guaranteedReadWriteLatency: "true" # provider-specific
```

## 17. Persistence Volume
### 1. Introducing available volume types
* `emptyDir`: A simple `empty directory` used for `storing transient data`.
* `hostPath` Used for `mounting directories from` the `worker node’s filesystem` into the pod.
* gitRepo ( deprecated ) A volume initialized by checking out the contents of a Git repository.
* `nfs` An `NFS share mounted` into the pod.
* `gcePersistentDisk` (Google Compute Engine Persistent Disk)
* `awsElasticBlockStore` (Amazon Web Services Elastic Block Store Volume
* `azureDisk` (Microsoft Azure Disk Volume)—Used for mounting cloud provider-specific storage.
* `cinder`, `cephfs`, `iscsi`, `flocker`, glusterfs, quobyte, rbd, flexVolume, vsphereVolume, photonPersistentDisk, scaleIO—Used for mounting other types of network storage.
* `configMap`, `secret`, `downwardAPI`—Special types of volumes used to expose certain Kubernetes resources and cluster information to the pod.
* `persistentVolumeClaim` A way to use a pre- or dynamically provisioned persistent storage

### 2. Using volumes to share data between containers
#### 1. Using an emptyDir volume
* The `simplest volume` type is the `emptyDir volume`, so let’s look at it in the `first example` of how to define a volume in a pod. As the name suggests, the volume starts out as an `empty directory`. The app running inside the pod can then `write` any files it needs to it. Because the `volume’s lifetime` is tied to that of the pod, the `volume’s contents` are lost when the `pod is deleted`.
* An `emptyDir volume` is especially useful for `sharing files` between containers running in the `same pod`. But it can also be used by a `single container` for when a container needs to `write data` to `disk temporarily`, such as when `performing a sort operation` on a `large dataset`, which `can’t fit` into the `available memory`. The data could also be `written` to the `container’s filesystem` itself

#### 2. using an emptydir volume in a pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune
spec:
  containers:
  - image: luksa/fortune
    name: html-generator
    volumeMounts:
    - name: html
      mountPath: /var/htdocs
  - image: nginx:alpine
    name: web-server
    volumeMounts:
    - name: html
      mountPath: /usr/share/nginx/html
      readOnly: true
    ports:
    - containerPort: 80
      protocol: TCP
volumes:
  - name: html
    emptyDir: {}   
```
* The pod contains `two containers` and a single volume that’s mounted in both of them, yet at `different paths`. When the `html-generator` container `starts`, it `starts writing the output` of the `fortune command` to the `/var/htdocsrindex.html` file every `10 seconds`. Because the volume is mounted at `/var/htdocs`, the `index.html` file is written to the `volume` instead of the `container’s top layer`. As soon as the `web-server` container starts, it starts serving whatever HTML files are in the /usr/share/nginx/html directory (this is the default directory Nginx serves files from). Because you mounted the volume in that exact location, Nginx will serve the index.html file written there by the container running the fortune loop.

#### 3. specifying the medium to use for the emptydir
* The `emptyDir` you used as the `volume was created` on the `actual disk` of the `worker node` hosting your pod, so its performance depends on the type of the `node’s disks`. But you can tell Kubernetes to create the emptyDir on a `tmpfs filesystem` (`in memory` instead of `on disk`). To do this, set the `emptyDir’s medium` to `Memory` like this:
```yaml
volumes:
  - name: html
    emptyDir:
      medium: Memory
```

#### 4. GitRepo
* When you create the pod, the volume is first initialized as an `empty directory` and then the `specified Git repository` is `cloned into it`. If you hadn’t set the `directory` to `. (dot)`, the repository would have been `cloned into` the `kubia-website-example` subdirectory, which isn’t what you want. You want the repo to be `cloned into the root` directory of your volume. Along with the repository, you also specified you want Kubernetes to check out whatever revision the `master branch` is pointing to at the time the `volume is created`. 
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: gitrepo-volume-pod
spec:
  containers:
  - image: nginx:alpine
    name: web-server
    volumeMounts:
    - name: html
      mountPath: /usr/share/nginx/html
      readOnly: true
    ports:
    - containerPort: 80
      protocol: TCP
volumes:
  - name: html
    gitRepo:
      repository: https://github.com/luksa/kubia-website-example.git
      revision: master
      directory: .    
```
#### 5. confirming the files aren’t kept in sync with the git repo
* If you `update Nginx file` to `master branch`. The `master branch` of the Git repository now `includes the changes` you made to the `HTML file`. These changes `will not be visible` on your `Nginx web server` yet, because the gitRepo volume `isn’t kept` in `sync` with the Git repository. You can confirm this by hitting the pod again. 

### 3. Accessing files on the worker node’s filesystem
#### 1. Introducing the hostPath volume
* A `hostPath volume points` to a `specific file` or `directory` on the `node’s filesystem`. Pods running on the `same node` and using the `same path` in their `hostPath volume` see the `same files`.
* hostPath volumes are the first type of persistent storage we’re introducing, because both the `gitRepo` and `emptyDir` `volumes’ contents` get `deleted` when a `pod is torn down`, whereas a `hostPath volume’s contents don’t`. If a pod is `deleted` and the `next pod` `uses a hostPath volume` `pointing` to the `same path` on the `host,` the `new pod` `will see whatever` was `left behind` by the `previous pod`, but only `if it’s scheduled` to the `same node` as the first pod.

### 4. Introducing PersistentVolumes and PersistentVolumeClaims
* To enable apps to `request storage` in a Kubernetes cluster `without having to deal` with `infrastructure specifics`, `two new resources` were introduced.
* Using a PersistentVolume inside a pod is a `little more complex` than using a regular pod volume, so let’s `illustrate` how pods, `PersistentVolumeClaims`, `PersistentVolumes`, and the `actual underlying storage` relate to each other
  * `Cluster admin` sets up some type of `network storage` (NFS export or similar)
  * `Cluster Admin` then creates a `PersistentVolume` (PV) by posting a PV `descriptor` to the `Kubernetes API`
  * `User` creates a `PersistentVolumeClaim` (PVC)
  * Kubernetes finds a PV of `adequate size` and `access mode` and `binds the PVC` to the `PV`
  * User creates a pod with a volume referencing the PVC

### 5. Creating a PersistentVolume
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mongodb-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
  - ReadWriteOnce
  - ReadOnlyMany
  persistentVolumeReclaimPolicy: Retain
  gcePersistentDisk:
    pdName: mongodb
    fsType: ext4    
```

Referencing a GCE PD in a pod’s volume:
```yaml
spec:
  volumes:
  - name: mongodb-data
    gcePersistentDisk:
      pdName: mongodb
      fsType: ext4
...
```
After you create the `PersistentVolume` with the `kubectl create` command, it should be `ready to be claimed`. See if it is by `listing all PersistentVolumes:`
```bash
kubectl get pv
```
* PersistentVolumes, like `cluster Nodes`, `don’t belong` to `any namespace`, unlike pods and `PersistentVolumeClaims`.

Claim PersistentVolume:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongodb-pvc   
spec:
  resources:
    requests:
      storage: 1Gi
  accessModes:
  - ReadWriteOnce
  storageClassName:
```
* As soon as you create the claim, Kubernetes finds the `appropriate PersistentVolume` and `binds it` to the claim. The `PersistentVolume’s capacity` must be `large enough` to `accommodate` what the `claim requests`. Additionally, the `volume’s access modes` must include the `access modes` requested by the claim. In your case, the claim `requests 1 GiB` of storage and a `ReadWriteOnce access mode`. The `PersistentVolume you created` earlier `matches those two requirements` so it is `bound to your claim`. You can see this by inspecting the claim.
```bash
kubectl get pvc
```

access modes:
* `RWO—ReadWriteOnce` Only a single node can mount the volume for reading and writing.
* `ROX—ReadOnlyMany` Multiple nodes can mount the volume for reading.
* `RWX—ReadWriteMany` Multiple nodes can mount the volume for both reading and writing.

Note: PersistentVolume resources are `cluster-scoped` and thus cannot be created in a `specific namespace`, but `PersistentVolumeClaims` can only be created in a `specific namespace`. They can then only be used by pods in the `same namespace`.

### 6. Using a PersistentVolumeClaim in a pod
* The `PersistentVolume` is `now yours to use`. Nobody else can claim the same volume `until you release it`. To use it `inside a pod`, you need to reference the `PersistentVolumeClaim` by name inside the `pod’s volume` (yes, the `PersistentVolumeClaim`, not the `PersistentVolume` directly!)

### 6. Recycling PersistentVolumes
#### 1. eclaiming persistentvolumes manually
You told Kubernetes you wanted your PersistentVolume to behave like this when you created it—by setting its persistentVolumeReclaimPolicy to Retain.

### 7. Dynamic provisioning of PersistentVolumes
* You’ve seen how using PersistentVolumes and PersistentVolumeClaims makes it easy to obtain persistent storage without the developer having to deal with the actual storage technology used underneath. But this still requires a cluster administrator to provision the actual storage up front. Luckily, Kubernetes can also perform this job automatically through dynamic provisioning of PersistentVolumes.
* The cluster admin, instead of creating PersistentVolumes, can deploy a PersistentVolume provisioner and define one or more StorageClass objects to let users choose what type of PersistentVolume they want. The users can refer to the StorageClass in their PersistentVolumeClaims and the provisioner will take that into account when provisioning the persistent storage. 
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast
provisioner: kubernetes.io/gce-pd
parameters:
 type: pd-ssd
 zone: europe-west1-b  
```

### 8. Requesting the STORAGE CLASS in a PersistentVolumeClaim
After the StorageClass resource is created, users can refer to the storage class by name in their PersistentVolumeClaims. 
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongodb-pvc 
spec:
  storageClassName: fast
  resources:
    requests:
    storage: 100Mi
  accessModes:
    - ReadWriteOnce
```
* Apart from specifying the size and access modes, your PersistentVolumeClaim now also specifies the class of storage you want to use. When you create the claim, the PersistentVolume is created by the provisioner referenced in the fast StorageClass resource. The provisioner is used even if an existing manually provisioned PersistentVolume matches the PersistentVolumeClaim.
```bash
kubectl get pvc mongodb-pvc
```
The VOLUME column shows the PersistentVolume that’s `bound to this claim` (the actual name is longer than what’s shown above). You can try listing PersistentVolumes now to see that a new PV has indeed been created automatically:

### 9. understanding how to use storage classes
* The cluster admin can create `multiple storage classes` with `different performance` or `other characteristics`. The developer then `decides which` one is `most appropriate` for `each claim` they create. 
* The nice thing about `StorageClasses` is the `fact that claims` refer to them by name. The `PVC definitions` are therefore `portable across different` clusters, as long as the `StorageClass` names are the same across all of them.

### 10. Dynamic provisioning without specifying a storage class
List storage class:
```bash
kubectl get sc
```
* Beside the `fast` `storage class`, which you created yourself, a standard storage class exists and is marked as `default`. You’ll learn what that means in a moment.

### 11. examining the default storage class
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  annotations:
   storageclass.beta.kubernetes.io/is-default-class: "true"
   creationTimestamp: 2021-07-19T12:24:11Z
  labels:
    addonmanager.kubernetes.io/mode: EnsureExists
    kubernetes.io/cluster-service: "true"
  name: standard
  resourceVersion: "180"
  selfLink: /apis/storage.k8s.io/v1/storageclassesstandard
  uid: b6498511-3a4b-11e7-ba2c-42010a840014
parameters:
  type: pd-standard
provisioner: kubernetes.io/gce-pd 
```

### 12. PVC with no storage class defined: mongodb-pvc-dp-nostorageclass.yaml
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongodb-pvc2
spec:
  resources:
    requests:
      storage: 100Mi
  accessModes:
    - ReadWriteOnce   
```
* This `PVC definition` includes only the `storage size request` and the desired access modes, but `no storage class`. When you create the PVC, `whatever storage class` is marked as `default` will be used. You can confirm that’s the case:

### 13. forcing a persistentvolumeclaim to be bound to one of the pre-provisioned persistentvolumes
```yaml
kind: PersistentVolumeClaim
spec:
  storageClassName: ""      
```
* If you `hadn’t set` the `storageClassName attribute` to an `empty string`, the dynamic volume provisioner would have provisioned a new PersistentVolume, `despite` there being an `appropriate pre-provisioned` PersistentVolume.
* Explicitly set `storageClassName` to `""` if you want the `PVC` to use a `preprovisioned PersistentVolume`.

### 14. understanding the complete picture of dynamic persistentvolume provisioning
* Cluster admin sets up a PersistentVolume provisioner (if one’s not already deployed)
* Admin creates one or more StorageClasses and marks one as the default (it may already exist)
* User creates a PVC referencing one of the StorageClasses (or none to use the default)
* Kubernetes looks up the StorageClass and the provisioner referenced in it and asks the provisioner to provision a new PV based on the PVC’s requested access mode and storage size and the parameters in the StorageClass
* Provisioner provisions the actual storage, creates a PersistentVolume, and binds it to the PVC
* User creates a pod with a volume referencing the PVC by name

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mongodb
  spec:
    containers:
    - image: mongo
      name: mongodb
    volumeMounts:
    - name: mongodb-data
      mountPath: /data/db
    ports:
    - containerPort: 27017
      protocol: TCP
volumes: 
- name: mongodb-data
  persistentVolumeClaim:
    claimName: mongodb-pvc 
```

yaml:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv0003
spec:
  capacity:
    storage: 5Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  storageClassName: slow
  mountOptions:
    - hard
    - nfsvers=4.1
  nfs:
    path: /tmp
    server: 172.17.0.2
```

## 18. Persistence Volume Claim
yaml:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myclaim
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Filesystem
  resources:
    requests:
      storage: 8Gi
  storageClassName: slow
  selector:
    matchLabels:
      release: "stable"
    matchExpressions:
      - {key: environment, operator: In, values: [dev]}
```
## 19. Job
### 1. Running pods that perform a single completable task 
* `ReplicationControllers`, `ReplicaSets`, and `DaemonSets` run `continuous tasks` that are never `considered completed`. Processes in such pods are restarted when they exit. But in a `completable task`, after its process terminates, it should `not be restarted again`. 
* In the event of a `node failure`, the pods on that node that are managed by a Job will be `rescheduled` to other nodes the way `ReplicaSet` pods are. In the event of a `failure` of the process itself (when the process returns an error exit code), the Job can be `configured` to either `restart` the container `or not`.
* For example, Jobs are useful for `ad hoc tasks`, where it’s crucial that the task finishes properly. You could run the task in an unmanaged pod and wait for it to finish, but in the event of a `node failing` or the pod being `evicted` from the node `while it is performing` its `task`, you’d need to `manually recreate it`. Doing this `manually doesn’t make sense—especially` if the job `takes hours` to `complete`.
* An example of such a job would be if you had `data stored` somewhere and you needed to `transform` and `export` it somewhere.

yaml:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: pi
spec:
  template:
    spec:
      containers:
      - name: pi
        image: perl:5.34.0
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy: Never
  backoffLimit: 4
```

Parallel and completion:
```yaml
spec:
 completions: 5
 parallelism: 2
   template:
```
* Completion: The job must ensure 5 jobs complete successful
* Parallel : Only 2 jobs can run parallel.

Scale a job:
* You can even change a `Job’s parallelism property` while the Job is `running`. This is `similar` to scaling a `ReplicaSet` or `ReplicationController`, and can be done with the `kubectl scale` command:
```bash
kubectl scale job multi-completion-batch-job --replicas 3
```

Time limit:
* A pod’s time can be `limited` by setting the `activeDeadlineSeconds` property in the pod spec. If the pod runs `longer` than that, the system will try to `terminate` it and will mark the Job as `failed`.

Retry limit:
* You can configure `how many times` a Job can be `retried` before it is marked as `failed` by specifying the `spec.backoffLimit` field in the Job manifest. If you `don't explicitly` specify it, it `defaults to 6`.

## 20. CronJob
yaml:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "* * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox:1.28
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
```

Start time limit
* You may have a `hard requirement` for the job to not be started `too far over the scheduled time`. In that case, you can specify a `deadline` by specifying the `startingDeadlineSeconds` field in the CronJob specification as shown in the following listing.
```yaml
apiVersion: batch/v1beta1
kind: CronJob
spec:
 schedule: "0,15,30,45 * * * *"
 startingDeadlineSeconds: 15  
```

## 21. Namespace
* Kubernetes namespaces provide a `scope for objects names`. Instead of having `all your resources in one single namespace`, you can split them into `multiple namespaces`, which also allows you to use the `same resource names multiple times` (across different namespaces).
* Resource names only need to be `unique within a namespace`. Two `different namespaces` can contain `resources of the same name`. But, while `most types of resources are namespaced`, a `few aren’t`. One of them is the `Node resource`, which is `global` and not tied to a `single namespace`

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: custom-namespace  
```
* Namespaces allow you to `isolate objects` into `distinct groups`, which allows you to `operate only` on those `belonging to the specified namespace`, they `don’t provide` any kind of `isolation of running objects`. 
* For example, you may think that when `different users` deploy `pods across different namespaces`, those pods are `isolated from each other and can’t communicate`, but that’s not necessarily the case. Whether namespaces provide `network isolation` depends on which networking solution is deployed with Kubernetes. When the solution `doesn’t provide inter-namespace network isolation`, if a pod in namespace foo knows `the IP address of a pod in namespace bar`, there is `nothing preventing` it from sending traffic, such as HTTP requests, to the other pod.

## 22. Network Policy
### 1. Overview
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: postgres-netpolicy
spec:
  podSelector:
    matchLabels:
      app: database
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: webserver
    ports:
    - port: 5432    
```

### 2. Isolating the network between Kubernetes namespaces
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: shoppingcart-netpolicy
spec:
  podSelector:
    matchLabels:
      app: shopping-cart
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          tenant: manning
    ports:
    - port: 80
```

### 3. Isolating using CIDR notation
```yaml
ingress:
- from:
  - ipBlock:
    cidr: 192.168.1.0/24  
```

### 4. Limiting the outbound traffic of a set of pods
```yaml
pec:
  podSelector:
    matchLabels:
      app: webserver
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: database
```

## DOWNWARD API
* What about data that isn’t known up until that point—such as the `pod’s IP`, the `host node’s name`, or even the `pod’s own name` (when the name is generated; for example, when the pod is created by a ReplicaSet or similar controller)? And what about data that’s already specified elsewhere, such as a `pod’s labels` and `annotations`? You don’t want to repeat the same information in multiple places.
* This problems are solved by the Kubernetes `Downward API`. It allows you to `pass metadata` about the pod and `its environment` through `environment variables` or `files` (in a downwardAPI volume).

### 1. Available metadata
The `Downward API` enables you to expose the `pod’s own metadata` to the processes running inside that pod. Currently, it allows you to pass the following information to your containers:
* The pod’s name
* The pod’s IP
* The namespace the pod belongs to
* The name of the node the pod is running on
* The name of the service account the pod is running under
* The CPU and memory requests for each container
* The CPU and memory limits for each container
* The pod’s labels
* The pod’s annotations

### 2. Exposing metadata through environment variables
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: downward
spec:
  containers:
  - name: main
    image: busybox
    command: ["sleep", "9999999"]
    resources:
      requests:
        cpu: 15m
        memory: 100Ki
      limits:
        cpu: 100m
        memory: 4Mi
   env:
   - name: POD_NAME
     valueFrom:
       fieldRef:
         fieldPath: metadata.name
   - name: POD_NAMESPACE
     valueFrom:
       fieldRef:
         fieldPath: metadata.namespace
   - name: POD_IP
     valueFrom:
       fieldRef:
         fieldPath: status.podIP
   - name: NODE_NAME
     valueFrom:
       fieldRef:
         fieldPath: spec.nodeName
   - name: SERVICE_ACCOUNT
     valueFrom:
       fieldRef:
         fieldPath: spec.serviceAccountName
   - name: CONTAINER_CPU_REQUEST_MILLICORES
     valueFrom:
       resourceFieldRef:
         resource: requests.cpu
         divisor: 1m
   - name: CONTAINER_MEMORY_LIMIT_KIBIBYTES
     valueFrom:
       resourceFieldRef:
         resource: limits.memory
         divisor: 1Ki
```

Check environment variable:
```yaml
kubectl exec downward env
```
 
### 3. Passing metadata through files in a downwardAPI volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: downward
  labels:
    foo: bar
 annotations:
   key1: value1
   key2: |
     multi
     line
     value   
spec:
  containers:
  - name: main
    image: busybox
    command: ["sleep", "9999999"]
    resources:
      requests:
        cpu: 15m
        memory: 100Ki
      limits:
        cpu: 100m
        memory: 4Mi
    volumeMounts:
    - name: downward
      mountPath: /etc/downward
volumes:
- name: downward
  downwardAPI:
    items:
    - path: "podName"
      fieldRef:
        fieldPath: metadata.name
    - path: "podNamespace"
      fieldRef:
        fieldPath: metadata.namespace
    - path: "labels"
      fieldRef:
        fieldPath: metadata.labels
    - path: "annotations"
      fieldRef:
        fieldPath: metadata.annotations
    - path: "containerCpuRequestMilliCores"
      resourceFieldRef:
        containerName: main
        resource: requests.cpu
        divisor: 1m
    - path: "containerMemoryLimitBytes"
      resourceFieldRef:
        containerName: main
        resource: limits.memory
        divisor: 1
```

Check volume:
```bash
kubectl exec downward ls -lL /etc/downward
```

Examples:
```bash
kubectl exec downward cat /etc/downward/labels
foo="bar"
```

```bash
kubectl exec downward cat /etc/downward/annotations
key1="value1"
key2="multi\nline\nvalue\n"
kubernetes.io/config.seen="2016-11-28T14:27:45.664924282Z"
kubernetes.io/config.source="api"
```

### 4. updating labels and annotations
* You may remember that `labels` and `annotations` can be modified while a pod is running. As you might expect, when they change, Kubernetes updates the `files holding them`, allowing the pod to always see `up-to-date` data. This also explains why labels and annotations `can’t be exposed` through `environment variables`. Because `environment variable values` can’t be updated afterward, if the labels or annotations of a pod were exposed through environment variables, `there’s no way` to expose the `new values` after `they’re modified`.

### 5. referring to container-level metadata in the volume specification
```yaml
spec:
  volumes:
  - name: downward
    downwardAPI:
      items:
      - path: "containerCpuRequestMilliCores"
        resourceFieldRef:
          containerName: main
          resource: requests.cpu
          divisor: 1m
```

### 6. Talking to the Kubernetes API server
Get IP info:
```bash
kubectl cluster-info
```

```bash
curl https://IP:8443 -k
```

### 7. accessing the api server through kubectl proxy 
* The `kubectl proxy` command runs a `proxy server` that `accepts HTTP connections` on your `local machine` and `proxies` them to the API server while `taking care of authentication`, so you `don’t need to pass` the `authentication token` in `every request`. It also makes sure you’re talking to the `actual API server` and not a man in the middle (by verifying the server’s certificate on each request).

```bash
kubectl proxy
```

```bash
curl localhost:8001
```

### 8. exploring the batch api group’s rest endpoint
```bash
curl http://localhost:8001/apis/batch
```

```bash
curl http://localhost:8001/apis/batch/v1
```

### 9. listing all job instances in the cluster
```bash
curl http://localhost:8001/apis/batch/v1/jobs
```

### 10. retrieving a specific job instance by name
```bash
curl http://localhost:8001/apis/batch/v1/namespaces/default/jobs/my-job
```

### 11. Talking to the API server from within a pod
You’ve learned how to talk to the API server from your `local machine`, using the `kubectl proxy`. Now, let’s see how to `talk` to it from `within a pod`, where you (usually) don’t have `kubectl`. Therefore, to `talk` to the `API server` from `inside a pod`, you need to `take care` of three things:
* Find the `location` of `the API server`.
* Make sure `you’re talking` to the `API server` and not something impersonating it.
* `Authenticate` with the server; otherwise it won’t let you `see` or `do` `anything`.

### 12. running a pod to try out communication with the api server
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: curl
spec:
  containers:
  - name: main
    image: tutum/curl
    command: ["sleep", "9999999"] 
```

Then:
```bash
kubectl exec -it curl bash
```

Finding API server address ( localhost ):
```bash
kubectl get svc
```

Finding API server address ( container ):
```bash
env | grep KUBERNETES_SERVICE
```

Curl:
```bash
curl https://kubernetes
```

```bash
curl: (60) SSL certificate problem: unable to get local issuer certificate
...
If you'd like to turn off curl's verification of the certificate, use  the -k (or --insecure) option.
```

Curl with cacert:
```bash
curl --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt https://kubernetes
```

Export env:
```bash
export CURL_CA_BUNDLE=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
```

```bash
curl https://kubernetes
```

### 13. authenticating with the api server
Set `env` for `token`:
```bash
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
```

Curl with `cert` and `token`:
```bash
curl -H "Authorization: Bearer $TOKEN" https://kubernetes
```

### 14. Disabling role-based access control (RBAC)
```bash
kubectl create clusterrolebinding permissive-binding \
--clusterrole=cluster-admin \
--group=system:serviceaccounts
```

* This gives `all service accounts` (we could also say `all pods`) `cluster-admin privileges`, allowing them to `do whatever they want`. Obviously, doing this is `dangerous` and `should never be done` on `production clusters`. For `test purposes`, `it’s fine`.

### 15. getting the namespace the pod is running in
Export namespace env:
```bash
NS=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
```

Curl namespace with cert and token:
```bash
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/$NS/pods
```

### 16. recapping how pods talk to kubernetes
* The app should verify whether the `API server’s certificate` is `signed` by the `certificate authority`, whose certificate is in the `ca.crt` file. 
* The app should `authenticate itself` by sending the `Authorization header` with the `bearer token` from the `token file`. 
* The `namespace file` should be used to pass `the namespace` to the `API server` when performing `CRUD operations` on API objects inside the `pod’s namespace`.

### 18. introducing the ambassador container pattern
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: curl-with-ambassador
spec:
  containers:
  - name: main
    image: tutum/curl
    command: ["sleep", "9999999"]
  - name: ambassador
    image: luksa/kubectl-proxy:1.6.2
```

Exec to `main` container:
```bash
kubectl exec -it curl-with-ambassador -c main bash
```

Curl inside `main` container:
```bash
curl localhost:8001
```

### 19. Using client libraries to talk to the API server
* `Golang` client—https://github.com/kubernetes/client-go
* `Python` https://github.com/kubernetes-incubator/client-python
* `Java` client by Fabric8—https://github.com/fabric8io/kubernetes-client
* `Java` client by Amdatu—https://bitbucket.org/amdatulabs/amdatu-kubernetes
* `Node.js` client by tenxcloud—https://github.com/tenxcloud/node-kubernetes-client
* `Node.js` client by GoDaddy—https://github.com/godaddy/kubernetes-client
* `PHP` https://github.com/devstub/kubernetes-api-php-client
* `Ruby` https://github.com/Ch00k/kubr
* `Another` Ruby client—https://github.com/abonas/kubeclient
* `Clojure` https://github.com/yanatan16/clj-kubernetes-api
* `Scala` https://github.com/doriordan/skuber
* `Perl` https://metacpan.org/pod/Net::Kubernetes

## LABELS, ANNOTATION, TAINT
### 1. Label
#### 1. Nodes
get nodes with labels:
```bash
kubectl get nodes --show-labels
```

label a node:
```bash
kubectl label nodes <node-name> <key>=<value>
```

Example:
```bash
kubectl label nodes worker-01 disktype=ssd
```

#### 2. Pods ( Other resources type are same )
get pods with labels:
```bash
kubectl get pods --show-labels
```

label a node:
```bash
kubectl label pod <node-name> <key>=<value>
```

Example:
```bash
kubectl label pod firstpod admin=true
```

```bash
kubectl get pod -l app=pc,rel=beta
```

Two dimension label strategy:
* rel: stable, beta, canary,...
* app: ui, as, pc, sc, os,...

### 2. Annotation
* Annotations are also `commonly` used when `introducing new features` to Kubernetes. Usually, alpha and beta versions of new features don’t introduce any new fields to API objects. Annotations are used instead of fields, and then once the required API changes have become clear and been agreed upon by the Kubernetes developers, new fields are introduced and the related annotations deprecated.

### 3. Taint
#### 1. NoSchedule
Pod can `not schedule` to node that has `NoSchedule taint`, pod `already exist` before taint `still live` on node

#### 2. PreferNoSchedule
`Prefer no schedule` to node if there is `other node` that `satistify pod's requirements`. In case there is `no node satisitfy pod's requirement`, the pod will be `schedule to node with PreferNoSchedule taint`

#### 3. NoExecute
The node with `NoExecute taint` will `not allow pod to shedule` to and `evict all existing pod` if those pods `dont have require tolerations`

### 3. Toleration
Example:
```yaml
tolerations:
  - key: node-type
    Operator: Equal
    value: production
    effect: NoSchedule
```

## Liveness probe and readiness
### 1. Liveness probe
```yaml
spec:
 containers:
 - image: luksa/kubia-unhealthy
   name: kubia
   livenessProbe:
     httpGet:
     path: /             
     port: 8080
```

## Metadata
### 1. Creation timestamp
```yaml
creationTimestamp: 2023-03-18T12:37:50Z
```

### 2. Generate name
```yaml
generateName: kubia-
```

## SECURITY
### 1. hostNetwork: true  
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-host-network
spec:
  hostNetwork: true
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
```
* After you run the pod, you can use the following command to see that it’s indeed using the host’s network namespace (it sees all the host’s network adapters, for example).
```bash
kubectl exec pod-with-host-network ifconfig
```

### 2. Binding to a host port without using the host’s network namespace
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: kubia-hostport
spec:
  containers:
  - image: luksa/kubia
    name: kubia
    ports:
    - containerPort: 8080
      hostPort: 9000
      protocol: TCP
```
* It’s important to understand that if a pod is using a specific host port, only one instance of the pod can be scheduled to each node, because two processes can’t bind to the same host port.

### 3. Using the node’s PID and IPC namespaces
* Similar to the hostNetwork option are the hostPID and hostIPC pod spec properties. When you set them to true, the pod’s containers will use the node’s PID and IPC namespaces, allowing processes running in the containers to see all the other processes on the node or communicate with them through IPC, respectively. See the following listing for an example.
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-host-pid-and-ipc
spec:
  hostPID: true
  hostIPC: true
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
```
* You’ll remember that pods usually see only their own processes, but if you run this pod and then list the processes from within its container, you’ll see all the processes running on the host node, not only the ones running in the container, as shown in the following listing.
```bash
kubectl exec pod-with-host-pid-and-ipc ps aux
```

### 4. Configuring the container’s security context
Configuring the security context allows you to do various things:
* Specify the `user` (the `user’s ID`) under `which` the `process` in the container `will run`.
* Prevent the container from `running as root` (the `default user` a container runs as is usually defined in the `container image` itself, so you may want to prevent containers from `running as root`).
* Run the container in `privileged mode`, giving it `full access` to the `node’s kernel`.
* Configure `fine-grained privileges`, by `adding` or `dropping` `capabilities—in` contrast to giving the container all `possible permissions` by running it in `privileged mode`.
* Set `SELinux` (Security Enhanced Linux) options to strongly lock down a container.
* Prevent the process from writing to the `container’s filesystem`.

### 5. Running a container as a specific user
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-as-user-guest
spec:
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      runAsUser: 405     
```

```bash
kubectl exec pod-as-user-guest id
```

### 6. Preventing a container from running as root
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-run-as-non-root
spec:
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      runAsNonRoot: true     
```

If you deploy this pod, it gets scheduled, but is not allowed to run:
```bash
kubectl get po pod-run-as-non-root
```

### 7. Running pods in privileged mode
* Sometimes pods need to do `everything` that the `node they’re running on can do`, such as use `protected system devices` or other `kernel features`, which `aren’t accessible` to regular containers. 
* An example of such a pod is the `kube-proxy` pod, which needs to modify the `node’s iptables` rules to make `services work`,
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-privileged
spec:
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      privileged: true     
```

Non previliged mode:
```bash
kubectl exec -it pod-with-defaults ls /dev
```

Previliged mode:
```bash
kubectl exec -it pod-privileged ls /dev
```

### 8. Adding individual kernel capabilities to a container
* In the previous section, you saw one way of `giving` a container `unlimited power`. In the `old days`, traditional UNIX implementations only `distinguished` between `privileged` and `unprivileged processes`, but for many years, Linux has `supported` a much more `fine-grained` `permission system` through `kernel capabilities`.
* Instead of making a container `privileged` and giving it `unlimited permissions`, a much `safer method` (from a `security perspective`) is to give it access `only` to the `kernel features` it `really requires`. Kubernetes allows you to `add capabilities` to each container or `drop part` of them, which allows you to `fine-tune` the `container’s permissions` and `limit` the `impact` of a potential intrusion by an attacker.

Modify date format without capabilities:
```bash
kubectl exec -it pod-with-defaults -- date +%T -s "12:00:00"
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-add-settime-capability
spec:
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      capabilities:
        add:
        - SYS_TIME  
```

Modify date format with capabilities:
```bash
kubectl exec -it pod-add-settime-capability -- date +%T -s "12:00:00"
```

date:
```bash
kubectl exec -it pod-add-settime-capability -- date
```

check node's date format as well:
```bash
date
```

### 9. Dropping capabilities from a container
* You’ve seen how to add capabilities, but you can also `drop capabilities` that may otherwise be `available` to the container. For example, the `default capabilities` given to a container include the `CAP_CHOWN` capability, which allows `processes` to change the `ownership of files` in `the filesystem`. 

Change owner with default capabilities:
```bash
kubectl exec pod-with-defaults chown guest /tmp
kubectl exec pod-with-defaults -- ls -la / | grep tmp
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-drop-chown-capability
spec:
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      capabilities:
        drop:
        - CHOWN      
```

Change owner without capabilities:
```bash
kubectl exec pod-drop-chown-capability chown guest /tmp
```

### 10. Preventing processes from writing to the container’s filesystem
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-readonly-filesystem
spec:
  containers:
  - name: main
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      readOnlyRootFilesystem: true
        volumeMounts:
        - name: my-volume
          mountPath: /volume
          readOnly: false
  volumes:
  - name: my-volume
    emptyDir:
```

Write file without permission:
```bash
kubectl exec -it pod-with-readonly-filesystem touch /new-file
```

On the other hand, writing to the mounted volume is allowed:
```bash
kubectl exec -it pod-with-readonly-filesystem touch /volume/newfile
kubectl exec -it pod-with-readonly-filesystem -- ls -la /volume/newfile
```

### 11. Sharing volumes when containers run as different users
* we explained how `volumes` are used to `share data` between the `pod’s containers`. You had no `trouble writing files` in `one container` and `reading` them in the `other`. 
* If those two containers use a volume to `share files`, they may `not necessarily` be `able` to `read` or `write files` of `one another`. 
* fsGroup
* supplementalGroups
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-shared-volume-fsgroup
spec:
  securityContext:
    fsGroup: 555
    supplementalGroups: [666,777]
  containers:
  - name: first
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
      runAsUser: 1111
        volumeMounts:
        - name: shared-volume
          mountPath: /volume
          readOnly: false
  - name: second
    image: alpine
    command: ["/bin/sleep", "999999"]
    securityContext:
    runAsUser: 2222
      volumeMounts:
      - name: shared-volume
        mountPath: /volume
        readOnly: false
  volumes:
  - name: shared-volume
    emptyDir:
```

First container:
```bash
kubectl exec -it pod-with-shared-volume-fsgroup -c first sh
```

```bash
ls -l / | grep volume
```

```bash
echo foo > /volume/foo
ls -l /volume
```

```bash
echo foo > /tmp/foo
ls -l /tmp
```

Second container:
```bash
kubectl exec -it pod-with-shared-volume-fsgroup -c second sh
```

### 12. PodSecurityPolicy 
#### 1. Overview
A `PodSecurityPolicy` resource defines things like the following:
* Whether a pod can use the host’s IPC, PID, or Network namespaces
* Which host ports a pod can bind to
* What user IDs a container can run as
* Whether a pod with privileged containers can be created
* Which kernel capabilities are allowed, which are added by default and which are always dropped
* What SELinux labels a container can use
* Whether a container can use a writable root filesystem or not
* Which filesystem groups the container can run as
* Which volume types a pod can use
```yaml
apiVersion: extensions/v1beta1
kind: PodSecurityPolicy
metadata:
  name: default
spec:
  hostIPC: false
  hostPID: false
  hostNetwork: false
  hostPorts:
  - min: 10000
    max: 11000
  - min: 13000
    max: 14000
  privileged: false
  readOnlyRootFilesystem: true
  runAsUser:
    rule: RunAsAny
  fsGroup:
    rule: RunAsAny
  supplementalGroups:
    rule: RunAsAny
  seLinux:
    rule: RunAsAny
  volumes:
  - '*'           
```

#### 2. Understanding runAsUser, fsGroup, and supplementalGroups policies
using the mustrunas rule:

```yaml
runAsUser:
  rule: MustRunAs
  ranges:
  - min: 2
    max: 2
fsGroup:
  rule: MustRunAs
  ranges:
  - min: 2
    max: 10
  - min: 20
    max: 30
supplementalGroups:
  rule: MustRunAs
  ranges:
  - min: 2
    max: 10
  - min: 20
    max: 30  
```

deploying a pod with runasuser outside of the policy’s range:
```bash
kubectl create -f pod-as-user-guest.yaml
```

#### 3. Configuring allowed, default, and disallowed capabilities
```yaml
apiVersion: extensions/v1beta1
kind: PodSecurityPolicy
spec:
  allowedCapabilities:
  - SYS_TIME
  defaultAddCapabilities:
  - CHOWN
  requiredDropCapabilities:
  - SYS_ADMIN
  - SYS_MODULE
...
```

* `allowedCapabilities`: Allow containers to add the `SYS_TIME` capability.
* `defaultAddCapabilities`: Automatically add the `CHOWN` capability to every container.
* `requiredDropCapabilities`: Require containers to drop the `SYS_ADMIN` and SYS_MODULE capabilities.

#### 4. Constraining the types of volumes pods can use
```yaml
kind: PodSecurityPolicy
spec:
  volumes:
  - emptyDir
  - configMap
  - secret
  - downwardAPI
  - persistentVolumeClaim
```

#### 5. creating a podsecuritypolicy allowing privileged containers to be deployed
```yaml
apiVersion: extensions/v1beta1
kind: PodSecurityPolicy
metadata:
  name: privileged
spec:
  privileged: true
  runAsUser:
    rule: RunAsAny
  fsGroup:
    rule: RunAsAny
  supplementalGroups:
    rule: RunAsAny
  seLinux:
    rule: RunAsAny
  volumes:
  - '*'
```

Get pod security policy:
```bash
kubectl get psp
```

#### 6. using rbac to assign different podsecuritypolicies to different users
```bash
kubectl create clusterrole psp-default --verb=use --resource=podsecuritypolicies --resource-name=default
```

```bash
kubectl create clusterrole psp-privileged --verb=use --resource=podsecuritypolicies --resource-name=privileged
```

```bash
kubectl create clusterrolebinding psp-all-users --clusterrole=psp-default --group=system:authenticated
```

```bash
kubectl create clusterrolebinding psp-bob --clusterrole=psp-privileged --user=bob
```

#### 7. creating additional users for kubectl
```bash
kubectl config set-credentials alice --username=alice --password=password
```

## 22. Horizontal pod autoscaling
### 1. Overview
The autoscaling process can be split into `three steps`:
* `Obtain metrics` of `all` the pods managed by the `scaled resource object`.
* `Calculate` the `number` of `pods required` to bring the `metrics` to (or close to) the `specified target value`.
  * All it takes is `summing up` the `metrics values` of `all the pods`, `dividing` that by the `target value` set on the `HorizontalPodAutoscaler` resource, and then `rounding it up` to the `next-larger integer`
* `Update` the `replicas field` of the scaled resource.

Only supported resource:
* Deployments
* ReplicaSets
* ReplicaControllers
* StatefulSets

Example:
```yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
  name: kubia
...
spec:
  maxReplicas: 5
  metrics:
  - resource:
      name: cpu
      targetAverageUtilization: 30
    type: Resource
  minReplicas: 1
  scaleTargetRef:
    apiVersion: extensions/v1beta1
    kind: Deployment
    name: kubia      
status:
 currentMetrics: []
 currentReplicas: 3
 desiredReplicas: 0    
```

### 2. modifying the target metric value on an existing hpa object
```yaml
spec:
  maxReplicas: 5
  metrics:
  - resource:
      name: cpu
      targetAverageUtilization: 60
        type: Resource
```

As you can see, the `metrics field` allows you to `define` more than `one metric` to use. In the listing, you’re using a `single metric`. Each entry defines the type of metric— in this case, a Resource metric. You have `three types` of metrics you can use in an `HPAobject`:
* Resource
* Pods
* Object

### 3. Reffering to a metric of a different object in the HPA
```yaml
spec:
  metrics:
  - type: Object
    resource:
      metricName: latencyMillis   
      target:
        apiVersion: extensions/v1beta1
        kind: Ingress 
        name: frontend
      targetValue: 20
    SaleTargetRef:
      apiVersion: extensions/v1beta1
      kind: Deployment
      name: kubia    
```
* The horizontal `pod autoscaler` currently `doesn’t allow` setting the `minReplicas field` to `0`, so the autoscaler will never `scale down` to `zero`, even if the pods aren’t doing

## 23. PodDisruptionBudget
Limiting service disruption during cluster scale-down
```yaml
apiVersion: policy/v1beta1
kind: PodDisruptionBudget
metadata:
  name: kubia-pdb
spec:
  minAvailable: 3
    selector:
      matchLabels:
        app: kubia  
```

## AFFINITY AND CPU, RAM
### 1. Show node resources
```bash
kubectl describe nodes
```
* Capacity
* Allocatable

```bash
kubectl describe node
```

### 2. Request
#### 1. Example
```yaml
resources:
  requests:
    cpu: 200m
    memory: 10Mi
```
#### 2. Understanding how scheduler determine if no nodes have enough requirment
* Based on actual allocated not real usage
* This mean if node allocated 80% of their resources to existing pods, but their real usage is 70%. When you deploy a pod that require 25% resources of that node, it can not be schedule to.

#### 3. Best node selection
* LeaseRequestedPriority: This attribe is for node that has fewer requested resources ( with a greater amount of unallocated resources )
* MostRequestedPriority: This is opposite to above one, usually for smallest possible number of nodes while still providing each pod with amount of resources it requests

#### 4. Unused resources
* If you dont specify a limit, pod will assume resources as much as possible. Unused resources will be distribute by their request ratio.

### 3. Limit
#### 1. Example
```yaml
spec:
 containers:
 - image: busybox
   command: ["dd", "if=/dev/zero", "of=/dev/null"]
   name: main
   resources:
     limits:
     cpu: 1
     memory: 20Mi   
```
* The `sum of all limits` of all the pods on a node is `allowed to exceed 100%` of the `node’s capacity`
#### 2. Exceed limit
* Cpu: when a CPU limit is set for a container, the process isn’t given more CPU time than the configured limit. 
* Ram: When a process tries to allocate memory over its limit, the process is killed (it’s said the container is OOMKilled, where OOM stands for Out Of Memory).
* Ram: If the pod’s restart policy is set to Always or OnFailure, the process is restarted immediately, so you may not even notice it getting killed
* Ram: But if it keeps going over the memory limit and getting killed, Kubernetes will begin restarting it with increasing delays between restarts. You’ll see a CrashLoopBackOff status in that case:

The `CrashLoopBackOff` status `doesn’t mean` the Kubelet has `given up`.
* After the first crash, it restarts the container immediately and then, if it crashes again, waits for 10 seconds before restarting it again. On subsequent crashes, this delay is then increased exponentially to 20, 40, 80, and 160 seconds, and finally limited to 300 seconds. Once the interval hits the 300-second limit, the Kubelet keeps restarting the container indefinitely every five minutes until the pod either stops crashing or is deleted. 

### 4. Understanding pod QoS classes

Imagine having `two pods`, where `pod A` is using, let’s say, `90%` of the `node’s memory` and then `pod B` suddenly `requires more memory` than what it had been using up to that point and the `node can’t provide` the required `amount of memory`. Which container should be killed? Should it be pod B, because its request for memory can’t be satisfied, or should pod A be killed to free up memory, so it can be provided to pod B? 

Obviously, `it depends`. Kubernetes `can’t make` a `proper decision` on its own. You need a way to specify `which pods` have `priority` in such cases. Kubernetes does this by categorizing pods into three `Quality of Service` (QoS) `classes`:

* BestEffort (the lowest priority)
* Burstable
* Guaranteed (the highest)

### 5. LimitRange
```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: example
spec:
  limits:
  - type: Pod
    min:
      cpu: 50m
      memory: 5Mi
    max:
      cpu: 1
      memory: 1Gi
  - type: Container
    defaultRequest:
      cpu: 100m
      memory: 10Mi
    default:
      cpu: 200m
      memory: 100Mi
    min:
      cpu: 50m
      memory: 5Mi
    max:
      cpu: 1
      memory: 1Gi
    maxLimitRequestRatio:
      cpu: 4
      memory: 10       
```
* Lower down, at the container level, you can set not only the minimum and maximum, but also default resource requests (defaultRequest) and default limits (default) that will be applied to each container that doesn’t specify them explicitly. 
* Lower down, at the container level, you can set not only the minimum and maximum, but also default resource requests (defaultRequest) and default limits (default) that will be applied to each container that doesn’t specify them explicitly. 

### 6. creating a resourcequota for cpu and memory
#### 1. Specifying a quota for persistent storage
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: cpu-and-mem
spec:
  hard:
    requests.cpu: 400m
    requests.memory: 200Mi
    limits.cpu: 600m
    limits.memory: 500Mi
```
* `LimitRanges` apply to `individual pods`; `ResourceQuotas` apply to `all pods` in the `namespace`.

#### 2. Specifying a quota for persistent storage
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: storage
spec:
  hard:
    requests.storage: 500Gi
    ssd.storageclass.storage.k8s.io/requests.storage: 300Gi
    standard.storageclass.storage.k8s.io/requests.storage: 1Ti
```
* In this example, the `amount` of `storage` `all PersistentVolumeClaims` in a `namespace` can `request` is `limited` to `500 GiB` (by the requests.storage entry in the `ResourceQuota` object). 

#### 3. Limiting the number of objects that can be created

Object count quotas can currently be set for the following objects: 
* Pods
* ReplicationControllers
* Secrets
* Configmaps
* PersistentVolumeClaims
* Service ( Loadbalancer, Nodeport )

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: objects
spec:
  hard:
    pods: 10
    replicationcontrollers: 5
    secrets: 10
    configmaps: 10
    persistentvolumeclaims: 4
    services: 5              
    services.loadbalancers: 1
    services.nodeports: 2
    ssd.storageclass.storage.k8s.io/persistentvolumeclaims: 2   
```

#### 4. Specifying quotas for specific pod states and/or QoS classes
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: besteffort-notterminating-pods
spec:
  scopes:
  - BestEffort
  - NotTerminating
  hard:
    pods: 4    
```

## Affinity
### 1. Using node affinity to attract pods to certain nodes
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: kubia-gpu
spec:
  affinity:
   nodeAffinity:
     requiredDuringSchedulingIgnoredDuringExecution:
       nodeSelectorTerms:
       - matchExpressions:
         - key: gpu
           operator: In
           values:
           - "true"
```

* `requiredDuringScheduling`... means the rules defined under this field specify the labels the node must have for the pod to be scheduled to the node.
* ...`IgnoredDuringExecution` means the rules defined under the field don’t affect pods already executing on the node. 

### 2. specifying preferential node affinity rules

* The biggest benefit of the newly introduced node affinity feature is the ability to specify which nodes the Scheduler should prefer when scheduling a specific pod. This is done through the `preferredDuringSchedulingIgnoredDuringExecution` 

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: pref
spec:
  template:
  ...
  spec:
    affinity:
      nodeAffinity:
        preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 80
          preference:
            matchExpressions:
            - key: availability-zone
              operator: In
              values:
              - zone1
        - weight: 20
          preference:
            matchExpressions:
            - key: share-type
              operator: In
              values:
              - dedicated     
```

## MISC
### 1. Starting pods in a specific order

adding an init container to a pod:
```yaml
spec:
  initContainers:
  - name: init
    image: busybox
    command:
    - sh
    - -c
    -  'while true; do echo "Waiting for fortune service to come up..."; wget http://fortune -q -T 1 -O /dev/null >/dev/null 2>/dev/null && break; sleep 1; done; echo "Service is up! Starting main container."'
```

### 2. Adding lifecycle hooks

PostStart:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-poststart-hook
spec:
  containers:
  - image: luksa/kubia
    name: kubia
    lifecycle:
      postStart:
        exec:
          command:
          - sh
          -c
          - "echo 'hook will fail with exit code 15'; sleep 5; exit 15"
```

Prestop:
```yaml
lifecycle:
  preStop:
    httpGet:
      port: 8080
      path: shutdown
```

Termination message:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-termination-message
spec:
  containers:
  - image: busybox
    name: main
    terminationMessagePath: /var/termination-reason
    command:
    - sh
    - c
    - 'echo "I''ve had enough" > /var/termination-reason ; exit 1'   
```

## COMMANDS
## 1 Backup
#### 1. Get certs locations
```bash
kubectl -n kube-system get pod kube-apiserver-$(hostname) -o=jsonpath='{.spec.containers[0].command}' |jq |grep etcd
```
#### 2. Backup
Replace `$location` with your desire:
```bash
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key snapshot save $location
```
#### 3. Create data directory
Replace `$datadir` and `$snapshotdir` with your desire:
```bash
etcdutl snapshot restore --data-dir $datadir $snapshotdir
```

#### 4. Restore
```bash
mv /etc/kubernetes/manifests/* /etc/kubernetes/
```
```bash
vi /etc/kubernetes/etcd.yaml
```
At `volume`->> `hostPath`->> `etcd-data`

Change `/var/lib/etcd` with your desire `$datadir`
```bash
mv /etc/kubernetes/*.yaml /etc/kubernetes/manifests
```
#### 5. Wait a little bit to see result
## 2 Upgrade ( Centos 9 )
#### 1. Check version
```bash
kubeadm version
kubectl version
kubelet --version
```

#### 2. Check kubedm yum package version
```bash
sudo yum list --showduplicates kubeadm --disableexcludes=kubernetes
```

#### 3. Install newer kubeadm version
```bash
sudo yum install -y kubeadm-'1.29.x-*' --disableexcludes=kubernetes
```

#### 4. Check upgrade plan
```bash
sudo kubeadm upgrade apply $version
```

#### 5. Drain node ( mark node unschedulable and evicting the workloads )
```bash
kubectl drain <node-to-drain> --ignore-daemonsets
```

#### 6. Upgrade kubectl and kubelet
```bash
sudo yum install -y kubelet-'1.29.x-*' kubectl-'1.29.x-*' --disableexcludes=kubernetes
```

#### 7. Reload 
```bash
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

#### 8. Uncordon node ( mark node schedulable )
```bash
kubectl uncordon <node-to-uncordon>
```
## 3 RBAC
#### 1. Create user
```bash
sudo useradd -m -G sudo -s /bin/bash/$NEWUSER
```
```bash
sudo passwd $NEWUSER
```
```bash
su - $NEWUSER
```
#### 2. Generate and sign key
```bash
openssl genrsa -out $NEWUSER.key 2048
```
```bash
openssl req -new -key $NEWUSER.key -out $NEWUSER.csr -subj "/CN=$NEWUSER/O=k8s"
```
```bash
sudo openssl x509 -req -in $NEWUSER.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out $NEWUSER.crt -days 1800
```
#### 3. Configure kubeconfig
```bash
mkdir -p /home/$NEWUSER/.kube
```
```bash
sudo cp -i /etc/kubernetes/admin.conf /home/$NEWUSER/.kube/config
```
```bash
sudo chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.kube
```
```bash
kubectl config set-credentials $NEWUSER --client-certificate=/home/$NEWUSER/$NEWUSER.crt --client-key=/home/$NEWUSER/$NEWUSER.key
```
#### 4. Configure context
```bash
kubectl config set-context $NEWUSER-context --cluster=kubernetes --namespace=$NAMESPACE --user=$NEWUSER
```
```bash
kubectl config use-context $NEWUSER-context
```
This is command will fail because there is no `Roles` or `ClusterRole` bind to `$NEWUSER`
```bash
kubectl get pods
```
```bash
kubectl config get-context
```
#### 5. Configure role bind to user
Switch back to `kubernetes-admin` user

Apply `Role`:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: $NEWUSER
  namespace: $NAMESPACE
rules:
- apiGroups: ["","extensions","apps"]
  resources: ["pods","deployments","replicasets"]
  verbs: ["get","list","watch","create","patch","delete","update"] # get | list | watch | create | update | patch | delete

```
Apply `RoleBind`:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: $NEWUSER
  namespace: $NAMESPACE
subjects:
- kind: User
  name: $NEWUSER
  apiGroup: ""
roleRef:
  kind: Role
  name: $NEWUSER
  apiGroup: ""
```
Try to get pods again:
```bash
kubectl get pods
```
#### 6. Configure role bind to group contain users
Switch back to `kubernetes-admin` user
Apply `Role`:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: $NEWUSER
rules:
- apiGroups: ["","extensions","apps"]
  resources: ["pods","deployments","replicasets"]
  verbs: ["get","list","watch","create","patch","delete","update"] # get | list | watch | create | update | patch | delete

```
Apply `RoleBind`:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: $NEWUSER
  namespace: $NAMESPACE
subjects:
- kind: Group
  name: $GROUP
  apiGroup: ""
roleRef:
  kind: Role
  name: $NEWUSER
  apiGroup: ""
```
Try to get pods again:
```bash
kubectl get pods
```

Test other user power when in `kubebernetes-admin`:
eg:
```bash
kubectl get pods --as system:basic-user
```
## 5 Verify image with kyverno, cosign, trivy
#### 1. Generate keypair 
```bash
cosign generate-key-pair
```
```bash
docker image ls --digests
```
#### 2. Sign 
```bash
cosign sign --key cosign.key docker.io/$USERNAME/$IMAGENAME@$HASH
```
#### 3. Scan
```bash
trivy image --ignore-unfixed  --format cosign-vuln --output vuln.json docker.io/$USERNAME/$IMAGENAME@$HASH
```
#### 4. Attest
```bash
cosign attest --key cosign.key --type vuln --predicate vuln.json docker.io/$USERNAME/$IMAGENAME@$HASH
```
```bash
cosign verify-attestation --key cosign.pub --type vuln $USERNAME/$IMAGENAME@$HASH
```
#### 5. Kyverno policy
```yaml
apiVersion: kyverno.io/v1 
kind: ClusterPolicy 
metadataá: 
  name: check-vulnerabilities 
spec: 
  validationFailureAction: Enforce 
  background: false 
  webhookTimeoutSeconds: 30 
  failurePolicy: Fail 
  rules: 
    - name: checking-vulnerability-scan-not-older-than-one-hour 
      match: 
        any: 
        - resources: 
            kinds: 
              - Pod 
      verifyImages: 
      - imageReferences: 
        - "*" 
        attestations: 
        - type: https://cosign.sigstore.dev/attestation/vuln/v1 
          conditions: 
          - all: 
            - key: "{{ time_since('','{{ metadata.scanFinishedOn }}', '') }}" 
              operator: LessThanOrEquals 
              value: "1h" 
          attestors: 
          - count: 1 
            entries: 
            - keys: 
                publicKeys: |- 
                  -----BEGIN PUBLIC KEY----- 
                  abc 
                  xyz 
                  -----END PUBLIC KEY----- 
```
kubectl apply –f policy.yaml 
```

## TRICKS
### 1. Aliases
Write to `$HOME/.bashrc`
```bash
aliases kgp=kubectl get pod
```

## DEEP DIVE
Get kubeproxy mode:
```bash
curl localhost:10249/proxyMode
```
Modes include: iptables, ipvs, nftables

list ip table rules:
```bash
sudo iptables -S  # List all iptables rules
```
