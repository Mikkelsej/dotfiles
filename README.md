# Download Apps
sudo pacman -S yay discord libinput xorg-xinput gparted xorg-xhost
yay -S visual-studio-code-bin spotify libinput-gestures obsidian

# Add user to input group
sudo gpasswd -a $USER input

# Create symlink in config with at .config/
sudo rm /etc/libinput-gestures.conf
sudo ln -sf ~/dotfiles/libinput-gestures.conf /etc/libinput-gestures.conf
sudo ln -sf ~/dotfiles/libinput-gestures.conf ~/.config

# Remove dotfiles
rm -rf Dotfiles/

# Clone
git clone https://github.com/Mikkelsej/dotfiles.git

# Add your github SSH key with
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
## Copy into github
cat ~/.ssh/id_rsa.pub
## Check that it works
ssh -T git@github.com

# Change url to for using SSH
git remote set-url origin git@github.com:Mikkelsej/dotfiles.git

# Log in to vs code, discord, spotify, chrome

# Reboot
reboot
