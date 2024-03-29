# K8S DOCUMENTATION BY HAQUOCDAT

## HELP
If you want more info about specific command, just add `-h` at the end:
Eg:
```
kubectl create role -h
```
Output:
```
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
```
kubectl explain pods
```
```
kubectl explain pod.spec
```

Command
```
kubectl create pod firstpod --image=nginx
```
Yaml:
```
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
```
kubectl apply -f $POD_FILE
```

Command
```
kubectl create pod firstpod --image=nginx
```
Yaml:
```
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
```
kubectl apply -f $POD_FILE
```
Get pod:
```
kubectl get pod
```

Selection node:
```
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

```
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
```
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
```
kubectl scale rc kubia --replicas=10
```

### 8. Scale RC by edit
```
kubectl edit rc kubia
```
When you `save the` file and `close the editor`, the `ReplicationController is updated` and `it immediately scales` the number of pods to `10`:

### 9. Delete RC only and pods still alive
Deleting a replication controller with `--cascade=false` leaves pods `unmanaged`.
```
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
```
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
 
```
kubectl get po kubia-liveness
```
The `RESTARTS` column shows that the pod’s container has `been restarted once` (if you wait another `minute and a half`, it gets `restarted again`, and then the `cycle continues indefinitely`).

Get log from previous run:
```
kubectl logs mypod --previous
```

Add delay to http probe
```
initialDelaySeconds: 15
```

* A TCP Socket probe tries to open a TCP connection to the specified port of the container. If the connection is established successfully, the probe is successful. Otherwise, the container is restarted
* An Exec probe executes an arbitrary command inside the container and checks the command’s exit status code. If the status code is 0, the probe is successful. All other codes are considered failures. 

### Readiness probes
* An `Exec` probe, where a `process is executed`. The container’s status is `determined` by the `process’ exit status code`.
* An `HTTP GET` probe, which sends an `HTTP GET request` to the container and the `HTTP status code` of the response determines whether the container is `ready or not`.
* A `TCP Socket` probe, which opens a `TCP connection` to a `specified port` of the container. If the connection is `established`, the container is `considered ready`
```
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
```
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
```
kubectl create replicaset firstrs --image=nginx
```

Short command:
```
kubectl create rs firstrs--image=nginx
```

Yaml:
```
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
```
kubectl apply -f $REPLICASET_FILE
```

Get replicaset:
```
kubectl get rs
```
## 3. Deployment

Eg:
```
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
```
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
```
kubectl label node NewNode disk=ssd
```
If you have `multiple nodes` and you add the `same label` to further nodes, you’ll see the DaemonSet `spin up pods` for `each of them`. 

### 4. Removing  the required label to your node(s)
imagine you’ve made a `mistake` and have `mislabeled` one of the nodes. It has a `spinning disk drive`, `not an SSD`. What `happens` if you `change` the `node’s label`?

```
kubectl label node minikube disk=hdd --overwrite
```
The pod is being `terminated`. But you knew that was going to happen, right? This wraps up your exploration of DaemonSets, so you may want to delete your `ssd-monitor DaemonSet`. If you still have any other daemon pods running, you’ll see that deleting the DaemonSet deletes those pods as well. 

Eg:
```
kubectl create daemonsets firstdms --image=fluentd
```
## 5. StatefulSets
Eg:
```
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
```
kubectl exec kubia-xxxxx env
```

Output:
```
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
```
backend-database.default.svc.cluster.local
```
* `backend-database` corresponds to the `service name`, `default` stands for the `namespace` the service is defined in, and `svc.cluster.local` is a `onfigurable` cluster domain suffix used in all cluster local service names. 

### 7. running a shell in a pod’s container
```
curl http://kubia.default.svc.cluster.local
```

```
curl http://kubia.default
```

```
curl http://kubia
```

```
cat /etc/resolv.conf
```

### 8. understanding why you can’t ping a service ip
Inside container:
```
ping kubia
```
* `curl-ing` the `service works`, but `pinging` it `doesn’t`. That’s because the service’s `cluster IP` is a `virtual IP`, and only has meaning when combined with the service port

### 9. Endpoint
* An Endpoints resource (yes, plural) is a `list of IP addresses` and `ports` exposing a service. The Endpoints resource is like any other` Kubernetes resource`, so you can `display its basic` info with `kubectl` get:
```
kubectl get endpoints kubia
```

### 10. Manually configuring service endpoints
Service:
```
apiVersion: v1
kind: Service
metadata:
  name: external-service
    spec:
      ports:  - port: 80    
```

Endpoint:
```
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
```
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
```
spec:
  externalTrafficPolicy: Local
```

### 13. Creating a headless service
* You’ve seen how services can be used to provide a `stable IP address` allowing clients to `connect to pods` (or other `endpoints`) backing each service. `Each connection` to the service is `forwarded` to one randomly selected backing pod. But what if the client needs to `connect to all` of `those pods`?
* For a client to connect to `all pods`, it needs to `figure out` the the `IP` of `each individual pod`.
```
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
```
kubectl exec dnsutils nslookup kubia-headless
```

