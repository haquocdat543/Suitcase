#!/bin/bash

read -p "Enter iam username [hqd]: " username
username=${username:-hqd}
read -p "Enter ssh-public-key-id  [yourkey]: " key
key=${key:-yourkey}
aws iam delete-ssh-public-key --user-name $username --ssh-public-key-id $key
