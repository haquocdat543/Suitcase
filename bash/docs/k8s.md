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
## RESOURCES
## 1. Pod
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

## 2. ReplicaSet
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
