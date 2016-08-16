#!/bin/bash

# install dotnet core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2-003121

# install nginx
sudo apt-get install -y nginx
sudo service nginx start

# download application
#sudo wget https://raw.github.com/neilpeterson/nepeters-azure-templates/master/dotnet-core-music-linux-vm-sql-db/music-app/music-store-azure-demo.tar /
sudo wget https://raw.github.com/neilpeterson/nepeters-azure-templates/master/dotnet-core-music-linux-vm-sql-db/music-app/pub-music-store-azure-demo.tar /
sudo mkdir /music
sudo tar -xf pub-music-store-azure-demo.tar -C /music

# update nginx config files
#sudo rm -f /etc/nginx/sites-available/default
#sudo cp /music/nginx-config/default /etc/nginx/sites-available/

# update music config file
#sed -i "s/<replaceserver>/$1/g" /music/src/MusicStore/config.json
#sed -i "s/<replaceuser>/$2/g" /music/src/MusicStore/config.json
#sed -i "s/<replacepass>/$3/g" /music/src/MusicStore/config.json
sed -i "s/<replaceserver>/$1/g" /music/config.json
sed -i "s/<replaceuser>/$2/g" /music/config.json
sed -i "s/<replacepass>/$3/g" /music/config.json

# start application
#sudo nginx -s reload
#sudo dotnet restore /music/src/MusicStore.Standalone
#cd /music/src/MusicStore.Standalone
#sudo dotnet run

# config supervisor
sudo apt-get install -y supervisor
#sudo cp /music/supervisor/music.conf /etc/supervisor/conf.d/
#sudo service supervisor stop
#sudo service supervisor start
