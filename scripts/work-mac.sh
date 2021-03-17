#!/usr/bin/env bash

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

# Mac command line tools (I think you need this?)
xcode-select --install

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install everything in the Brewfile
cp ${RESOURCES}/Brewfile ~/
brewfile install --global

# Terminal setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Copy config files
cp ${RESOURCES}/.shell_aliases ${RESOURCES}/.shell_functions ${RESOURCES}/.zshrc ~/
cp ${RESOURCES}/crontab /var/at/tabs/tevanc

# Set up Oath
cd ${ZDEV} && git clone git@gitlab.zgtools.net:devex/aws/tools/oath.git && cd -
continue "Go run ./oath in ${ZDEV}/oath"

# Install terraform version
tfenv install 0.14.5

# Manual steps
continue "Go import the iTerm profile from ./../resources/work/iTermDefaultProfile.json"
continue "Also import the iTerm themes from https://github.com/mbadolato/iTerm2-Color-Schemes"
continue "Set up the Google Drive application"
