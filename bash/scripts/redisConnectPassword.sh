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
read -p "$(echo -e "Enter your ${yellow}hostname ${green}name [${green2}Your Host${nc}]: ")" host
host=${host:-Your Host}
read -p "$(echo -e "Enter your ${yellow}port${nc} [${green2}6379${nc}]: ")" port
port=${port:-6379}
read -p "$(echo -e "Enter your ${yellow}password${nc} [${green2}haquocdat${nc}]: ")" password
password=${password:-haquocdat}
redis-cli -h $host -p $port -a $password

