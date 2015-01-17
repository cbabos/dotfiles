#!/bin/sh

## Configuration
# Brew packages
BREW_PACK=(\
    coreutils \
    moreutils \
    findutils \
    zsh \
    homebrew/dupes/grep \
    cask \
    ack \
    pv \
    git \
    lynx \
    nmap \
    pigz \
    rename \ 
    rhino \
    tree \
    webkit2png \
    zopfli \
    p7zip \
    "vim --override-system-vi" \
    "imagemagick --with-webp" \
    lua \
    node \
)

# Native Apps to install with brew-cask
BREW_CASK_PACK=(\
    android-studio \
    google-chrome \
    imagealpha \
    imageoptim \
    libreoffice \
    mysqlworkbench \
    skype \
    steam \
    transmission \
    trim-enabler \
    vlc \
)

# Needed node.js | io.js packages
NODE_PACKAGES=(\
    gulp \
    browser-sync \
    bower \
    grunt \
    grunt-cli \
    yo \
    generator-webapp \
)

# This function will sync dotfiles to the homefolder
function copyDotFiles() {
  rsync --exclude ".git/" --exclude ".DS_Store" \
      --exclude "setup.sh" --exclude "README.md" \
      --exclude "themes" --exclude "fonts" \
      --exclude "prefs" -avh --no-perms . ~;
}

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Updating and upgrading brew
# Later (after we activated zsh with oh-my-zsh) you can use `bubu` alias for this 
brew update && brew upgrade

# Install brew packages defined in config
for package in $BREW_PACK 
do 
    brew install $package
done

# Install native apps with brew-cask as defined in config
for package in $BREW_CASK_PACK 
do 
    brew cask install $package
done

# Install node.js packages defined in config
for package in $NODE_PACKAGES 
do 
    npm install -g $package
done

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh
