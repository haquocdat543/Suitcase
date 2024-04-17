#!/bin/bash

export CHEF="15.9.27"
export CENTOS_VERSION="9"
wget https://packages.chef.io/files/stable/chef-server/${CHEF}/el/${CENTOS_VERSION}/chef-server-core-${CHEF}-1.el${CENTOS_VERSION}.x86_64.rpm
yum localinstall chef-server-core-${CHEF}-1.el${CENTOS_VERSION}.x86_64.rpm -y
rm chef-server-core-${CHEF}-1.el${CENTOS_VERSION}.x86_64.rpm
