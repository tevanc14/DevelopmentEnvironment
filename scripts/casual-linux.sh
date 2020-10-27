#!/usr/bin/env bash

RESOURCES_DIR=./resources/personal/casual

aptInstall() {
    if [[ "$#" -ne 1 ]]; then
        echo "No package name passed into apt install, exiting..."
        exit 2
    else
        sudo apt install ${1} -y
    fi
}

aptGetInstall() {
    if [[ "$#" -ne 1 ]]; then
        echo "No package name passed into apt get install, exiting..."
        exit 2
    else
        sudo apt-get install ${1} -y
    fi
}

# Misc
aptInstall curl
aptInstall xclip

# Git
aptInstall git
git config --global user.name "Tevan Carrell"
git config --global user.email "tevanc14@gmail.com"

# Terminal (Will have to restart to get some changes)
aptInstall zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
sudo chsh -s $(which zsh)
aptInstall powerline
aptInstall fonts-powerline
cd ~/.oh-my-zsh
upgrade_oh_my_zsh

# Dot files
cd "$(dirname "$0")"
cp ${RESOURCES_DIR}/.zshrc ${RESOURCES_DIR}/.shell_aliases ${RESOURCES_DIR}/.shell_functions ~
cd

# OS Settings

## Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

## Inactive screen timeout (in seconds)
gsettings set org.gnome.desktop.session idle-delay 900

## Workspaces on all montiors
gsettings set org.gnome.mutter workspaces-only-on-primary false

## Dock

### Show dock on all monitors
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true

### Set dock position to bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

## Set default audio device
# Find name and ID with `pactl list sinks`
# set-default-sink 'alsa_output.pci-0000_01_00.1.hdmi-stereo'
# sudo sed -i 's/#set-default-sink output/set-default-sink 5/g' /etc/pulse/default.pa
# sudo sed -i 's/#set-default-source input/set-default-source 5/g' /etc/pulse/default.pa

# Applications

## Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

## Spotify
sudo snap install spotify

## VSCode
sudo snap install code --classic
code --install-extension Shan.code-settings-sync
# Type ">Sync" In Command Palette into order download / upload
# Get powerline font for integrated terminal
git clone https://github.com/abertsch/Menlo-for-Powerline.git
sudo mv Menlo-for-Powerline/*.ttf /usr/share/fonts/
sudo fc-cache -vf /usr/share/fonts/
rm -r Menlo-for-Powerline/

# Vim
aptInstall vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

## Terminator
aptInstall terminator
cp ./resources/personal/terminator.config ~/.config/terminator/config

## Keyboard shortcuts

### wmctrl (map commands to open and focus windows)
aptInstall wmctrl

### xbindkeys (map keys to commands)
aptInstall xbindkeys
cp ./resources/personal/.xbindkeysrc ~

## Sublime
sudo snap install sublime-text --classic

## Atom
sudo snap install atom --classic

## Postman
sudo snap install postman

## Gpick (color picker)
aptInstall gpick
