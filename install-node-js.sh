#!/bin/bash

# The target directory to install to
mkdir ~/local

# Cloning the official git repo
git clone git://github.com/joyent/node.git ~/node-installer

# Building and installing node.js
cd ~/node-installer
./configure --prefix=$HOME
make
make install

# Install npm
curl -L https://npmjs.org/install.sh | sh

# Install my necessary tools in node
npm -g install browser-sync gulp yo generator-webapp
