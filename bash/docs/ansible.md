# Ansible
## 1. Host config
### 1. Init file
```toml
[myhosts]
192.0.2.50
192.0.2.51
192.0.2.52
```
### 2. Yaml file
```yaml
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
```bash
ansible-playbook example.yml -i first_inventory -i second_inventory ...
```
## 3. Ad hoc commands
### 1. Command display
```bash
ansible atlanta -m ansible.builtin.copy -a "src=/etc/hosts dest=/tmp/hosts"
ansible webservers -m ansible.builtin.file -a "dest=/srv/foo/a.txt mode=600"
ansible webservers -m ansible.builtin.yum -a "name=acme state=latest"
```
### 2. playbook display
```yaml
- name: Copy
  ansible.builtin.copy:
    src: /etc/hosts
    dest: /tmp/hosts
- name: File operation
  ansible.builtin.file:
    dest: /srv/foo/a.txt
    mode: 600
- name: Yum install
  ansible.builtin.yum:
    name: acme
    state: latest
```
### 4. file structure
* defaults
* file
* handlers
* meta
* tasks
* template
* tests
* vars
### 5. Option and flags
-vvv: verbose
