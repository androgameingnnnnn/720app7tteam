#!/bin/bash

# Install PHP and required extensions
sudo apt update
sudo apt install -y php-fpm php-mysql php-cli php-xml php-mbstring php-curl

# Restart PHP service
sudo systemctl restart php7.4-fpm
sudo systemctl enable php7.4-fpm

echo "PHP installed successfully!"
