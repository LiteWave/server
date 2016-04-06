#!/bin/bash

## begin this script by first doing the following:
#mkdir ~/config
#cd ~/config
#git clone git@github.com:LiteWave/server.git

sudo apt-get update
sudo apt-get install nginx
sudo apt-get install git
sudo apt-get install keychain
sudo apt-get install python-pip
sudo pip install nodeenv

ssh-keygen

sudo cp .bash_profile ~/
source ~/.bash_profile

mkdir ~/apps
cd ~/apps

# apiapp
git clone git@github.com:LiteWave/apiapp.git
cd ~/apps/apiapp
nodeenv env

# adminapp
cd ~/apps
mkdir adminapp

# homeapp
cd ~/apps
git clone git@github.com:LiteWave/homeapp.git

# add links
sudo mkdir /var/www
sudo ln -s ~/apps/apiapp /var/www/apiapp
sudo ln -s ~/apps/adminapp /var/www/adminapp
sudo ln -s ~/apps/homeapp /var/www/homeapp

# set up nginx configs (assuming this repo is located at ~/config/server)

sudo cp ~/config/server/nginx.conf /etc/nginx/
sudo cp ~/config/server/conf.d/apps.conf /etc/nginx/conf.d/

sudo mkdir /etc/nginx/include.d
sudo cp ~/config/server/include.d/common.conf /etc/nginx/include.d/

sudo service nginx restart