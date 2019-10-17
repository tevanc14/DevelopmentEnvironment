#!/usr/bin/env bash

DEV_DIR=~/dev
PROJECTS_DIR=${DEV_DIR}/projects
APPLICATIONS_DIR=${DEV_DIR}/applications

aptInstall() {
    if [[ "$#" -ne 1 ]]; then
        echo "No package name passed into apt install, exiting..."
        exit 2
    else
        sudo apt install ${1} -y
    fi
}

# Misc
aptInstall curl
aptInstall xclip
mkdir ${DEV_DIR}
mkdir ${PROJECTS_DIR}
mkdir ${APPLICATIONS_DIR}

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
cp ./resources/personal/.zshrc ./resources/personal/.shell_aliases ./resources/personal/.shell_functions ~
cd

# OS Settings

## Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

## Inactive screen timeout (in seconds)
gsettings set org.gnome.desktop.session idle-delay 900

## Workspaces on all montiors
gsettings set org.gnome.mutter workspaces-only-on-primary false

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

## Steam
aptInstall steam-installer

# Vim
aptInstall vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

## Terminator
aptInstall terminator
cp ./resources/personal/terminator.config ~/.config/terminator/config

## Jetbrains Toolbox
JETBRAINS_TOOLBOX_DIR=${APPLICATIONS_DIR}/jetbrains-toolbox
mkdir ${JETBRAINS_TOOLBOX_DIR}
JETBRAINS_TOOLBOX_DOWNLOAD_NAME=jetbrains-toolbox.tar.gz
# This will get outdated
curl -sSL -o ${JETBRAINS_TOOLBOX_DOWNLOAD_NAME} https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.15.5796.tar.gz
tar -zxf ${JETBRAINS_TOOLBOX_DOWNLOAD_NAME} -C ${JETBRAINS_TOOLBOX_DIR}
rm ${JETBRAINS_TOOLBOX_DOWNLOAD_NAME}

## Android Virtual Device
aptInstall qemu-kvm
sudo adduser $USER kvm

## Drivers (pulls the recommended version of Nvidia driver)
sudo ubuntu-drivers autoinstall

## Keyboard shortcuts

### wmctrl (map commands to open and focus windows)
aptInstall wmctrl

### xbindkeys (map keys to commands)
aptInstall xbindkeys
cp ./resources/personal/.xbindkeysrc ~

## Java
aptInstall default-jdk
# Will probably need to update version in here
cp ./resources/personal/environment /etc/

## Sublime
sudo snap install sublime-text --classic

## Atom
sudo snap install atom --classic

## Postman
sudo snap install postman
