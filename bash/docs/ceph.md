# CEPH

### 1. Architecture
* Ceph OSD Daemon (OSD) stores data as objects on a storage node
* Ceph Monitor (MON) maintains a master copy of the cluster map.
* Ceph Manager manager daemon

### 2. Installation
#### 1. Curl
Curl speicific cephadm version:
```
CEPH_RELEASE=18.2.0 # replace this with the active release
curl --silent --remote-name --location https://download.ceph.com/rpm-${CEPH_RELEASE}/el9/noarch/cephadm
```

Ensure the cephadm file is executable:
```
chmod +x cephadm
```

To install the packages that provide the cephadm command, run the following commands:
```
./cephadm add-repo --release quincy
./cephadm install
```

#### 2. Package manager
ubuntu:
```
apt install -y cephadm
```

centos:
```
dnf search release-ceph
dnf install --assumeyes centos-release-ceph-quincy
dnf install --assumeyes cephadm
```

fedora:
```
dnf -y install cephadm
```

opensuse:
```
zypper install -y cephadm
```

### 2. Bootstrap
bootstrap command:
```
cephadm bootstrap
```
```
cephadm bootstrap --mon-ip *<mon-ip>*
```

bootstrap command if face this error:
```
Deploying ceph-exporter service with default
placement...  Non-zero exit code 22
```
```
cephadm bootstrap --mon-ip {monitor IP address} --skip-monitoring-stack
```
