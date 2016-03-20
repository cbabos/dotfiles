#!/usr/bin/env zsh

# Shortcuts
alias c="clear"
alias g="git"
alias h="history"
alias j="jobs"
alias v="vim"
alias glg="g lg"
alias gc="git commit"

# Aliases
alias lsd="ls -d *(/)" # List only directories
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"

# Recursively delete unnecessary files
alias cleanup="find . -type f \( -name ".DS_Store" -o -name "Thumbs.db" \) -ls -delete"

# Sufix aliases
alias -g C="| wc -l | tr -d ' '" # e.g. grep alias ~/.zsh/* C
alias -g DN=/dev/null
alias -g NE="2> /dev/null" # e.g. rm -rf NE
alias -g H="| head"

# Preferences for programs
alias ag="ag -C 1 -S -f" # The Silver Searcher. Like ack, but faster.
alias mkdir="mkdir -p" # Create intermediate directories by default
alias sudo="sudo " # Enable aliases to be sudo’ed

# OS specific settings
case "$(uname -s)" in

"Darwin") # OSX
    alias o="open"
    alias oo="open ."
    alias cw="cd ${HOME}/Sites" # Enter to the www directory
    alias update="sudo softwareupdate -i -a && \
        brew update && brew upgrade && brew cleanup && \
        npm update -g && rm npm-debug.log 2>/dev/null"
    ;;

"Linux")
    alias cw="cd /var/www"
    alias update="sudo apt-get update && sudo apt-get upgrade && \
        sudo apt-get autoremove && sudo apt-get autoclean && \
        npm update -g"
    ;;

esac

