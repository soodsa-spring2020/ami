#!/bin/bash

sudo apt-get update
sudo wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt-get install apt-transport-https
sudo apt update
sudo apt-get install dotnet-sdk-3.0 -y
sudo apt update
sudo dotnet tool install --global dotnet-ef --version 3.0
sudo apt update
sudo apt install unzip   
sudo apt-get install apache2 -y
sudo a2enmod proxy proxy_http proxy_html
sudo systemctl restart apache2
sudo chmod 777 /etc/apache2/sites-available/000-default.conf
sudo truncate -s0 /etc/apache2/sites-available/000-default.conf
sudo echo "<VirtualHost *:80>" > /etc/apache2/sites-available/000-default.conf
sudo echo "ProxyPreserveHost On" >> /etc/apache2/sites-available/000-default.conf
sudo echo "ProxyPass / http://127.0.0.1:5000/" >> /etc/apache2/sites-available/000-default.conf
sudo echo "ProxyPassReverse / http://127.0.0.1:5000/" >> /etc/apache2/sites-available/000-default.conf
sudo echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf
sudo chmod 644 /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2