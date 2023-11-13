#!/bin/bash
echo "Enter your key_pair name:"
read key
echo "Enter you server_ip or server_dns:"
read ipdns
echo "Enter your username:"
read username

ssh -i ~/.ssh/$key.pem $username@$ipdns
