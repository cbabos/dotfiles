#!/bin/sh

# This function will sync dotfiles to the homefolder
copyDotFiles () {
  rsync --exclude ".git/" --exclude "setup.sh" --exclude "README.md" avh --no-perms . ~;
}

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# Install my dotfiles
copyDotFiles()

# Installing Node.JS components that I need
npm install -g gulp browser-sync bower 

# Installing vim Vundle
vundle_dir="${HOME}/.vim/bundle/vundle"
vundle_repository="https://github.com/gmarik/vundle.git"
if [ ! -d "${vundle_dir}" ]; then
        git clone -q "${vundle_repository}" "${vundle_dir}"
        fi

# Install the plugins
vim -c "BundleInstall" -c "qa"

# Create tmux config folder
mkdir -p ~/.tmux/plugins

# Install tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins
