#!/bin/bash

export CENTOS_VERSION="9"
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-${CENTOS_VERSION}.noarch.rpm
sudo yum install -y puppetserver
sudo systemctl start puppetserver
