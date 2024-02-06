#!/bin/bash

read -p "Enter identifier [myRds]: " identifier
identifier=${identifier:-myRds}
read -p "Enter class [db.t3.micro]: " class
class=${class:-db.t3.micro}
read -p "Enter engine [mysql]: " engine
engine=${engine:-mysql}
read -p "Enter master username [admin]: " masterUsername
masterUsername=${masterUsername:-admin}
read -p "Enter master password [adminsecret]: " password
password=${password:-adminsecret}
read -p "Enter allocate storage [20]: " storage
storage=${storage:-20}
aws rds create-db-instance --db-instance-identifier $identifier --db-instance-class $class --engine $engine --master-username $masterUsername --master-user-password $password --allocated-storage $storage

