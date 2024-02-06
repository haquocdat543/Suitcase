#!/bin/bash

# Import GPG key
wget -q -O gpg.key https://rpm.grafana.com/gpg.key
sudo rpm --import gpg.key

# Add grafana repi
cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://rpm.grafana.com
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://rpm.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
exclude=*beta*
EOF

# Install grafana
sudo yum install grafana

# Enable grafana
sudo systemctl enable grafana-server

# Start grafana
sudo systemctl start grafana-server

