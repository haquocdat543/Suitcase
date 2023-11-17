#!/bin/bash

read -p "Enter db-instance-identifier [myRds]:" db-instance-identider
db-instance-identider=${db-instance-identider:-myRds}
read -p "Enter db-instance-class [db.t3.micro]:" db-instance-class
db-instance-class=${db-instance-class:-db.t3.micro}
read -p "Enter engine [mysql]:" engine
engine=${engine:-mysql}
read -p "Enter master-username [admin]:" master-username
master-username=${master-username:-admin}
read -p "Enter master password [secret]:" password
password=${password:-secret}
read -p "Enter allocate-storage [20]:" storage
storage=${storage:-20}
aws rds create-db-instance --db-instanc+identifier $db-instance-identifier --db-instance-class $db-instance-class --engine $engine --master-username $master-username --master-user-password $password --allocated-storage $storage