### 15. Discovering all pods—even those that aren’t ready
```
kind: Service
metadata:
 annotations: service.alpha.kubernetes.io/tolerate-unready-endpoints: "true"
```

```
apiVersion: v1
kind: Service
spec:
  sessionAffinity: ClientIP
```

yaml:
```
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
```
openssl genrsa -out tls.key 2048
openssl req -new -x509 -key tls.key -out tls.cert -days 360 -subj /CN=kubia.example.com
```

Create secret like this:
```
kubectl create secret tls tls-secret --cert=tls.cert --key=tls.key
```

Signing certificates through the CertificateSigningRequest resource:
```
kubectl certificate approve <name of the CSR>
```
```
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
```
curl -k -v https://kubia.example.com/kubia
```

yaml:
```
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
```
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
yaml:
```
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
```
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
yaml:
```
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
```
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
```
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
yaml:
```
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
```
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
```
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
```
...
  volumes:
    - name: config
      configMap:
        name: nginx-config
        items:
          - key: my-nginx-config.conf
            path: gzip.conf # change name of file from my-nginx-config.conf to gzip.conf
```
```
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
```
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
```
...
  volumes:
    - name: config # volume use configmap as content
      configMap:
        name: nginx-config # configmap name
        defaultMode: "0600"
```

## 15. Secret
literal:
```
kubectl create secret generic postgres-config --from-literal=DB=postgres --from-literal=USER=postgres --from-literal=PASSWORD=postgres
```

yaml:
```
apiVersion: v1
kind: Secret
metadata:
  name: dotfile-secret
data:
  .secret-file: dmFsdWUtMg0KDQo=
```
## 16. StorageClass
yaml:
```
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
```
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
```
volumes:
  - name: html
    emptyDir:
      medium: Memory
```

#### 4. GitRepo
* When you create the pod, the volume is first initialized as an `empty directory` and then the `specified Git repository` is `cloned into it`. If you hadn’t set the `directory` to `. (dot)`, the repository would have been `cloned into` the `kubia-website-example` subdirectory, which isn’t what you want. You want the repo to be `cloned into the root` directory of your volume. Along with the repository, you also specified you want Kubernetes to check out whatever revision the `master branch` is pointing to at the time the `volume is created`. 
```
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
```
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
```
spec:
  volumes:
  - name: mongodb-data
    gcePersistentDisk:
      pdName: mongodb
      fsType: ext4
...
```
After you create the `PersistentVolume` with the `kubectl create` command, it should be `ready to be claimed`. See if it is by `listing all PersistentVolumes:`
```
kubectl get pv
```
* PersistentVolumes, like `cluster Nodes`, `don’t belong` to `any namespace`, unlike pods and `PersistentVolumeClaims`.

Claim PersistentVolume:
```
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
```
kubectl get pvc
```

access modes:
* `RWO—ReadWriteOnce` Only a single node can mount the volume for reading and writing.
* `ROX—ReadOnlyMany` Multiple nodes can mount the volume for reading.
* `RWX—ReadWriteMany` Multiple nodes can mount the volume for both reading and writing.

Note: PersistentVolume resources are `cluster-scoped` and thus cannot be created in a `specific namespace`, but `PersistentVolumeClaims` can only be created in a `specific namespace`. They can then only be used by pods in the `same namespace`.

### 6. Using a PersistentVolumeClaim in a pod
* The `PersistentVolume` is `now yours to use`. Nobody else can claim the same volume `until you release it`. To use it `inside a pod`, you need to reference the `PersistentVolumeClaim` by name inside the `pod’s volume` (yes, the `PersistentVolumeClaim`, not the `PersistentVolume` directly!)
```
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
```
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
```
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
```
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
```
spec:
 completions: 5
 parallelism: 2
   template:
```
* Completion: The job must ensure 5 jobs complete successful
* Parallel : Only 2 jobs can run parallel.

Scale a job:
* You can even change a `Job’s parallelism property` while the Job is `running`. This is `similar` to scaling a `ReplicaSet` or `ReplicationController`, and can be done with the `kubectl scale` command:
```
kubectl scale job multi-completion-batch-job --replicas 3
```

Time limit:
* A pod’s time can be `limited` by setting the `activeDeadlineSeconds` property in the pod spec. If the pod runs `longer` than that, the system will try to `terminate` it and will mark the Job as `failed`.

Retry limit:
* You can configure `how many times` a Job can be `retried` before it is marked as `failed` by specifying the `spec.backoffLimit` field in the Job manifest. If you `don't explicitly` specify it, it `defaults to 6`.

## 20. CronJob
yaml:
```
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
```
apiVersion: batch/v1beta1
kind: CronJob
spec:
 schedule: "0,15,30,45 * * * *"
 startingDeadlineSeconds: 15  
