#!/bin/bash

sudo dnf install mariadb105-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
