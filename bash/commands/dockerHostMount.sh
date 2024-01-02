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
read -p "$(echo -e "Enter volume ${yellow}name${nc} [${green2}D1${nc}]: ")" volumeName
volumeName=${volumeName:-D1}
read -p "$(echo -e "Enter host mount ${yellow}location${nc} [${green2}~/disk${nc}]: ")" hostlocation
hostlocation=${hostlocation:-~/disk}
read -p "$(echo -e "Enter mount ${yellow}type${nc} [${green2}none${nc}]: ")" mountType
mountType=${mountType:-none}
read -p "$(echo -e "Enter o ${yellow}type${nc} [${green2}bind${nc}]: ")"oType 
oType =${oType:-bind}
docker create --opt device=$volumeName  --opt type=$mountType --opt o=$oType $volumeName
