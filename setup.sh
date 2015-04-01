#!/bin/bash

# Initial source folder 
SRCDIR=$(pwd)

# Write some information
echo "cbabos's dotfiles"
echo "================="
echo ""
echo "Please follow the instructions on the screen."
echo ""

# Install Oh-My-Zsh 
curl -L http://install.ohmyz.sh | sh
# Install my zshrc
cp $SRCDIR/.zshrc ~/.zshrc

# This function will sync dotfiles to the homefolder
rsync --exclude ".git/" --exclude ".DS_Store" \
      --exclude "setup.sh" --exclude "README.md" \
      --exclude "themes" --exclude "fonts" \
      --exclude "prefs" -avh --no-perms . ~;

# Install color scheme for terminals (xterm)
git clone https://github.com/chriskempson/base16-xresources.git ~/xresources
xrdb ~/xresources/base16-xresources/base16-twilight.dark.256.xresources
## Cleanup 
rm -Rf ~/xresources

# Install vundle for vim
echo -n "Installing vim plugins... "

# Install vundle plugin manager (if not installed already)
vundle_dir="${HOME}/.vim/bundle/vundle"
vundle_repository="https://github.com/gmarik/vundle.git"
if [ ! -d "${vundle_dir}" ]; then
    git clone -q "${vundle_repository}" "${vundle_dir}"
fi

# Install the plugins
vim -c "BundleInstall" -c "qa"

# Create mpd folder structure
mkdir -p .mpd/playlists

# Install node.js
#./install-node-js.sh
