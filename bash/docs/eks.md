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
