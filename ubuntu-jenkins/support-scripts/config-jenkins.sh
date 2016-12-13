#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo apt-get install openjdk-7-jdk -y
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sudo apt-get install git -y
sudo apt-get install python3-pip -y
sudo touch ${JENKINS_HOME}/jenkins.install.InstallUtil.lastExecVersion
