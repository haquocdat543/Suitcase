#!/bin/bash

echo "enter pem file location"
read pem
echo "enter source file location"
read sourcefile
echo "enter username of destination server"
read username
echo "enter ip of destination server"
read ip
echo "enter destination location (include the file)"
read dest
echo " pem file location: $pem | source file location: $serviceName | username: $username | serverIp: $ip | destination file location: $dest "
scp -i $pem $sourcefile $username@$ip:$dest
