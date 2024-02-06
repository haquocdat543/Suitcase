#!/bin/bash

read -p "Enter iam username [hqd]: " username
username=${username:-hqd}
read -p "Enter ssh key file location [id_rsa.pub]: " location
location=${location:-id_rsa.pub}
aws iam upload-ssh-public-key --user-name $username --ssh-public-key-body file://$location
