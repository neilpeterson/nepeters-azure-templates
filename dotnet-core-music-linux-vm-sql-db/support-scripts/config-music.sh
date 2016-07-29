#!/bin/bash
NGINXCONFIG = "server {listen 80; location / {proxy_pass http://localhost:5000; proxy_http_version 1.1; proxy_set_header Upgrade $http_upgrade; proxy_set_header Connection keep-alive; proxy_set_header Host $host; proxy_cache_bypass $http_upgrade;}}"


sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2-003121
sudo apt-get install -y git
sudo apt-get install -y nginx
sudo service nginx start
sudo git clone https://github.com/neilpeterson/dotnet-linux-music.git /music


sudo rm -f /etc/nginx/sites-available/default
sudo touch /etc/nginx/sites-available/default
echo $NGINXCONFIG | sudo tee /etc/nginx/sites-available/default
sudo nginx -s reload
