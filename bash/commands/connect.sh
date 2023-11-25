#!/bin/bash
echo "Enter your key_pair name: "
read key
echo "Enter you server_ip or server_dns: "
read ipdns
read -p "Enter you username [ec2-user]: " username
username=${username:-ec2-user}

ssh -i ~/.ssh/$key.pem $username@$ipdns
