#!/usr/bin/env zsh

# Recursively delete unnecessary files
alias cleanup="find . -type f \( -name ".DS_Store" -o -name "Thumbs.db" \) -ls -delete"

