#!/bin/zsh

# This function will sync dotfiles to the homefolder
function copyDotFiles() {
  rsync --exclude ".git/" --exclude "setup.sh" --exclude "README.md" avh --no-perms . ~;
}

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install my dotfiles
copyDotFiles()
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Updating and upgrading brew
# Later (after we activated zsh with oh-my-zsh) you can use `bubu` alias for this
brew update 
brew upgrade

# Installing basic toolchain
brew install zsh tree vim node tmux oracle-jdk iterm2 imageoptim steam unity-hub jetbrains-toolbox webex-meetings obs 

# Installing Node.JS components that I need
npm install -g npm 

# Installing vim Vundle
vundle_dir="${HOME}/.vim/bundle/vundle"
vundle_repository="https://github.com/gmarik/vundle.git"
if [ ! -d "${vundle_dir}" ]; then
        git clone -q "${vundle_repository}" "${vundle_dir}"
        fi

# Install the plugins
vim -c "BundleInstall" -c "qa"

# Don't create .DS_Store files on network shares (need logout / login) 
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Install iTerm2 color scheme
open dimmedmonokai.itermcolors 

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git ~/fonts
~/fonts/install.sh
rm -Rf ~/fonts

# Create tmux config folder
mkdir -p ~/.tmux/plugins

# Install tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins
