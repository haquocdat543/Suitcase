#!/bin/bash

cd
read -p "Enter your key file name in ~/.ssh [id_25519.pub]: " keyname
keyname=${keyname:-id_25519.pub}
read -p "Enter your server ip: " serverip
ssh-copy-id -i ~/.ssh/$keyname $serverip


