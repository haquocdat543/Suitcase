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
Apply `Group`:
```
apiVersion: v1
kind: Group
metadata:
  name: $GROUP
```
Apply `UserSubjectBind`:
```
apiVersion: rbac.authorization.k8s.io/v1
kind: UserSubjectBind
metadata:
  name: $BIND_NAME
subjects:
- kind: User
  name: $NEWUSER
objectRef:
  kind: Group
  name: $GROUP
```
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
```
kubectl apply –f policy.yaml 
```
