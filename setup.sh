#!/bin/zsh

# This function will sync dotfiles to the homefolder
function copyDotFiles() { rsync --exclude ".git/" --exclude "setup.sh" --exclude "README.md" --exclude "iterm2profile" -avh --no-perms . ~;
}

copyDotFiles()

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install my dotfiles
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Updating and upgrading brew
# Later (after we activated zsh with oh-my-zsh) you can use `bubu` alias for this
brew update 
brew upgrade

# Installing basic toolchain
brew install zsh tree nvim iterm2 font-fira-code-nerd-font

# Install additional devtools 
brew install node

# install additional software
brew install steam freecad

# Don't create .DS_Store files on network shares (need logout / login) 
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Apply my profile for iTerm2
defaults import com.googlecode.iterm2 iterm2profile.plist

# Setup crontab  
crontab .crontab
