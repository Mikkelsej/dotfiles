#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo pacman -Syu --noconfirm

# Install required packages
echo "Installing packages..."
sudo pacman -S --noconfirm yay discord libinput xorg-xinput gparted xorg-xhost
yay -S --noconfirm visual-studio-code-bin spotify libinput-gestures obsidian

# Add user to input group
echo "Adding user to input group..."
sudo gpasswd -a $USER input

# Create symlinks
echo "Creating symlinks..."
sudo rm -f /etc/libinput-gestures.conf
sudo ln -sf ~/dotfiles/.config/libinput-gestures.conf /etc/libinput-gestures.conf
ln -sf ~/dotfiles/.config/libinput-gestures.conf ~/.config/libinput-gestures.conf

# Remove old dotfiles repo if it exists
echo "Removing old dotfiles repository..."
rm -rf ~/Dotfiles/

# Clone the dotfiles repository
echo "Cloning dotfiles repository..."
git clone https://github.com/Mikkelsej/dotfiles.git ~/dotfiles

# Ask for GitHub email
echo -n "Enter your GitHub email: "
read GITHUB_EMAIL

# Generate SSH key if not already present
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Generating SSH key..."
    ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL" -N "" -f ~/.ssh/id_rsa
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Copy the following SSH key into GitHub:"
    cat ~/.ssh/id_rsa.pub
else
    echo "SSH key already exists, skipping generation."
fi

# Change Git remote to use SSH
echo "Setting Git remote to SSH..."
cd ~/dotfiles && git remote set-url origin git@github.com:Mikkelsej/dotfiles.git

# Prompt for logging into applications
echo "Please log into VS Code, Discord, Spotify, and Chrome manually."

# Prompt for reboot
echo "Installation complete. Rebooting in 10 seconds... Press Ctrl+C to cancel."
sleep 10
sudo reboot
