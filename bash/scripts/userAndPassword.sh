#!/bin/bash

# Get arguments from command line
username=$1
password=$2

# Check if the user exists
if id "$username" &>/dev/null; then
    echo "User $username exists."
else
    useradd $username
fi

# Set the password for the user
echo "$username:$password" | chpasswd
echo "Password changed"
