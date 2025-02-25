#!/bin/bash
cd ~/dotfiles || exit 1  # Change to the dotfiles directory, exit if it fails
git add .
git commit -m "Auto-push before shutdown"
git push origin master
