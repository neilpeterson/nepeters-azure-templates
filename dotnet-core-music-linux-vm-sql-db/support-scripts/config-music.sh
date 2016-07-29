#!/bin/bash
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2-003121
sudo apt-get install -y git
sudo apt-get install -y nginx
sudo service nginx start
sudo git clone https://github.com/neilpeterson/dotnet-linux-music.git /music
sudo dotnet restore /music/src/MusicStore.Standalone
sudo rm -f /etc/nginx/sites-available/default
sudo wget https://raw.githubusercontent.com/neilpeterson/nepeters-azure-templates/master/dotnet-core-music-linux-vm-sql-db/support-scripts/default /etc/nginx/sites-enabled
sudo nginx -s reload
cd /music/src/MusicStore.Standalone
sudo dotnet run
