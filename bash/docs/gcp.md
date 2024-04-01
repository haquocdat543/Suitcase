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

###### 2. Resource based
* Discount for a commitment to spend a `minimum amount amount for Compute Engine resources` in particular `region`.
* `vCPU`, `Memory`, `GPU` and `Local SSD`
  * `57%` discount for `most resources`
  * `70%` discount for `memory optimized` machine type.
* For use `accross Projects`
 
#### 17. Backup
#### 18. Migration
#### 19. Container

