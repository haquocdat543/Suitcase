#!/bin/bash

cd
sed -i "1s/^/postgres\tALL=(ALL)\tNOPASSWD:\tALL\n/" /etc/sudoers

# Install Java
sudo dnf install java-17-amazon-corretto -y

# Install Mysql
sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install postgresql15.x86_64 postgresql15-server -y
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
cd -
