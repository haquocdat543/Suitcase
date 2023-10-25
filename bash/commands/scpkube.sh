#!/bin/bash

echo "enter pem file location"
read pem
echo "enter username of destination server"
read username
echo "enter ip of destination server"
read ip
echo " pem file location: $pem | username: $username | serverIp: $ip "
scp -i $pem config $username@$ip:~/.kube/config
