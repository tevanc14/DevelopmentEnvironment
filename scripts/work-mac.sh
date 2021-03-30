#!/usr/bin/env bash

# cd to the script location
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

RESOURCES=../resources/work

# Directories to create
ZDEV=~/zdev

continue() {
    MESSAGE=${1}
    echo "${MESSAGE}"
    read -p "Done with that? " -n 1 -r
    echo
}

mkdir -p ${ZDEV}

# Need to see if mas signin is available in Big Sur
continue "Go sign in to the App Store"

# Mac command line tools (I think you need this?)
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install everything in the Brewfile
cp ${RESOURCES}/.Brewfile ~/
brew bundle install --global

# Terminal setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Copy config files
cp ${RESOURCES}/.shell_aliases ${RESOURCES}/.shell_functions ${RESOURCES}/.zshrc ~/

# Set up Oath
cd ${ZDEV} && git clone git@gitlab.zgtools.net:devex/aws/tools/oath.git && cd -
continue "Go start docker and run ./oath in ${ZDEV}/oath"

# Install terraform version
tfenv install 0.14.5

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool YES

# Change time display format
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM h:mm:ss a"

# Have to restart the UI Server after the defaults changes
killall SystemUIServer

# Manual steps
continue "Go import the iTerm profile from ./../resources/work/iTermDefaultProfile.json"
continue "Also import the iTerm themes from https://github.com/mbadolato/iTerm2-Color-Schemes"
continue "Open the Jetbrains Toolbox app"
continue "Open crontab and decide if this should all go in there: $(cat ${RESOURCES}/crontab)"
continue "Set up the Google Drive application"
