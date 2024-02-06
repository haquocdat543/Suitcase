#!/bin/bash

read -p "Enter username [ec2-user]:" username
username=${username:-ec2-user}
cp -f ~/* /home/$username/

