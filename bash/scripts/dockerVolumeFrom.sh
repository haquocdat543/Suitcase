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
read -p "$(echo -e "Enter first ${yellow}container${green} name${nc} [${green2}C1${nc}]: ")" C1
C1=${C1:-C1}
read -p "$(echo -e "Enter second ${yellow}container${green} name${nc} [${green2}C1${nc}]: ")" C2
C2=${C1:-C2}
read -p "$(echo -e "Enter image ${yellow}name:tag${nc} [${green2}busybox${nc}]: ")" image
image=${image:-busybox}
docker run -it --name $C1 --volumes-from $C2 $image
