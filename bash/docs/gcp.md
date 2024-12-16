# GCP

## 
### 
#### Basic
##### 1. Multi regions
* `Large geograpgic area` thar contains `two` or `more regions`

##### 2. Region
* Region are `independent geographic areas` that are `subdivide` into zones
* For `fault tolerent` and `high availability`
* Intercommunication `less than 5ms` between `zones` of a `region`
* Eg: `us-east4`

##### 3. Zone
* A zone is a `deployment area` for Google Cloud resources `winthin a region`. The `smallest entity` of Google Cloud's `global infrastructure`.

##### 4. Point of Presence
* Content is `delivered` to `end users` with `lower latency`

#### 1. IAM
##### 1. Resource hierarchy
* Domain
* Organization
* Folders
* Projects
* Resources

##### 2. Billing account
* A `project` can only link to `one` `billing account`

###### 1. View
`Billing` ->> `Account management` ( bottom ) ->> `My billing account` ( right )

###### 2. Create

`Billing` ->> `Account management` ( bottom ) ->> `Manage billing account` ( right ) ->> `Create account` ->> `Fill out and submit` ->> `Wait 48 hours`

###### 3. Change project's billing account

`Billing` ->> `Account management` ( bottom ) ->> `Manage billing account` ( right ) ->> `My projects` ->> `three dots` on `which project` you want to change ->> `Choose an account` ->> `Set account`

###### 4. Close billing account

`Billing` ->> `Account management` ( bottom ) ->> `Close billing account`

##### 3. Admin user account
###### 1. architecture
* Google level
  * Linked to
  * Pays for
  * Cloud resources
* Cloud level
  * Billing Account Administrator
  * Billing account user

###### 2. Add role to user account
`Billing` ->> `Account management` ( bottom ) ->> `Permissions` ( right ) ->> `Add members` ->> `Fill email and role` ->> `Save`

##### 4. SDK and CLI
###### 1. SDK
Set of `command line` tools what allow you to `manage resources` through the `terminal`.
* gcloud
* gsutil
* bq
* kubectl

Do everything and more
* Interactive and Automated script
* IaC
* Autocompletion
* Powershell

User account:
* single machine

Service account:
* google account
* multiple machine

Some common commands:
* gcloud init
* gcloud auth login
* gcloud config
* gcloud components

Some common commands:
* gcloud + compute + instances + create + example1 --zone=asia-northeast1
* gcloud + component + entity + operation + positional arguments + flags

Installation ( version `455.0.0` ):
```bash
#!/bin/bash

export VER="455.0.0"
cd
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${VER}-linux-x86_64.tar.gz
tar -xf google-cloud-cli-${VER}-linux-x86_64.tar.gz
~/google-cloud-sdk/install.sh
~/google-cloud-sdk/bin/gcloud init
export PATH="$PATH:$HOME/google-cloud-sdk/bin"
rm -f google-cloud-cli-${VER}-linux-x86_64.tar.gz
cd -
```

Init account and configuration:
```bash
gcloud init
```
Authenticate current account:
```bash
gcloud auth login
```
List authenticated accounts:
```bash
gcloud auth list
```

Set authenticated account:
```bash
gcloud config set account $EMAIL
```

Get configuration of current authenticated account:
```bash
gcloud config list
```

Set configuration to default:
```bash
gcloud config configurations activate default
```

Describe configuration ( example for default ):
```bash
gcloud config configurations describe default
```

Set compute zone [ Tokyo A ]:
```bash
gcloud config compute/zone $ZONE
gcloud config compute/zone asia-northeast1-a
```

Install components [ beta ]:
```bash
gcloud components install beta
```

Use components [ beta ]:
```bash
gcloud beta interactive
```

###### 2. Cloud shell
* You are `automatically authenticate` with account you `logged in` to.

* Built in tools:
  * Cloud SDK
  * Bash
  * Vim
  * Helm
  * Git
  * Docker
  * ...

* Languages supported:
  * Java
  * Python
  * Go
  * Nodejs
  * Ruby
  * DotNet Core

* Builtin editor:
```
edit $FILENAME
```

##### 4. Permissions
###### 1. Permissions
Least previliges principle:
* A `user`, `group`, `program` or `process` should have `only` bare `minimum permission` to `perform its function`.

Eg: A girl should just have `permission` to `create storage`:
* Allow `storage.object.create`
* Deny `storage.object.get`
* Deny `storage.object.delete`
* Deny `storage.object.list`

###### 2. Who, what, which
Who, ( member ):
* Eg: Google account, Service account, Google group,...

What permission ( policy ):
* Eg: `Allow` or `deny`
* `Not directly` grant to user
* Grant role that container `one` or `more permissions`

* Role launch stages:
  * Alpha: in testing
  * Beta: tested and await for approve
  * Gamma: Available to use

