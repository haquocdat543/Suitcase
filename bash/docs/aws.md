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

##### 2. Permissions
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

