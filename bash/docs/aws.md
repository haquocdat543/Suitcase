# AWS Docs

## 
### Start 
#### Basic
##### 1. Regions
* AWS has `many` regions around the `world`.
* A region is a `cluster of data centers`
* Names can be `us-east-1`, `eu-west-3`,...
* A region is attach to a city
  * `ap-northeast-1` Tokyo
  * `ap-southeast-1` Singapore
  * `...`

##### 2. Zones
* Each region has many availability zones:
* usually 3, min is 2, max is 6
  * Tokyo
    * ap-northeast-1a
    * ap-northeast-1c
    * ap-northeast-1d
  * Singapore
    * ap-southeast-1a
    * ap-southeast-1b
    * ap-southeast-1c
* Each availability zone (AZ) is one or more `discrete data centers` with `redundant` `power`, `networking`, and `connectivity`
* They’re `separate from each other`, so that they’re `isolated from disasters`
* They’re `connected with` `high bandwidth`, `ultra-low latency networking`

##### 3. AWS Points of Presence (Edge Locations)
* Content is `delivered` to `end users` with `lower latency`

#### 1. IAM and CLI
##### 1. User and Group
* `IAM`: `Global service`
* `Root account` created by `default`, `shouldn’t` be `used` or `shared`
* `Users` are `people` within your `organization`, and `can be grouped`
* `Groups` only `contain users`, `not other groups`
* Users `don’t have` to `belong` to `a group`, and user can `belong` to `multiple groups`

##### 2. Policy
###### 1. Overview
* `Users` or `Groups` can be assigned `JSON documents` called `policies`
* `These policies` define the `permissions`
* In AWS you apply the `least privilege principle`: don’t give `more permissions` than a `user needs` 

Sample:
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:Describe*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "elasticloadbalancing:Describe*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:ListMetrics",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
```

###### 2. AWS managed
AdministratorAccess:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
```

PowerUserAccess:
```
{
  "Version" : "2012-10-17",
  "Statement" : [
    {
      "Effect" : "Allow",
      "NotAction" : [
        "iam:*",
        "organizations:*",
        "account:*"
      ],
      "Resource" : "*"
    },
    {
      "Effect" : "Allow",
      "Action" : [
        "iam:CreateServiceLinkedRole",
        "iam:DeleteServiceLinkedRole",
        "iam:ListRoles",
        "organizations:DescribeOrganization",
        "account:ListRegions",
        "account:GetAccountInformation"
      ],
      "Resource" : "*"
    }
  ]
}
```

###### 3. User managed
BucketAccesser
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::example-bucket"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::example-bucket/*"
        }
    ]
}
```

###### 4. IAM Policies Conditions
* "Condition" : { "{condition-operator}" : { "{condition-key}" : "{condition-value}" }}

* String (StringEquals, StringNotEquals, StringLike,... )
  * "Condition": {"StringEquals": {"aws:PrincipalTag/job-category": "iamuser-admin"}}
  * "Condition": {"StringLike": {"s3:prefix": [ "", "home/", "home/${aws:username}/" ]}}
* Numeric (NumericEquals, NumericNotEquals, NumericLessThan,...)
* Date (DateEquals, DateNotEquals, DateLessThan,...)
* Boolean (Bool):
  * “Condition": {"Bool": {"aws:SecureTransport": "true"}}
  * "Condition": {"Bool": {"aws:MultiFactorAuthPresent": "true"}}
* (Not)IpAddress: 
  * "Condition": {"IpAddress": {"aws:SourceIp": "203.0.113.0/24"}} 
* ArnEquals, ArnLike
* Null: "Condition":{"Null":{"aws:TokenIssueTime":"true"}} 

###### 5. IAM Policies Variables and Tags
* Example: ${aws:username}
  * "Resource": ["arn:aws:s3:::mybucket/${aws:username}/*"] 
* AWS Specific:
  * aws:CurrentTime, aws:TokenIssueTime, aws:principaltype, aws:SecureTransport, 
  * aws:SourceIp, aws:userid, ec2:SourceInstanceARN
* Service Specific:
  * s3:prefix, s3:max-keys, s3:x-amz-acl, sns:Endpoint, sns:Protocol,...
* Tag Based:
  * iam:ResourceTag/key-name, aws:PrincipalTag/key-name,...

###### 6. IAM Roles vs Resource Based Policies
* When you `assume a role` (user, application or service), you `give up` your `original permissions` and `take` the `permissions assigned` to the role
* When using a `resource-based` policy, the principal `doesn’t` have to `give up any permissions`
* Example: User in `account A` needs to `scan a DynamoDB table` in `Account A` and `dump` it in an `S3 bucket` in `Account B`.
* Supported by: `Amazon S3 buckets`, `SNS topics`, `SQS queues`, `Lambda functions`, `ECR`, `Backup`, `EFS`, `Glacier`, `Cloud9`, `AWS Artifact`, `Secrets Manager`, `ACM`, `KMS`, `CloudWatch Logs`, `API Gateway`, `EventBridge` etc… 

###### 7. IAM Permission Boundaries
* IAM Permission Boundaries are supported for `users` and `roles` (not groups)
* Advanced feature to use a managed policy to set the `maximum permissions` an `IAM entity` can get. 
AWS IAM Boundary;
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:*",
                "s3:*",
                "cloudwatch:*"
            ],
            "Resource": "*"
        }
    ]
}
```

