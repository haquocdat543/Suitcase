#!/bin/bash

####################################################################################################
# IMPORT FILES
####################################################################################################
# source ./file.sh

####################################################################################################
# GET VARIABLES
####################################################################################################

# get variables
OP=$1
HOSTCONFIG=$2
PATH_1=$3
PATH_2=$4

####################################################################################################
# SET FUNCTION
####################################################################################################

# function 1
list_path () {

  # get parameters
  local LOCATION_PATH=$1

  # logic
  ssh ${HOSTCONFIG} "ls -la ${LOCATION_PATH}"

}

# function 1
remove_remote () {

  # get parameters
  local LOCATION_PATH=$1

  # logic
  ssh ${HOSTCONFIG} "rm -rf ${LOCATION_PATH}"

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
  rsync -av --progress ${PATH_1} ${HOSTCONFIG}:${PATH_2}

  echo "Successfully"

}

# function 1
copy_to_local () {

  # get parameters
  local PATH_1=$1
  local PATH_2=$2

  # logic
  # scp -i ${KEYPATH} "${SERVER_USERNAME}@${SERVER_HOSTNAME}:${PATH_1}" "${PATH_2}"
  rsync -av --progress ${HOSTCONFIG}:${PATH_1} ${PATH_2}

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
    echo "ls: list files and folders [ synj <HOSTCONFIG> ls <serverpath> ]"
    echo "rr: remote remote files and folders [ synj <HOSTCONFIG> rr <serverpath> ]"
    echo "cpr: copy files and folders from local to remote [ synj cpr <HOSTCONFIG> <localpath> <serverpath> ]"
    echo "cpl: copy files and folders from remote to local [ synj cpl <HOSTCONFIG> <serverpath> <localpath> ]"
    ;;
esac