###### 3. Role
Role:
* Eg: `Role for compute engine trainee`
  * `compute.instance.list`
  * `compute.instance.get`
  * `compute.instance.stop`
  * `compute.instance.start`
  * `compute.instance.setMachineType`
  * `compute.instance.delete`

* Role type:
  * Primitive
    * `Historically` available google cloud role
    * `Owner`, `Editor`, `Viewer`
    * `Avoid` to use if possible
  * Predefined
    * Finer grained access control ( `Google` managed role )
  * Custom
    * Finer grained access control ( `user` managed role )

###### 4. Conditions
* Used to define anf `enforce conditional`, `attribute-based` access control
* Granting resource access to `identities` only if `configured conditions are met`
* When a `condition exists`, the access is only granted if the `conditional = true`
Eg: `Timestamp`, `originating`/`destination` IP address

Which resources ( policy ):
* Eg: `Google account`, `Service account`, `Google group`,...

Timestamp based:
```yaml
bindings:
- members:
  - user: wwwdatha543@gmail.com
  role: role/storage.admin
  - user: sciencekingdom1@gmail.com
  role: role/storage.objectviewer
  conditions:
    title: expirable access
    description: Do not grant access after Feb 2025
    expression: request.time < timestamp('2025-02-01T00:00:00.000Z')
etag: aj7s8wih+3
version: 3
```

Time based:
```yaml
bindings:
- members:
  - user: wwwdatha543@gmail.com
  role: role/storage.admin
  - user: sciencekingdom1@gmail.com
  role: role/storage.objectviewer
  conditions:
    title: Business hour access
    description: Business hour access Monday - Friday
    expression: request.time.getHours("America/Toronto") > 9 &&
                request.time.getHours("America/Toronto") < 17 &&
                request.time.getDayOfWeek("America/Toronto") > 1 &&
                request.time.getDayOfWeek("America/Toronto") < 5
etag: aj7s8wih+3
version: 3
```

Resource based:
```yaml
bindings:
- members:
  - user: wwwdatha543@gmail.com
  role: role/owner
  - user: sciencekingdom1@gmail.com
  role: role/compute.instanceAdmin
  conditions:
    title: Dev only access
    description: Dev only access to development* VM
    expression: (resource.type == 'compute.googleapis.com/Disk' &&
                 resource.name.startWith(project/my-project/region/us-central-1/disks/development')) ||
                (resource.type == 'compute.googleapis.com/Instance' &&
                 resource.name.startWith(project/my-project/region/us-central-1a/instances/development')) ||
                (resource.type != 'compute.googleapis.com/Disk' &&
                (resource.type != 'compute.googleapis.com/Instance')
etag: aj7s8wih+3
version: 3
```
Note:
* Member cannot be `allUsers` or `allAuthenticatedUser`
* Limit of `100 conditional role` bindings per `policy`
* `20 roles` bindings for `same role` or `same member`

###### 4. AuditConfig logs
```yaml
auditConfigs:
- auditConfigs:
  - logType: DATA_READ
  - logType: ADMIN_READ
  - logType: DATA_WRITE
  service: allServices
- auditConfigs:
  - exemptedMembers:
    - wwwdat543@gmail.com
    logType: DATA_READ
  service: storage.googleapis.com
```

###### 5. AuditConfig logs
Get IAM policy base on project name:
```bash
gcloud project get-iam-policy PROJECT_NAME
```

Set IAM policy base on project name:
```bash
gcloud project get-iam-policy PROJECT_NAME iam.yaml
```

###### 6. Add other Gmail
Add gmail:
* IAM > IAM > Grant Access > Fill gmail and role( Eg: `Project viewer` ) > Save

Test added gmail:
* Switch account > Dashboard > take an action ( `Delete/Create` )

###### 7. Add role to other Gmail
Add role to other gmail account:
```bash
gcloud project add-iam-policy-binding $PROJECT_NAME --member user:$OTHER_GMAIL --role roles/storage.admin
```

Test:
* Switch account > Dashboard > take an action ( `Delete/Create` )

###### 8. Service account
type:
* User managed:
  * User created ( You choose a name )
  * Eg: `service-account-name@project-id.iam.serviceaccount.com`
* Default:
  * Using some services create `user managed account`
  * Automatically granted the `Editor role` for the project
  * Eg: `project-id@appspot.gserviceaccount.com`
  * Eg: `project-number-compute@developer.gserviceaccount.com`
* Google managed:
  * Managed by Google
  * Use by Google by Google services
  * Some `visible`, some `hidden`
  * Name ends with `Service Account` / `Service Agent`

Testing a service account:
* Compute Emgine > Create > New VM instance
* Navigate to `Identity and API Access` > `Compute engine default service account`
* Set access for each API
* Storage > Read only
* SSH to VM instance
* View service account condig
```bash
gcloud config list
```
* View storage object ( need to have a storage with objects first )
```bash
gsutil ls gs://STORAGE_NAME
```
* Copy object to storage ( Will be forbid )
```bash
gsutil cp FILE  gs://STORAGE_NAME
```

