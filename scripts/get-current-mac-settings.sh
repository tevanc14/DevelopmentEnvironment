#!/usr/bin/env bash

# cd to the script location
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

RESOURCES=../resources/work

cp ~/.shell_aliases \
   ~/.shell_functions \
   ~/.zshrc \
   ${RESOURCES}

readDefaultsToFile() {
    PROPERTY=${1}
    FILE_NAME=${2}

    defaults read ${PROPERTY} > ${RESOURCES}/${FILE_NAME}.plist
}

readDefaultsToFile "com.apple.driver.AppleBluetoothMultitouch.mouse" "mouseDefaults"
readDefaultsToFile "com.apple.driver.AppleBluetoothMultitouch.trackpad" "trackpadDefaults"
readDefaultsToFile "com.apple.driver.AppleHIDMouse" "hidMouseDefaults"
readDefaultsToFile "com.apple.systemuiserver" "systemUiServer"
