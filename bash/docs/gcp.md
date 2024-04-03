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
```
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
```
gcloud init
```
Authenticate current account:
```
gcloud auth login
```
List authenticated accounts:
```
gcloud auth list
```

Set authenticated account:
```
gcloud config set account $EMAIL
```

Get configuration of current authenticated account:
```
gcloud config list
```

Set configuration to default:
```
gcloud config configurations activate default
```

Describe configuration ( example for default ):
```
gcloud config configurations describe default
```

Set compute zone [ Tokyo A ]:
```
gcloud config compute/zone $ZONE
gcloud config compute/zone asia-northeast1-a
```

Install components [ beta ]:
```
gcloud components install beta
```

Use components [ beta ]:
```
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
 
#### 17. Backup
#### 18. Migration
#### 19. Container

