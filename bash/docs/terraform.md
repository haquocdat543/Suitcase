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

## 4. Workspace
### 2. Create and selection of workspace
Useful for multi environment:

Create:
```
terraform workspace create WORKSPACE_NAME1
terraform workspace create WORKSPACE_NAME2
terraform workspace create WORKSPACE_NAME3
terraform workspace select WORKSPACE_NAME2
```

Statefile: 1 state file for each `workspace`
```
WORKSPACE_NAME1.tfstate
WORKSPACE_NAME2.tfstate
WORKSPACE_NAME3.tfstate
```
## 5. Provisioner ( compute instance only )
### 1. Connection
```
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("~/.ssh/id_rsa")
  host        = "1.2.3.4"
}
```

### 2. File provisioner
```
provisioner "file" {
  source      = "app.py" # source file in current terraform directory
  destination = "/home/ubuntu/app.py" # destination on server you want to copy file to
}
```

### 3. Local exec provisioner
```
provisioner "local-exec" {
  command = "echo The server's IP address is ${self.private_ip}"
}
```

### 4. Remote exec provisioner
```
provisioner "remote-exec" {
  inline = [
    "echo 'Hello world from remote instance'",
    "sudo apt update -y",
    "sudo apt-get install -y python3-pip",
    "cd /home/ubuntu",
    "sudo pip3 install flask",
    "sudo python3 app.py &",
  ]
}
```

## 2. Experience
### 1. Repo setup
* backend remote repo ( include `state file` also )
* IAM repo
* projects...

## 3. Function
* current_date()
