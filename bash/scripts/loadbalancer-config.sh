#!/bin/bash

# Install nginx loadbalancer
sudo apt install nginx
sudo systemctl enable nginx
sudo systemctl restart nginx

# Append loadbalancer configuration to /etc/nginx/nginx.conf
# You need to place master_ip variable to your master node ip
cat <<EOF | sudo tee -a /etc/nginx/nginx.conf
stream {
    upstream kubernetes {
        server master1_ip:6443 max_fails=3 fail_timeout=30s;
        server master2_ip:6443 max_fails=3 fail_timeout=30s;
    }
server {
        listen 6443;
        proxy_pass kubernetes;
    }
}
EOF

sudo nginx -s reload
sudo systemctl enable nginx
sudo systemctl restart nginx

