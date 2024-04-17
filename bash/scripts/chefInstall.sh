#!/bin/bash

export CHEF="21.10.640"
wget https://packages.chef.io/files/stable/chef-workstation/${CHEF}/el/8/chef-workstation-${CHEF}-1.el8.x86_64.rpm
yum localinstall chef-workstation-${CHEF}-1.el8.x86_64.rpm
rm chef-workstation-${CHEF}-1.el8.x86_64.rpm
