#!/usr/bin/env bash

DEV_DIR="~/dev"
PROJECTS_DIR="${DEV_DIR}/projects"
APPLICATIONS_DIR="${DEV_DIR}/applications"

# Misc
sudo apt install curl
sudo apt install xclip
mkdir "${DEV_DIR}"
mkdir "${PROJECTS_DIR}"
mkdir "${APPLICATIONS_DIR}"

# Git
sudo apt install git
git config --global user.name "Tevan Carrell"
git config --global user.email "tevanc14@gmail.com"

# Terminal (Will have to restart to get some changes)
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
sudo chsh -s $(which zsh)
sudo apt install powerline fonts-powerline
cd ~/.oh-my-zsh
upgrade_oh_my_zsh

# Vim
sudo apt install vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Dot files
cd "$(dirname "$0")"
cp resources/personal/.zshrc resources/personal/.shell_aliases resources/personal/.shell_functions ~

# OS Settings

## Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

## Inactive screen timeout (in seconds)
gsettings set org.gnome.desktop.session idle-delay 900

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

## Steam
sudo apt install steam-installer

## Guake
sudo apt install guake
# Can dump settings with dconf dump/apps/guake/
dconf reset -f /apps/guake
dconf load /apps/guake/ < resources/personal/guake.config
