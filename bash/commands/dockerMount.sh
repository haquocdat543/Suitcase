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
read -p "$(echo -e "Enter container ${yellow}name${nc} [${green2}C1${nc}]: ")"source
source=${source:-C1}
read -p "$(echo -e "Enter mount ${yellow}source${nc} [${green2}D1${nc}]: ")"source
source=${source:-D1}
read -p "$(echo -e "Enter mount ${yellow}target${nc} [${green2}/home/disk${nc}]: ")"target
target=${target:-/home/disk}
read -p "$(echo -e "Enter image ${yellow}name${nc} [${green2}busybox:latest${nc}]: ")"image
image=${image:-/home/disk}
docker run -it --name $C1 --mount source=$source,target=$target $image
