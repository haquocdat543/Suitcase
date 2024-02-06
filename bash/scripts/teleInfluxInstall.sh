#!/bin/bash

# Add influxdb and telegraf repo
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxData Repository - Stable
baseurl = https://repos.influxdata.com/stable/\$basearch/main
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdata-archive_compat.key
EOF

# Install telegraf
sudo yum install telegraf
sudo yum install influxdb

# If you want to config telegraf. Remove hashtag and run below line
# telegraf config > telegraf.conf

