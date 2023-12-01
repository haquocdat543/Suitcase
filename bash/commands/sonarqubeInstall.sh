#!/bin/bash

# Install Docker and Sonarqube
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

