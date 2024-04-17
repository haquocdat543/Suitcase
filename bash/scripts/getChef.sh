#!/bin/bash

export CHEF="21.10.640"
export UBUNTU_VERSION="20.04"
wget https://packages.chef.io/files/stable/chef-workstation/${CHEF}/ubuntu/${UBUNTU_VERSION}/chef-workstation_${CHEF}-1_amd64.deb
dpkg -i chef-workstation_${CHEF}-1_amd64.deb
