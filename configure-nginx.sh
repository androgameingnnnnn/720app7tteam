#!/bin/bash

# Configure Nginx to work with PHP
sudo bash -c 'cat > /etc/nginx/sites-available/default << EOF
server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF'

# Test Nginx configuration and reload if valid
sudo nginx -t && sudo systemctl reload nginx

echo "Nginx configured to use PHP successfully!"
