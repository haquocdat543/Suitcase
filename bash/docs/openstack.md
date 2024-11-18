# OPENSTACk

### Services
Openstack vs AWS:
* Keystone - IAM
* Nova - EC2 Instance
* Glance - VMI ( Virtual Machine Image )
* Octavia - EC2 Loadbalancing
* Trova - RDS
* Cinder - EBS
* Swift - S3
* Zaqar - SQS
* Barbican - KMS
* Neutron - VPC
* Heat - CloudFormation
* Ceilometer - CloudWatch
* Aodh - CloudTrail
* Freezer - Backup
* Sahara - EMR
* Searchlight - SageMaker

### Configuration
Ensure credential:
```
source ~/my-cloud-openrc.sh
```

### Nova
List machine types:
```
openstack flavor list
```
It will return a list of `m1.small`, `m1.medium`


List of VMI:
```
openstack image list
```

Create new Nova instance:
```
openstack server create --flavor m1.small --image Ubuntu-20.04 --network public --key-name my-key my-instance
```

List of instances:
```
openstack server list
```
