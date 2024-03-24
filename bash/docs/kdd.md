# KUBERNETES DEEP DIVE

## 1. Install
### 1. Kubectl
#### 1. Linux
##### 1. Binary
x86-64 latest:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
x86-64 specific version:
```
curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/amd64/kubectl
```

Arm64 latest:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
```
Arm64 specific version:
```
curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/arm64/kubectl
```

Checksum:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client --output=yaml
```

##### 2. Package manager
Yum:
```
# This overwrites any existing configuration in /etc/yum.repos.d/kubernetes.repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF
sudo yum install -y kubectl
```

Apt:
```
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl
```

Suse:
```
# This overwrites any existing configuration in /etc/zypp/repos.d/kubernetes.repo
cat <<EOF | sudo tee /etc/zypp/repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF
sudo zypper install -y kubectl
```

Snap:
```
snap install kubectl --classic
kubectl version --client
```

Homebrew:
```
brew install kubectl
kubectl version --client
```

Test `kubectl`:
```
kubectl cluster-info
kubectl cluster-info dump
```

#### 2. Window
##### 1. Binary
```
curl.exe -LO "https://dl.k8s.io/release/v1.29.2/bin/windows/amd64/kubectl.exe"
curl.exe -LO "https://dl.k8s.io/v1.29.2/bin/windows/amd64/kubectl.exe.sha256"
CertUtil -hashfile kubectl.exe SHA256
type kubectl.exe.sha256
$(Get-FileHash -Algorithm SHA256 .\kubectl.exe).Hash -eq $(Get-Content .\kubectl.exe.sha256)
kubectl version --client --output=yaml
```
##### 2. Package manager
Choco:
```
choco install kubernetes-cli
```

Scoop:
```
scoop install kubectl
```

Winget:
```
winget install -e --id Kubernetes.kubectl
```

### 2. Kubeconvert
#### 1. Linux
Amd:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert.sha256"
echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
kubectl convert --help
```

Arm:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl-convert"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl-convert.sha256"
echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
kubectl convert --help
```

#### 2. Window
```
curl.exe -LO "https://dl.k8s.io/release/v1.29.2/bin/windows/amd64/kubectl-convert.exe"
curl.exe -LO "https://dl.k8s.io/v1.29.2/bin/windows/amd64/kubectl-convert.exe.sha256"
CertUtil -hashfile kubectl-convert.exe SHA256
type kubectl-convert.exe.sha256
$($(CertUtil -hashfile .\kubectl-convert.exe SHA256)[1] -replace " ", "") -eq $(type .\kubectl-convert.exe.sha256)
```

