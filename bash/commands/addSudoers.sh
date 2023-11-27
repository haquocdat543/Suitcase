#!/bin/bash

read -p "Enter username to add to sudoers [ec2-user]: " username
username=${username:-ec2-user}
sudo sed "/root\t/a$username\tALL=(ALL)\tALL" /etc/sudoers | sudo tee /etc/sudoers


