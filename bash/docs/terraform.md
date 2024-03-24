# TERRAFORM DEEP DIVE

## 1. Files and folder
* .terraform folder: containe provider version package
* .terraform.lock.hcl: contain `information` about `provider version`
* terraform.tfstate: This is a file contain `information` about your `infrastructure`
  * version: version of state file
  * terraform_version: version of current terraform
  * serial: 
  * lineage: global `unique Id` for identification
  * output: output of resources like `Public IP`
  * resources: Resource configuration like `Compute Instance`
  * check_result
* terraform.tfstate.backup: This is a `backup` file of `terraform.tfstate`. It will be `after` your `made changes` on `terraform.tfstate` like `terraform apply` or `terraform destroy`

## 2. Module register
* A Github account
* RepoName: `terraform-<PROVIDER>-<NAME>`
* You need to access `https://registry.terraform.io`:
* *Menu* > *Module* > *Select Repo* > *Publish*

Use module:
```
module "name" {
  source  = "GITHUB_USER/NAME/PROVIDER"
  ...
}
```

## 3. Difference state processing
### 1. To real ( In case you want your IaC sync with `real infra` )
#### 1. Refresh
```
terraform refresh
```
Then edit code:

Check:
```
terraform plan
```

#### 2. Refresh only
```
terraform apply refresh-only
```

### 2. Import ( In case yoy want to import resources outside of your infra )
Edit code [ add outside resources to IaC code ]
```
terraform import RESOURCE_IDENTIFICATION.RESOURCE_NAME RESOURCE_ID
```
