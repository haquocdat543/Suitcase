# AWS IAM

### Practices
#### 1. Allow create resources with only specific tag
```json
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
#### IAM
User
```
iam:CreateUser
iam:DeleteUser
iam:ListUsers
```

Group
```
iam:CreateGroup
iam:DeleteGroup
iam:ListGroups
```

User ->> group
```
iam:AddUserToGroup
iam:RemoveUserFromGroup
```

Policy ->> group
```
iam:AttachGroupPolicy
iam:DetachGroupPolicy
```

Policy
```
iam:CreatePolicy
iam:DeletePolicy
iam:ListPolicies
```

Role
```
iam:CreateRole
iam:DeleteRole
iam:ListRoles
iam:PassRole
iam:ListAttachedRolePolicies
```

Policy ->> role
```
iam:PutRolePolicy
iam:DeleteRolePolicy
iam:GetRolePolicy
```

```
iam:UpdateUser
iam:GetUser
iam:ListGroupsForUser
iam:GetGroup
iam:GetPolicy
```

User Group Policy
```
iam:ListAttachedUserPolicies
iam:ListAttachedGroupPolicies
iam:ListEntitiesForPolicy
```

Simulate
```
iam:SimulatePrincipalPolicy
```

Report
```
iam:GenerateCredentialReport
```

SSH Key
```
iam:UploadSSHPublicKey
iam:DeleteSSHPublicKey
iam:ListSSHPublicKeys
iam:GetSSHPublicKey
```

Access Key
```
iam:CreateAccessKey
iam:DeleteAccessKey
iam:ListAccessKeys
iam:GetAccessKeyLastUsed
```

Login profile
```
iam:DeleteLoginProfile
iam:GetLoginProfile
iam:UpdateLoginProfile
```

MFA
```
iam:EnableMFADevice
iam:DeactivateMFADevice
iam:ListMFADevices
```

Credential
```
iam:ListServiceSpecificCredentials
iam:ResetServiceSpecificCredential
iam:UpdateServiceSpecificCredential
```

```
iam:CreateServiceLinkedRole
iam:ListServiceTags
```

Tag role
```
iam:TagRole
iam:UntagRole
iam:ListRoleTags
```

Policy ->> ( user, group )
```
iam:PutUserPolicy
iam:DeleteUserPolicy
iam:GetUserPolicy
iam:ListUserPolicies
```

Profile
```
iam:ListInstanceProfilesForRole
iam:DeleteInstanceProfile
```

User tag
```
iam:UpdateUserTags
iam:ListUserTags
```

Group policy
```
iam:CreateGroupPolicy
iam:DeleteGroupPolicy
iam:GetGroupPolicy
iam:ListGroupPolicies
```

Saml provider
```
iam:CreateSAMLProvider
iam:DeleteSAMLProvider
iam:ListSAMLProviders
iam:ListRolePolicies
iam:GetContextKeysForCustomPolicy
iam:ListEntitiesForPolicy
iam:ListAttachedGroupPolicies
iam:ListAttachedUserPolicies
iam:DeleteServiceLinkedRole
iam:GetServiceLinkedRoleDeletionStatus
iam:ListRoles
iam:ListInstanceProfiles
iam:GetRole
```

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

#### S3
Bucket
```
s3:CreateBucket
s3:DeleteBucket
s3:ListBucket
s3:GetBucketLocation
```

Object
```
s3:PutObject
s3:GetObject
s3:DeleteObject
```

Multipart upload
```
s3:ListMultipartUploadParts
s3:AbortMultipartUpload
```

Object attribute ( acl, version )
```
s3:GetObjectVersion
s3:PutObjectAcl
s3:GetObjectAcl
```

Bucket policy
```
s3:PutBucketPolicy
s3:GetBucketPolicy
s3:DeleteBucketPolicy
s3:GetBucketPolicyStatus
```

Tag
```
s3:PutBucketTagging
s3:GetBucketTagging
s3:DeleteBucketTagging
```

Website
```
s3:GetBucketWebsite
```

Encryption
```
s3:PutBucketEncryption
s3:GetBucketEncryption
s3:DeleteBucketEncryption
```

Logging
```
s3:PutBucketLogging
s3:GetBucketLogging
s3:DeleteBucketLogging
```

Versioning
```
s3:PutBucketVersioning
s3:GetBucketVersioning
```

Life cycle
```
s3:PutBucketLifecycleConfiguration
s3:GetBucketLifecycleConfiguration
s3:DeleteBucketLifecycleConfiguration
```

Replication
```
s3:PutBucketReplication
s3:GetBucketReplication
s3:DeleteBucketReplication
```

Request Payment
```
s3:PutBucketRequestPayment
s3:GetBucketRequestPayment
```

Notification
```
s3:PutBucketNotification
s3:GetBucketNotification
s3:DeleteBucketNotification
```

Acceleration
```
s3:GetAccelerateConfiguration
```

Inventory
```
s3:GetBucketInventoryConfiguration
s3:PutBucketInventoryConfiguration
s3:DeleteBucketInventoryConfiguration
```

Metric
```
s3:GetBucketMetricsConfiguration
s3:PutBucketMetricsConfiguration
s3:DeleteBucketMetricsConfiguration
```

Version tag
```
s3:GetObjectVersionTagging
s3:PutObjectVersionTagging
s3:DeleteObjectVersionTagging
```

Object retention
```
s3:GetObjectRetention
s3:PutObjectRetention
```

```
s3:BypassGovernanceRetention
s3:GetObjectLegalHold
s3:PutObjectLegalHold
```

Storage lens
```
s3:ListStorageLensConfigurations
s3:GetStorageLensConfiguration
s3:PutStorageLensConfiguration
s3:DeleteStorageLensConfiguration
s3:GetStorageLensConfigurationTagging
s3:PutStorageLensConfigurationTagging
```

Ownership control
```
s3:PutBucketOwnershipControls
s3:GetBucketOwnershipControls
s3:DeleteBucketOwnershipControls
```

Intelligent tier config
```
s3:PutBucketIntelligentTieringConfiguration
s3:GetBucketIntelligentTieringConfiguration
s3:DeleteBucketIntelligentTieringConfiguration
```

Access point
```
s3:GetAccessPoint
s3:PutAccessPointPolicy
s3:GetAccessPointPolicy
s3:DeleteAccessPointPolicy
s3:ListAccessPoints
```

Bucket Acl
```
s3:PutBucketAcl
s3:GetBucketAcl
```


Bucket policy
```
s3:GetBucketPolicyStatus
```

Job
```
s3:PutJobTagging
s3:GetJobTagging
s3:DeleteJobTagging
s3:CreateJob
```
