#!/bin/bash

black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
gray='\033[0;37m'
gray2='\033[1;30m'
red2='\033[1;31m'
green2='\033[1;32m'
yellow='\033[1;33m'
blue2='\033[1;34m'
purple2='\033[1;35m'
cyan2='\033[1;36m'
white='\033[1;37m'
nc='\033[0m' # No Color
read -p "$(echo -e "Enter your ${yellow}inventory ${green}location${nc} [${green2}/etc/ansible/hosts${nc}]: ")" location1
location1=${location1:-/etc/ansible/hosts}
read -p "$(echo -e "Enter your ${yellow}playbook ${green}location ${nc} [${green2}./playbook.yaml${nc}]: ")" location2
location2=${location2:-./playbook.yaml}
ansible playbook -i $location1 $location2
