#!/bin/bash

cd ~
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.nvm/nvm.sh
nvm install 0.10
nvm alias default 0.10

# Install my necessary tools in node
npm -g install browser-sync gulp yo generator-webapp
