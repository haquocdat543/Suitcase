#!/bin/bash

export CHEF="21.10.640"
export CENTOS_VERSION="9"
wget https://packages.chef.io/files/stable/chef-workstation/${CHEF}/el/${CENTOS_VERSION}/chef-workstation-${CHEF}-1.el${CENTOS_VERSION}.x86_64.rpm
yum localinstall chef-workstation-${CHEF}-1.el${CENTOS_VERSION}.x86_64.rpm
rm chef-workstation-${CHEF}-1.el${CENTOS_VERSION}.x86_64.rpm
