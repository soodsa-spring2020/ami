#!/bin/bash

sudo apt-get update
sudo wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt-get install apt-transport-https
sudo apt update
sudo apt-get install dotnet-sdk-3.0 -y
sudo apt update
sudo apt-get install apache2 -y
sudo a2enmod proxy proxy_http proxy_html
sudo systemctl restart apache2
sudo chmod 777 /etc/apache2/sites-available/000-default.conf
sudo truncate -s0 /etc/apache2/sites-available/000-default.conf
sudo echo "<VirtualHost *:*>" > /etc/apache2/sites-available/000-default.conf
sudo echo "RequestHeader set 'X-Forwarded-Proto' expr=%{REQUEST_SCHEME}" > /etc/apache2/sites-available/000-default.conf
sudo echo "</VirtualHost>" > /etc/apache2/sites-available/000-default.conf
sudo echo "<VirtualHost *:80>" > /etc/apache2/sites-available/000-default.conf
sudo echo "ProxyPreserveHost On" >> /etc/apache2/sites-available/000-default.conf
sudo echo "ProxyPass / http://127.0.0.1:5002/" >> /etc/apache2/sites-available/000-default.conf
sudo echo "ProxyPassReverse / http://127.0.0.1:5002/" >> /etc/apache2/sites-available/000-default.conf
sudo echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf
sudo chmod 644 /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2 
sudo apt install unzip
sudo apt update
sudo apt-get install ruby -y
sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
sudo apt update
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo chmod +x ./amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb