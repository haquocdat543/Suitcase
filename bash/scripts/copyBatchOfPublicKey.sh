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
read -p "$(echo -e "Enter your ${yellow}public ${green}key${nc} in${purple2} ~/.ssh${nc} [${green2}id_rsa.pub${nc}]: ")" public
 public=${public:-id_rsa.pub}
read -p "$(echo -e "Enter your ${yellow}authentication ${green}key${nc} in${purple2} ~/.ssh${nc} [${green2}master_rsa${nc}]: ")" authentication
 authentication=${authentication:-id_rsa.pub}
 read -p "$(echo -e "Enter your login ${yellow}username${nc} [${green2}ec2-user${nc}]: ")" username
 username=${username:-ec2-user}
 read -p "$(echo -e "Enter your inventory${yellow} location${nc} [${green2}./inventory${nc}]: ")" inventory
 inventory=${inventory:-./inventory}
 
while read p; do
  cat ~/.ssh/$public | ssh -i ~/.ssh/$authentication $username@$p 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'
done <$inventory

