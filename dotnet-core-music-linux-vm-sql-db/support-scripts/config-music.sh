#!/bin/bash

# install dotnet core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2-003121

# download application
sudo wget https://raw.github.com/neilpeterson/nepeters-azure-templates/master/dotnet-core-music-linux-vm-sql-db/music-app/music-store-azure-demo-pub.tar /
sudo mkdir /music
sudo tar -xf music-store-azure-demo-pub.tar -C /music

# install nginx, update config files
sudo apt-get install -y nginx
sudo service nginx start
sudo rm -f /etc/nginx/sites-available/default
sudo cp /music/nginx-config/default /etc/nginx/sites-available/
sudo nginx -s reload

# update music config file
sed -i "s/<replaceserver>/$1/g" /music/config.json
sed -i "s/<replaceuser>/$2/g" /music/config.json
sed -i "s/<replacepass>/$3/g" /music/config.json

# config supervisor
sudo apt-get install -y supervisor
sudo cp /music/supervisor/music.conf /etc/supervisor/conf.d/
sudo service supervisor stop
sudo service supervisor start

# workaround for db creation bug
#/usr/bin/dotnet /music/MusicStore.dll
