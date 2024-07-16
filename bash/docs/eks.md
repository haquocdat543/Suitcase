# EKS

### 1. AWS Loadbalancer Controller
#### 1. Install using Helm

Get IAM policy json:
```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/install/iam_policy.json
```

Create IAM policy use CLI:
```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

Create IAM role [ need to replace `cluster`, `account_number` ]:
```
eksctl create iamserviceaccount \
  --cluster=my-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```

Add EKS helm repo:
```
helm repo add eks https://aws.github.io/eks-charts
```

Update EKS helm repo:
```
helm repo update eks
```

view the `available versions` of the `Helm Chart` and `Load Balancer Controller`:
```
helm search repo eks/aws-load-balancer-controller --versions
```

Install EKS helm repo [ need to replace `clusterName` ]:
```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=my-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller 
```

Verify that the controller is installed:
```
kubectl get deployment -n kube-system aws-load-balancer-controller
```

Delete role stack [ need to replace `clusterName` ]:
```
aws cloudformation delete-stack --stack-name eksctl-${clusterName}-addon-iamserviceaccount-kube-system-aws-load-balancer-controller
```

Delete policy [ need to replace `accountId` ]:
```
aws iam delete-policy \
    --policy-arn arn:aws:iam::123456789012:policy/AWSLoadBalancerControllerIAMPolicy
```
#### 2. Test with 2048 game
Install using manifest from internet:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/examples/2048/2048_full.yaml
```

Get ingress:
```
kubectl get ingress/ingress-2048 -n game-2048
```
Output:
```
NAME           CLASS    HOSTS   ADDRESS                                                                   PORTS   AGE
ingress-2048   <none>   *       k8s-game2048-ingress2-xxxxxxxxxx-yyyyyyyyyy.region-code.elb.amazonaws.com   80      5m25s
```

Check logs if error occured:
```
kubectl logs -f -n kube-system -l app.kubernetes.io/instance=aws-load-balancer-controller
```

Delete 2048 app:
```
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/examples/2048/2048_full.yaml
```

### 2. Upgrade EKS
Get cluster information:
```
aws eks describe-cluster --name <cluster_name> --query "cluster.version"
```

Upgrade command:
```
aws eks update-cluster-version --name <cluster_name> --kubernetes-version <new_version>
```

List node group:
```
aws eks list-nodegroups --cluster-name <cluster_name>
```

Check node group version:
```
aws eks describe-nodegroup --cluster-name <cluster_name> --nodegroup-name <nodegroup_name> --query "nodegroup.version"
```

Upgrade node group version:
```
aws eks update-nodegroup-version --cluster-name <cluster_name> --nodegroup-name <nodegroup_name> --version <new_version>
```
