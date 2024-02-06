#!/bin/bash

read -p "Enter username to add to sudoers [ec2-user]: " username
username=${username:-ec2-user}
sed -i "1s/^/$username\tALL=(ALL)\tALL\n/" /etc/sudoers
