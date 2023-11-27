#!/bin/bash

read -p "Enter username to add to sudoers [ec2-user]: " username
username=${username:-ec2-user}
sudo sed "/root	ALL=(ALL) 	ALL/a $username	ALL=(ALL) 	ALL" /etc/sudoers | sudo tee /etc/sudoers
