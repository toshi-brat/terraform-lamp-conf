#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo apt install php-fpm php-mysql -y
systemctl start nginx.service
systemctl start php8.1-fpm.service
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo systemctl restart nginx.service
apt intall zip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