```

## 20. Namespace
* Kubernetes namespaces provide a `scope for objects names`. Instead of having `all your resources in one single namespace`, you can split them into `multiple namespaces`, which also allows you to use the `same resource names multiple times` (across different namespaces).
* Resource names only need to be `unique within a namespace`. Two `different namespaces` can contain `resources of the same name`. But, while `most types of resources are namespaced`, a `few aren’t`. One of them is the `Node resource`, which is `global` and not tied to a `single namespace`

```
apiVersion: v1
kind: Namespace
metadata:
  name: custom-namespace  
```
* Namespaces allow you to `isolate objects` into `distinct groups`, which allows you to `operate only` on those `belonging to the specified namespace`, they `don’t provide` any kind of `isolation of running objects`. 
* For example, you may think that when `different users` deploy `pods across different namespaces`, those pods are `isolated from each other and can’t communicate`, but that’s not necessarily the case. Whether namespaces provide `network isolation` depends on which networking solution is deployed with Kubernetes. When the solution `doesn’t provide inter-namespace network isolation`, if a pod in namespace foo knows `the IP address of a pod in namespace bar`, there is `nothing preventing` it from sending traffic, such as HTTP requests, to the other pod.

## LABELS, ANNOTATION, TAINT
### 1. Label
#### 1. Nodes
get nodes with labels:
```
kubectl get nodes --show-labels
```

label a node:
```
kubectl label nodes <node-name> <key>=<value>
```

Example:
```
kubectl label nodes worker-01 disktype=ssd
```

#### 2. Pods ( Other resources type are same )
get pods with labels:
```
kubectl get pods --show-labels
```

label a node:
```
kubectl label pod <node-name> <key>=<value>
```
Example:
```
kubectl label pod firstpod admin=true
```
```
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
```
tolerations:
  - key: node-type
    Operator: Equal
    value: production
    effect: NoSchedule
```

## Liveness probe and readiness
### 1. Liveness probe
```
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
```
creationTimestamp: 2023-03-18T12:37:50Z
```

### 2. Generate name
```
generateName: kubia-
```

## AFFINITY AND CPU, RAM
### 1. Show node resources
```
kubectl describe nodes
```
* Capacity
* Allocatable

```
kubectl describe node
```

### 2. Request
#### 1. Example
```
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
```
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

### 5. LimitRange
```
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
kubectl version
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
## 3 RBAC
#### 1. Create user
```
sudo useradd -m -G sudo -s /bin/bash/$NEWUSER
```
```
sudo passwd $NEWUSER
```
```
su - $NEWUSER
```
#### 2. Generate and sign key
```
openssl genrsa -out $NEWUSER.key 2048
```
```
openssl req -new -key $NEWUSER.key -out $NEWUSER.csr -subj "/CN=$NEWUSER/O=k8s"
```
```
sudo openssl x509 -req -in $NEWUSER.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out $NEWUSER.crt -days 1800
```
#### 3. Configure kubeconfig
```
mkdir -p /home/$NEWUSER/.kube
```
```
sudo cp -i /etc/kubernetes/admin.conf /home/$NEWUSER/.kube/config
```
```
sudo chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.kube
```
```
kubectl config set-credentials $NEWUSER --client-certificate=/home/$NEWUSER/$NEWUSER.crt --client-key=/home/$NEWUSER/$NEWUSER.key
```
#### 4. Configure context
```
kubectl config set-context $NEWUSER-context --cluster=kubernetes --namespace=$NAMESPACE --user=$NEWUSER
```
```
kubectl config use-context $NEWUSER-context
```
This is command will fail because there is no `Roles` or `ClusterRole` bind to `$NEWUSER`
```
kubectl get pods
```
```
kubectl config get-context
```
#### 5. Configure role bind to user
Switch back to `kubernetes-admin` user

Apply `Role`:
```
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
```
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
```
kubectl get pods
```
#### 6. Configure role bind to group contain users
Switch back to `kubernetes-admin` user
Apply `Role`:
```
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
```
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
```
kubectl get pods
```

Test other user power when in `kubebernetes-admin`:
eg:
```
kubectl get pods --as system:basic-user
```
## 5 Verify image with kyverno, cosign, trivy
#### 1. Generate keypair 
```
cosign generate-key-pair
```
```
docker image ls --digests
```
#### 2. Sign 
```
cosign sign --key cosign.key docker.io/$USERNAME/$IMAGENAME@$HASH
```
#### 3. Scan
```
trivy image --ignore-unfixed  --format cosign-vuln --output vuln.json docker.io/$USERNAME/$IMAGENAME@$HASH
```
#### 4. Attest
```
cosign attest --key cosign.key --type vuln --predicate vuln.json docker.io/$USERNAME/$IMAGENAME@$HASH
```
```
cosign verify-attestation --key cosign.pub --type vuln $USERNAME/$IMAGENAME@$HASH
```
#### 5. Kyverno policy
```
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
```
aliases kgp=kubectl get pod
```

## DEEP DIVE
Get kubeproxy mode:
```
curl localhost:10249/proxyMode
```
Modes include: iptables, ipvs, nftables

list ip table rules:
```
sudo iptables -S  # List all iptables rules
```
