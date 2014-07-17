#!/bin/sh

# This function will sync dotfiles to the homefolder
function copyDotFiles() {
rsync --exclude ".git/" --exclude ".DS_Store" \
      --exclude "setup.sh" --exclude "README.md" \
      --exclude "themes" --exclude "fonts" \
      --exclude "prefs" --exclude "Brewfile" \
      --exclude ".cask" --exclude ".osx" \
      -avh --no-perms . ~;
}

# Initial source folder 
SRCDIR=$(pwd)

# Write some information
echo "cbabos's dotfiles"
echo "================="
echo ""
echo "Please follow the instructions on the screen."
echo ""

# Installing dotfiles
copyDotFiles

# Call gcc to install xcode console tools 
gcc

# Install some fonts to the system
cp $SRCDIR/fonts/* ~/Library/Fonts/

# Install Oh-My-Zsh 
curl -L http://install.ohmyz.sh | sh
# Install the original agnoster theme
cp $SRCDIR/themes/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
# Install my zshrc
cp $SRCDIR/.zshrc ~/.zshrc

# Getting sudo 
sudo -v

# Install homebrew 
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Keeping sudo 
sudo -v

# Install my Brew Bundle
cd ~ && brew bundle

# Keeping sudo 
sudo -v

# Install native applications using cask
source ~/.cask

# Install some node.js utilities globally
npm install -g yo gulp generator-webapp phonegap cordova browser-sync weinre 

# Install OSX settings
source ~/.osx
