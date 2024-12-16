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
#### Client
Ensure credential:
```bash
source ~/my-cloud-openrc.sh
```

#### Server
In OpenStack, configuration files are used to define settings and parameters for various services (such as Nova, Neutron, Cinder, Keystone, etc.). These files are typically found on each OpenStack node and contain service-specific configurations, authentication details, and networking parameters. The configuration files are usually located in /etc/<service_name>/ directory on each server.
##### 1. nova.conf
```toml
[DEFAULT]
# General settings for the Nova service
debug = true
use_forwarded_for = true
rpc_backend = rabbit
auth_strategy = keystone
my_ip = 192.168.1.100
vnc_enabled = true
vncserver_listen = 0.0.0.0
vncserver_proxyclient_address = 0.0.0.0
novncproxy_base_url = http://192.168.1.100:6080/vnc_auto.html

# Log settings
log_dir = /var/log/nova
log_file = nova.log

# Networking (via Neutron)
network_api_class = nova.network.neutronv2.api.API
security_group_api = neutron
linuxnet_interface_driver = nova.network.linux_net.LinuxBridgeInterfaceDriver
firewall_driver = nova.virt.firewall.NoopFirewallDriver

# Compute configuration
compute_driver = libvirt.LibvirtDriver
cpu_mode = none
vif_plugging_is_fatal = True
vif_plugging_timeout = 300

[keystone_authtoken]
# Keystone authentication settings
auth_uri = http://controller:5000
auth_url = http://controller:35357
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = nova
password = <nova-password>

[api]
# API settings
auth_strategy = keystone
enabled_apis = osapi_compute,metadata
```

##### 2. neutron.conf
```toml
[DEFAULT]
# General settings for the Neutron service
debug = true
core_plugin = ml2
service_plugins = router
auth_strategy = keystone
rpc_backend = rabbit
allow_overlapping_ips = True

# Logging
log_dir = /var/log/neutron
log_file = neutron.log

[keystone_authtoken]
# Keystone authentication settings for Neutron
auth_uri = http://controller:5000
auth_url = http://controller:35357
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = neutron
password = <neutron-password>

[database]
# Database configuration
connection = mysql+pymysql://neutron:<db-password>@controller/neutron

[ml2]
# ML2 plugin configuration for Neutron
type_drivers = flat,vlan,gre,vxlan
tenant_network_types = vlan,gre
mechanism_drivers = openvswitch,l2population

[ovs]
# Open vSwitch specific settings
bridge_mappings = physnet1:br-ex
```

### Nova
List machine types:
```bash
openstack flavor list
```
It will return a list of `m1.small`, `m1.medium`


List of VMI:
```bash
openstack image list
```

Create new Nova instance:
```bash
openstack server create --flavor m1.small --image Ubuntu-20.04 --network public --key-name my-key my-instance
```

List of instances:
```bash
openstack server list
```
