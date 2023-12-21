# Ansible
## 1. Host config
### 1. Init file
```
[myhosts]
192.0.2.50
192.0.2.51
192.0.2.52
```
### 2. Yaml file
```
myhosts:
  hosts:
    my_host_01:
      ansible_host: 192.0.2.50
    my_host_02:
      ansible_host: 192.0.2.51
    my_host_03:
      ansible_host: 192.0.2.52
```
## 2. Take Action
### 1. Without playbook
* ansible `host` -m `module` -i `inventory_file`
### 2. With playbook
* ansible playbook -i `inventory_file` `path_to_playbook`

* -i parameter can follow by `file` or `folder`
* Can use multi `inventory file` :
```
ansible-playbook example.yml -i first_inventory -i second_inventory ...
```

