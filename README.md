# cbabos's dotfiles
This repository contains my main configurations for setting up a fresh install on MacOS. 

Using [Homebrew](http://brew.sh/) as package manager I'm installing the following for my environment: 
- [iTerm2](https://iterm2.com) 
- [Z shell](https://www.zsh.org) with [oh-my-zsh](https://ohmyz.sh) 
- [NeoVIM](http://www.neovim.io/) with my [personal config](/nvim)

As I'm mostly doing (currently) Javascript development my main tool I need is of course [NodeJS](https://nodejs.org).
I'm also working on some CAD projects as a hobbyist 3D printer user for that I'm using [FreeCAD](https://www.freecad.org). 
Also I do need some fun times sometimes (mostly truck simulator), because of that the config also installs [Steam](https://store.steampowered.com)

In order to use the configuration you'll need to follow a couple of steps: 
- open Terminal (macos default) 
- `mkdir -p ~/work && git clone git@github.com:cbabos/dotfiles.git ~/work/ && cd ~/work/dotfiles && sh setup.sh` 
