# CEPH

### 1. Architecture
* Ceph OSD Daemon (OSD) [ Object Storage Daemon ] stores data as objects on a storage node
* Ceph Monitor (MON) [ Monitor ] maintains a master copy of the cluster map.
* Ceph Manager manager daemon

### 2. Installation
#### 1. Curl
Curl speicific cephadm version:
```bash
CEPH_RELEASE=18.2.0 # replace this with the active release
curl --silent --remote-name --location https://download.ceph.com/rpm-${CEPH_RELEASE}/el9/noarch/cephadm
```

Ensure the cephadm file is executable:
```bash
chmod +x cephadm
```

Copy to PATH:
```bash
cp cephadm /usr/local/bin
```

To install the packages that provide the cephadm command, run the following commands:
```bash
sudo cephadm add-repo --release quincy
sudo cephadm install
```

#### 2. Package manager
ubuntu:
```bash
apt install -y cephadm
```

centos:
```bash
dnf search release-ceph
dnf install --assumeyes centos-release-ceph-quincy
dnf install --assumeyes cephadm
```

fedora:
```bash
dnf -y install cephadm
```

opensuse:
```bash
zypper install -y cephadm
```

#### 3. Bootstrap
bootstrap command:
```bash
cephadm bootstrap
```
```bash
cephadm bootstrap --mon-ip *<mon-ip>*
```
Eg: `cephadm bootstrap --mon-ip 10.0.0.2`

bootstrap command if face this error:
```bash
Deploying ceph-exporter service with default
placement...  Non-zero exit code 22
```
```bash
cephadm bootstrap --mon-ip {monitor IP address} --skip-monitoring-stack
```

After bootstrapping, verify the cluster status using the Ceph CLI.:
```bash
sudo cephadm shell -- ceph status
```

#### 4. Expand
Note: need to install `cephadm` on new server before add to cluster.

Expand:
```bash
sudo cephadm add-node --hostname *<server.example.com>* --role osd
```
Eg: `sudo cephadm add-node --hostname 10.0.0.3 --role osd`

Orch:
```bash
sudo cephadm shell
ceph orch host add <hostname> <ip_address>
```
Eg: `ceph orch host add server2 10.0.0.4`

Verify new node:
```bash
ceph orch host ls
ceph status
```

### 3. Ceph CLI
Enable CLI:
```bash
cephadm shell
```

Enable CLI with shell:
```bash
cephadm shell -- ceph -s
```

Install dependencies:
```bash
cephadm add-repo --release quincy
cephadm install ceph-common
```
