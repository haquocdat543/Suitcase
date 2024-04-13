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

Image
```
ec2:DescribeImages
ec2:CreateImage
ec2:CopyImage
ec2:DeleteImage
```

Snapshot
```
ec2:DescribeSnapshots
ec2:CreateSnapshot
ec2:DeleteSnapshot
```

Volume
```
ec2:CreateVolume
ec2:AttachVolume
ec2:DetachVolume
ec2:DeleteVolume
```

Vpc
```
ec2:DescribeVpcs
ec2:CreateVpc
ec2:DeleteVpc
```

Subnet
```
ec2:DescribeSubnets
ec2:CreateSubnet
ec2:DeleteSubnet
```

Route table
```
ec2:AssociateRouteTable
ec2:DisassociateRouteTable
ec2:DescribeRouteTables
ec2:CreateRouteTable
ec2:DeleteRouteTable
```
    
Modify attribute
```
ec2:ModifyVpcAttribute
ec2:ModifySubnetAttribute
ec2:ModifySecurityGroupRules
ec2:ModifyInstanceAttribute
```

Network interface
```
ec2:DescribeNetworkInterfaces
ec2:CreateNetworkInterface
ec2:DeleteNetworkInterface
```

AZ, Status, Request
```
ec2:DescribeAvailabilityZones
ec2:DescribeInstanceStatus
ec2:DescribeReservedInstances
ec2:DescribeSpotInstanceRequests
```

Placement group
```
ec2:DescribePlacementGroups
ec2:CreatePlacementGroup
ec2:DeletePlacementGroup
```

Reserve & Spot
```
ec2:ModifyReservedInstances
ec2:ModifySpotFleetRequest
ec2:RequestSpotInstances
ec2:CancelSpotInstanceRequests
```

Fleet
```
ec2:DescribeFleetHistory
ec2:DescribeFleetInstances
ec2:DescribeFleets
ec2:DescribeLocalGatewayRouteTables
```
