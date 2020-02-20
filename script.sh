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