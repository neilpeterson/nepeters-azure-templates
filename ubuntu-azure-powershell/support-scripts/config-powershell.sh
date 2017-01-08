#!/bin/bash

sudo apt-get install libunwind8 libicu52 -y
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell_6.0.0-alpha.14-1ubuntu1.14.04.1_amd64.deb
sudo dpkg -i powershell_6.0.0-alpha.14-1ubuntu1.14.04.1_amd64.deb
sudo powershell
Install module AzureRM.NetCore.Preview -Force
