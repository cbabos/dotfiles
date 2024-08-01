#!/bin/sh
cd "$(dirname "$0")"

cd "$(dirname "$0")"

## Backup nvim
rsync -azv ~/.config/nvim .

cp ~/.oh-my-zsh/custom/aliases.zsh ./.oh-my-zsh/custom/
cp ~/.vimrc .
cp ~/.{gitconfig,gitignore-global} .
cp ~/.zshrc .

defaults export com.googlecode.iterm2 iterm2profile.plist
crontab -l > .crontab

if [[ `git status --porcelain` ]]; then
	git add .
	git commit -m 'Updated dotfiles - autobackup'
	git push origin main
fi