IAM Entity policy;
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreatePolicy",
                "iam:AttachUserPolicy",
                "iam:DetachUserPolicy",
                "iam:ListAttachedUserPolicies",
                "iam:ListPolicyVersions"
            ],
            "Resource": "*"
        }
    ]
}
```
Combination of these two policies is `no permission` =))

Use cases:
* Delegate `responsibilities` to `non administrators` within `their permission boundaries`, for example `create new IAM users`
* Allow developers to `self-assign policies` and `manage their own permissions`, while making sure they `can’t “escalate”` their privileges (= `make themselves admin`)
* Useful to `restrict` one specific user (instead of a whole account using Organizations & SCP)

##### 3. IAM Policies Structure
* `Version`: policy language version, always include “`2012-1017`”
* `Id`: an identifier for the policy (`optional`)
* `Statement`: one or more individual statements (`required`)
* `Sid`: an identifier for the statement (`optional`)
* `Effect`: whether the statement `allows` or `denies` access (`Allow`, `Deny`)
* `Principal`: `account/user/role` to which this policy applied to
* `Action`: `list of actions` this policy allows or denies
* `Resource`: `list of resources` to which the actions applied to
* `Condition`: `conditions` for `when` this policy is in effect (`optional`)

##### 4. Password policy
* Strong passwords = `higher security` for your account
* In AWS, you can setup a `password policy`:
  * Set a `minimum` password `length`
  * Require `specific character` types:
    * including uppercase letters
    * UPPERCASE character
    * lowercase character
    * non-alphanumeric characters
  * Allow all IAM users to `change their own passwords`
  * Require users to change their password after some time (`password expiration`)
  * Prevent password `re-use`

##### 5. Multi Factor Authentication - MFA
* MFA = `password you know` + `security device you own`
* if a password is `stolen` or `hacked`, the account is `not compromised`

Virtual
* Google Authenticator
* Authy
* ( Support for `multiple tokens` on a `single device` )

Hardware
* yubikey ( Support for multiple root and IAM users using a single security key )
* Hardware Key Fob MFA Device 
* Hardware Key Fob MFA Device for AWS GovCloud (US)

##### 6. Access Keys & Secret key
* Example:
  * Access key: `AKIASK4E37PV4983d6C`
  * Secret Key: `AZPN3zojWozWCndIjhB0Unh8239a1bzbzO5fqqkZq`

##### 7. CLI
* A tool that enables you to interact with AWS services using `commands` in your `command-line` shell
* It’s open-source `https://github.com/aws/aws-cli`

##### 8. SDK
* AWS `Software Development Kit` (AWS SDK)
* Language-specific `APIs` (set of libraries) 

##### 9. Role ( Service account )
* Some AWS service will need to `perform actions` on your behalf
* To do so, we will `assign permissions` to `AWS services` with `IAM Roles`
* Common roles:
  * `EC2` Instance Roles
  * `Lambda Function` Roles
  * Roles for `CloudFormation` 

##### 10. IAM Security tools
* IAM Credentials Report (`account-level`) 
  * a report that lists all your account's users and the status of their various credentials

* IAM Access Advisor (`user-level`)
  * Access advisor shows the service permissions granted to a user and when those services were last accessed.
  * You can use this information to revise your policies.

#### 2. EC2
#### 3. Instance storage
#### 4. HA & Scale
#### 5. Dns
#### 6. Storage
#### 7. Cache
#### 8. Serverless
#### 9. Databases
#### 10. Data & Analytics
#### 11. Networking
#### 12. Machine learning
#### 13. Monitoring
#### 14. Security & Encryption
#### 15. Deployment
#### 16. Cost control
#### 17. Backup
#### 18. Migration
#### 19. Container

