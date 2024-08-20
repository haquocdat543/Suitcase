#!/bin/bash

####################################################################################################
# IMPORT FILES
####################################################################################################
# source ./file.sh

# declaration function
declaration () {

  # Color declaration
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

  # Get input from user
  read -p "$(echo -e "Enter ${yellow}JUMPHOST${nc} [${green2}notional_bastion${nc}]: ")" SERVER_JUMPHOST
  SERVER_JUMPHOST=${SERVER_JUMPHOST:-notional_bastion}

  read -p "$(echo -e "Enter ${yellow}USERNAME${nc} [${green2}root${nc}]: ")" SERVER_USERNAME
  SERVER_USERNAME=${SERVER_USERNAME:-root}

  read -p "$(echo -e "Enter ${yellow}HOSTNAME${nc} [${green2}1.1.1.1${nc}]: ")" SERVER_HOSTNAME
  SERVER_HOSTNAME=${SERVER_HOSTNAME:-1.1.1.1}

  read -p "$(echo -e "Enter ${yellow}HOSTPORT${nc} [${green2}2222${nc}]: ")" SERVER_HOSTPORT
  SERVER_HOSTPORT=${SERVER_HOSTPORT:-2222}

  read -p "$(echo -e "Enter ${yellow}KEYPATH${nc} [${green2}~/.ssh/id_rsa${nc}]: ")" KEYPATH
  KEYPATH=${KEYPATH:-~/.ssh/id_rsa}

  # Write environment to file
cat << EOF | sudo tee env.sh
export SERVER_JUMPHOST="${SERVER_JUMPHOST}"
export SERVER_USERNAME="${SERVER_USERNAME}"
export SERVER_HOSTNAME="${SERVER_HOSTNAME}"
export SERVER_HOSTPORT="${SERVER_HOSTPORT}"
export KEYPATH="${KEYPATH}"
EOF

}

# Load or declare environment variables
if [[ -f env.sh ]]; then
  source env.sh
else
  declaration
fi

####################################################################################################
# GET VARIABLES
####################################################################################################

# get variables
OP=$1
PATH_1=$2
PATH_2=$3

####################################################################################################
# SET FUNCTION
####################################################################################################

# function 1
list_path () {

  # get parameters
  local LOCATION_PATH=$1

  # logic
  if [[ -z ${SERVER_HOSTPORT} ]]; then
    ssh -J ${SERVER_JUMPHOST} ${SERVER_USERNAME}@${SERVER_HOSTNAME} "ls -la ${LOCATION_PATH}"
  else
    ssh -J ${SERVER_JUMPHOST} ${SERVER_USERNAME}@${SERVER_HOSTNAME} -p ${SERVER_HOSTPORT} "ls -la ${LOCATION_PATH}"
  fi

}

# function 1
remove_remote () {

  # get parameters
  local LOCATION_PATH=$1

  # logic
  if [[ -z ${SERVER_HOSTPORT} ]]; then
    ssh -J ${SERVER_JUMPHOST} ${SERVER_USERNAME}@${SERVER_HOSTNAME} "rm -rf ${LOCATION_PATH}"
  else
    ssh -J ${SERVER_JUMPHOST} ${SERVER_USERNAME}@${SERVER_HOSTNAME} -p ${SERVER_HOSTPORT} "rm -rf ${LOCATION_PATH}"
  fi

  echo "Successfully"

}

# function 1
copy_to_remote () {

  # get parameters
  local PATH_1=$1
  local PATH_2=$2

  # logic
  # scp -i ${KEYPATH} -pr "${PATH_1}" "${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_2}" 
  # logic
  if [[ -z ${SERVER_HOSTPORT} ]]; then
    rsync -av --progress -e "ssh -J ${SERVER_JUMPHOST}" "${PATH_1}" ${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_2}
  else
    rsync -av --progress -e "ssh -J ${SERVER_JUMPHOST}" "${PATH_1}" ${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_2} -p ${SERVER_HOSTPORT}
  fi

  echo "Successfully"

}

# function 1
copy_to_local () {

  # get parameters
  local PATH_1=$1
  local PATH_2=$2

  # logic
  # scp -i ${KEYPATH} "${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_1}" "${PATH_2}"
  if [[ -z ${SERVER_HOSTPORT} ]]; then
    rsync -av --progress -e "ssh -J ${SERVER_JUMPHOST}" ${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_1} ${PATH_2}
  else
    rsync -av --progress -e "ssh -J ${SERVER_JUMPHOST}" ${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_1} ${PATH_2} -p ${SERVER_HOSTPORT}
  fi

  echo "Successfully"

}

####################################################################################################
# USE FUNCTION
####################################################################################################
case $OP in
  "ls")
    echo "List files and folders"
    list_path ${PATH_1}
    ;;
  "rr")
    echo "Remove remote"
    remove_remote ${PATH_1}
    ;;
  "cpr")
    echo "Copy to remote"
    copy_to_remote ${PATH_1} ${PATH_2}
    ;;
  "cpl")
    echo "Copy to local"
    copy_to_local ${PATH_1} ${PATH_2}
    ;;
  *)
    echo "Only support following operations:"
    echo "list: list files and folders [ sh $0 list <PATH> ]"
    ;;
esac
