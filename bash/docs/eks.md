# EKS

## 1. AWS CLI
### 1. AWS Loadbalancer Controller
#### 1. Install using Helm

Get IAM policy json:
```bash
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/install/iam_policy.json
```

Create IAM policy use CLI:
```bash
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

Create IAM role [ need to replace `cluster`, `account_number` ]:
```bash
eksctl create iamserviceaccount \
  --cluster=my-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```

Add EKS helm repo:
```bash
helm repo add eks https://aws.github.io/eks-charts
```

Update EKS helm repo:
```bash
helm repo update eks
```

view the `available versions` of the `Helm Chart` and `Load Balancer Controller`:
```bash
helm search repo eks/aws-load-balancer-controller --versions
```

Install EKS helm repo [ need to replace `clusterName` ]:
```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=my-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller 
```

Verify that the controller is installed:
```bash
kubectl get deployment -n kube-system aws-load-balancer-controller
```

Delete role stack [ need to replace `clusterName` ]:
```bash
aws cloudformation delete-stack --stack-name eksctl-${clusterName}-addon-iamserviceaccount-kube-system-aws-load-balancer-controller
```

Delete policy [ need to replace `accountId` ]:
```bash
aws iam delete-policy \
    --policy-arn arn:aws:iam::123456789012:policy/AWSLoadBalancerControllerIAMPolicy
```
#### 2. Test with 2048 game
Install using manifest from internet:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/examples/2048/2048_full.yaml
```

Get ingress:
```bash
kubectl get ingress/ingress-2048 -n game-2048
```
Output:
```bash
NAME           CLASS    HOSTS   ADDRESS                                                                   PORTS   AGE
ingress-2048   <none>   *       k8s-game2048-ingress2-xxxxxxxxxx-yyyyyyyyyy.region-code.elb.amazonaws.com   80      5m25s
```

Check logs if error occured:
```bash
kubectl logs -f -n kube-system -l app.kubernetes.io/instance=aws-load-balancer-controller
```

Delete 2048 app:
```bash
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/examples/2048/2048_full.yaml
```

### 2. Upgrade EKS
Get cluster information:
```bash
aws eks describe-cluster --name <cluster_name> --query "cluster.version"
```

Upgrade command:
```bash
aws eks update-cluster-version --name <cluster_name> --kubernetes-version <new_version>
```

List node group:
```bash
aws eks list-nodegroups --cluster-name <cluster_name>
```

Check node group version:
```bash
aws eks describe-nodegroup --cluster-name <cluster_name> --nodegroup-name <nodegroup_name> --query "nodegroup.version"
```

Upgrade node group version:
```bash
aws eks update-nodegroup-version --cluster-name <cluster_name> --nodegroup-name <nodegroup_name> --version <new_version>
```

## 2. EKSCTL
Create cluster with configuration:
```bash
eksctl create cluster -f cluster.yaml
```

Configuration for cluster [ cluster.yaml ]:
```yaml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: KubeCenter
  region: ap-southeast-1

nodeGroups:
  - name: platform
    instanceType: m5.large
    desiredCapacity: 8
  - name: development
    instanceType: m5.xlarge
    desiredCapacity: 2
  - name: production
    instanceType: m5.xlarge
    desiredCapacity: 4
```
