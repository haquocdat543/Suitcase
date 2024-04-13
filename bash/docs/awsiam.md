# AWS IAM

### Practices
#### 1. Allow create resources with only specific tag
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowDescribeAll",
      "Effect": "Allow",
      "Action": "ec2:Describe*",
      "Resource": "*"
    },
    {
      "Sid": "AllowRunInstances",
      "Effect": "Allow",
      "Action": "ec2:RunInstances",
      "Resource": {
         "arn:aws:ec2:*::image/*",
         "arn:aws:ec2:*::snapshot/*",
         "arn:aws:ec2:*:*:subnet/*",
         "arn:aws:ec2:*:*:network-interface/*",
         "arn:aws:ec2:*:*:security-group/*",
         "arn:aws:ec2:*:*:key-pair/*"
      }
    },
    {
      "Sid": "AllowRunInstancesWithRestriction",
      "Effect": "Allow",
      "Action": [
        "ec2:createVolume",
        "ec2:RunInstances"
      ],
      "Resource": [
        "arn:aws:ec2:*:*:volume/*",
        "arn:aws:ec2:*:*:instance/*",
        "arn:aws:ec2:*:*:network-interface/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:requestTag/env": ["dev", "prod"]
        },
        "ForAnyValue:StringEquals": {
          "aws:TagKeys": ["env"]
        }
      }
    }
  ]
}
```

### Ref
#### EC2
Instance
```
ec2:DescribeInstances
ec2:RunInstances
ec2:StartInstances
ec2:StopInstances
ec2:TerminateInstances
```

Tags
```
ec2:CreateTags
ec2:DeleteTags
```

Security Group
```
ec2:DescribeSecurityGroups
ec2:AuthorizeSecurityGroupIngress
ec2:AuthorizeSecurityGroupEgress
ec2:RevokeSecurityGroupIngress
ec2:RevokeSecurityGroupEgress
```

Keypair
```
ec2:DescribeKeyPairs
ec2:CreateKeyPair
ec2:ImportKeyPair
ec2:DeleteKeyPair
```
