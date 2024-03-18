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

