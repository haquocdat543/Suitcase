#!/bin/bash

read -p "Enter username to add to sudoers [ec2-user]: " username
username=${username:-ec2-user}
sed '/root	ALL=(ALL) 	ALL/a\$username	ALL=(ALL) 	ALL' /etc/sudoers