Create service account:
* IAM > Service account > Fill details ( Name, Id, Description ) > Create
* Select role Eg: Storage Object viewer, Storage Object viewer,... > Continue
* Grant access from `User role` or `Admin role` (Optional)
* Done

Test user created service account:
* Compute Emgine > Create > New VM instance
* Navigate to `Identity and API Access` > `Compute engine default service account`
* Set access for each API
* Storage > Read only
* SSH to VM instance
* View service account condig
```bash
gcloud config list
```
* View storage object ( need to have a storage with objects first )
```bash
gsutil ls gs://STORAGE_NAME
```
* Copy object to storage
```bash
gsutil cp FILE  gs://STORAGE_NAME
```

Create user managed service account with command line:
* List service account
```bash
gcloud iam service-accounts list
```

* Create service account
```bash
gcloud iam service-accounts create MAME --display-name 'NAME'
```

* Attach role to service account
```bash
gcloud project add-iam-policy-binding PROJECT --member 'SERVICEACCOUNT' --role 'roles/storage.objectviewer'
```

#### 2. Compute 
#### 1. Compute engine
#### 2. Kubernetes engine
#### 3. App engine
#### 4. Cloud function
#### 5. Cloud run

#### 3. Compute  storage
#### 4. HA & Scale
#### 5. Dns
##### 1. Google cloud dns

#### 6. Storage
##### 1. Cloud storage
##### 2. Filestore
##### 3. Persistent disk

#### 7. Cache
#### 8. Serverless
#### 9. Databases

##### 1. SQL
###### 1. Cloud SQL
###### 2. Cloud Spanner

##### 2. NoSQL
###### 1. Bigtable
###### 2. Datastore
###### 3. Firestore
###### 4. Memorystore

#### 10. Data & Analytics
#### 11. Networking
##### 1. VPC
##### 2. Firewall rules
##### 3. Routes
##### 4. Loadbalancing
##### 5. Cloud VPN
##### 6. Direct Interconnect

#### 12. Machine learning
#### 13. Monitoring
#### 14. Security & Encryption
#### 15. Deployment
#### 16. Cost control
##### 1. Commited Use Discounts ( CUD's )
* Discounted prices when you commit using minimium level of resources for a specific term
* 1 or 3 years Commitment
* Types
  * Spend based
  * Resource based

###### 1. Spend based
* Discount for a commitment to spend a `minimum amount` for a service ( `hours` ) in a `particular region`
* `25%` discount for `a year` `52%` discount on `3 year`.
* Available for:
  * CloudSQL
  * Vmware Engine
* Only apply to `CPU` and `memory usage`

###### 2. Resource based
* Discount for a commitment to spend a `minimum amount amount for Compute Engine resources` in particular `region`.
* `vCPU`, `Memory`, `GPU` and `Local SSD`
  * `57%` discount for `most resources`
  * `70%` discount for `memory optimized` machine type.
* For use `accross Projects`

###### 3. Sustained use discount
* `Automatic discounts` for running `Compute Engine` for a significant portion of month billing
* Apply to CPU and Memory of most Compute Engine instance type.
* Include GKE instances
* Does not apply to `App Engine` flexible, `Dataflow` and `E2 machine`

###### 4. Google cloud pricing calculator
Help you `estimate cost` for usage.

###### 5. Budget alert
* Help you `track` your Google Cloud `actual spend`.
* `Budget alert` set `threshold` Trigger `email notification` to `inform` you.
* Help you define `scope of budget`
  * Spend of billing account or more granular.
* Alert email are send to `billing account` and `specific users` when cost `exceed percentage` of the budget.

* Can integrate with `PubSub` for `programatic notification` or `automate cost management tasks`

###### 6. Billing export
Billing export enables granular billing data ( `usage`, `cost details`,... ) automatically export to `BigQuery` for `analysis`.
 
##### 2. Limits and Quotas
##### 1. Overview
* `Hard limit` on how much `particular Google Cloud resources` your `project` you can use:
  * Rate quotas
  * Allocation quotas

##### 2. Enforcement of Quotas
###### 1. Protection
Prevent unforeseen usage.

###### 2. Resource management
You can `set limit` on your `own service usage` winthin your quota `when developing` and `test application`.

###### 3. Request quotas and set monitoring
You can `request more quota` for `your need` and `set up monitoring` to `alert` you about `unusual quota usage`.

###### 1. View quotas
Overview:
* `IAM` ->> `quotas`

Granular:
* `APIs and Services` ->> `Any service` ->> `Quotas`

###### 2. Edit quotas
`Select quotas` ->> `Edit quotas` ->> `Fill`:
* New limit 
* Request description ->> `Submit request`

#### 17. Backup
#### 18. Migration
#### 19. Container

