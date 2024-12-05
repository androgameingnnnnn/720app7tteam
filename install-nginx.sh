#!/bin/bash

# Install Nginx
sudo apt update
sudo apt install -y nginx

# Start and enable Nginx to run on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Allow Nginx through firewall
sudo ufw allow 'Nginx HTTP'
sudo ufw enable

echo "Nginx installed and started successfully!"
