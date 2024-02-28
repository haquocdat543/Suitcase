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
read -p "$(echo -e "Enter ${yellow}resource ${green}name${nc} [${green2}serviceaccount${nc}]: ")" rs
rs=${rs:-serviceaccount}

for namespace in $(kubectl get namespaces -o name | cut -d '/' -f 2); do
  echo $namespace\n
  for i in $(seq 1 $(tput cols)); do
    echo -n '*'
  done
  kubectl get $rs -n $namespace
done
