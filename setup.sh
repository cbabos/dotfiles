#!/bin/sh

# This function will sync dotfiles to the homefolder
function copyDotFiles() {
  rsync --exclude ".git/" --exclude "setup.sh" --exclude "README.md" avh --no-perms . ~;
}

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install my dotfiles
copyDotFiles()

# Updating and upgrading brew
# Later (after we activated zsh with oh-my-zsh) you can use `bubu` alias for this 
brew update && brew upgrade

# Installing basic toolchain
brew install coreutils moreutils findutils zsh homebrew/dupes/grep caskroom/cask/brew-cask ack pv git lynx nmap pigz rename rhino tree webkit2png zopfli p7zip vim --override-system-vi imagemagick --with-webp lua node

# Installing Native Apps
brew cask install android-studio google-chrome imagealpha imageoptim libreoffice mysqlworkbench skype squire steam transmission trim-enabler vlc

# Installing Node.JS components that I need
npm install -g gulp browser-sync bower grunt grunt-cli yo generator-webapp

# Installing vim Vundle
vundle_dir="${HOME}/.vim/bundle/vundle"
vundle_repository="https://github.com/gmarik/vundle.git"
if [ ! -d "${vundle_dir}" ]; then
        git clone -q "${vundle_repository}" "${vundle_dir}"
        fi

# Install the plugins
vim -c "BundleInstall" -c "qa"

# Some OSX settings

# Don't create .DS_Store files on network shares (need logout / login) 
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
