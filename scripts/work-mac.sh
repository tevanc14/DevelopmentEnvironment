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

writeDefaultsFromFile() {
    PROPERTY=${1}
    FILE_NAME=${2}

    PLIST="$(cat ${RESOURCES}/${FILE_NAME}.plist)"
    PLIST="'$(echo -e "${PLIST}" | tr -d '[:space:]')';"
    echo defaults write "${PROPERTY}" "${PLIST}"
}

mkdir -p ${ZDEV}

# Need to see if mas signin is available in Big Sur
continue "Go sign in to the App Store"

# Must be on the VPN for git clones
continue "Go connect to the VPN"

# Mac command line tools (I think you need this?)
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install everything in the Brewfile
cp ${RESOURCES}/.Brewfile ~/
brew bundle install --global

# Terminal setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
continue "Go run p10k configure (this will install the powerline font)"

# Copy config files
cp ${RESOURCES}/.shell_aliases ${RESOURCES}/.shell_functions ${RESOURCES}/.zshrc ~/

# Set up Oath
cd ${ZDEV} && git clone git@gitlab.zgtools.net:devex/aws/tools/oath.git && cd -
continue "Go start docker and run ./oath in ${ZDEV}/oath"

# Terraform version
tfenv install 0.14.5
tfenv use 0.14.5

# Node version
nvm install 14.16.0
nvm use 14 

# Sleep x minutes when on battery (-b) and y when charging (-c)
sudo pmset -b sleep 5
sudo pmset -b displaysleep 5
sudo pmset -c sleep 30
sudo pmset -c displaysleep 30

# Autohide dock
defaults write "com.apple.dock" "autohide" -int 1

# Restart dock after changes
killall Dock

# Show battery percentage
defaults write "com.apple.menuextra.battery" "ShowPercent" -bool YES

# Change time display format
defaults write "com.apple.menuextra.clock" "DateFormat" -string "EEE d MMM h:mm:ss a"

# Keyboard repeat settings
defaults write "Apple Global Domain" "InitialKeyRepeat" -int 25
defaults write "Apple Global Domain" "KeyRepeat" -int 2

# Alert sound volume
defaults write "Apple Global Domain" "com.apple.sound.beep.volume" -int 0

# # Defaults from files (maybe I'll figure this out one day)
# writeDefaultsFromFile "com.apple.driver.AppleBluetoothMultitouch.mouse" "mouseDefaults"
# writeDefaultsFromFile "com.apple.driver.AppleBluetoothMultitouch.trackpad" "trackpadDefaults"
# writeDefaultsFromFile "com.apple.driver.AppleHIDMouse" "hidMouseDefaults"
# writeDefaultsFromFile "com.apple.systemuiserver" "systemUiServer"
defaults write "com.apple.driver.AppleBluetoothMultitouch.mouse" '{MouseButtonDivision=55;MouseButtonMode=TwoButton;MouseHorizontalScroll=1;MouseMomentumScroll=1;MouseOneFingerDoubleTapGesture=0;MouseTwoFingerDoubleTapGesture=3;MouseTwoFingerHorizSwipeGesture=2;MouseVerticalScroll=1;UserPreferences=1;}';
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" '{Clicking=1;DragLock=0;Dragging=0;TrackpadCornerSecondaryClick=0;TrackpadFiveFingerPinchGesture=2;TrackpadFourFingerHorizSwipeGesture=2;TrackpadFourFingerPinchGesture=2;TrackpadFourFingerVertSwipeGesture=2;TrackpadHandResting=1;TrackpadHorizScroll=1;TrackpadMomentumScroll=1;TrackpadPinch=1;TrackpadRightClick=1;TrackpadRotate=1;TrackpadScroll=1;TrackpadThreeFingerDrag=0;TrackpadThreeFingerHorizSwipeGesture=2;TrackpadThreeFingerTapGesture=0;TrackpadThreeFingerVertSwipeGesture=2;TrackpadTwoFingerDoubleTapGesture=1;TrackpadTwoFingerFromRightEdgeSwipeGesture=3;USBMouseStopsTrackpad=0;UserPreferences=1;version=5;}';
defaults write "com.apple.driver.AppleHIDMouse" '{Button1=1;Button2=1;Button3=0;Button4=0;Button4Click=0;Button4Force=0;ButtonDominance=1;ScrollH=1;ScrollS=4;ScrollSSize=30;ScrollV=1;}';
defaults write "com.apple.systemuiserver" '{"NSStatusItemVisibleSiri"=0;"NSStatusItemVisiblecom.apple.menuextra.airport"=1;"NSStatusItemVisiblecom.apple.menuextra.appleuser"=1;"NSStatusItemVisiblecom.apple.menuextra.battery"=1;"NSStatusItemVisiblecom.apple.menuextra.bluetooth"=1;"NSStatusItemVisiblecom.apple.menuextra.clock"=1;"NSStatusItemVisiblecom.apple.menuextra.volume"=1;"__NSEnableTSMDocumentWindowLevel"=1;"last-analytics-stamp"="638390664.8063281";"last-messagetrace-stamp"="606690643.909081";menuExtras=("/System/Library/CoreServices/MenuExtras/Clock.menu","/System/Library/CoreServices/MenuExtras/AirPort.menu","/System/Library/CoreServices/MenuExtras/User.menu","/System/Library/CoreServices/MenuExtras/Bluetooth.menu","/System/Library/CoreServices/MenuExtras/Volume.menu","/System/Library/CoreServices/MenuExtras/Battery.menu");}';

# Have to restart the UI Server after the defaults changes
killall SystemUIServer

# Install iterm themes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
iTerm2-Color-Schemes/tools/import-scheme.sh iTerm2-Color-Schemes/schemes/*
rm -rf iTerm2-Color-Schemes/

# Dark mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'

# Default Chrome browser (Chrome has to be not open)
open -a "Google Chrome" --args --make-default-browser

# Manual steps
continue "Go import the iTerm profile from ${RESOURCES}/iTermDefaultProfile.json"
continue "Open the Jetbrains Toolbox app"
continue "Open crontab and decide if this should all go in there: $(cat ${RESOURCES}/crontab)"
continue "Set up the Google Drive application"
continue "Set up Okta in your browser"
continue "Set up a Gitlab SSH key https://docs.gitlab.com/ee/ssh/#generate-an-ssh-key-pair"

# Things that currently don't work
# - Bluetooth options in top bar
# - Tap to click on trackpad
# - Battery percentage
