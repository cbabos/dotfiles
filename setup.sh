#!/bin/sh


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

# Add base16 gnome-terminal colour scheme
git clone https://github.com/chriskempson/base16 ~/base16 
~/base16/base16-tomorrow.dark.sh 
rm -Rf ~/base16

