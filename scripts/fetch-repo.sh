#!/usr/bin/env bash

ZIP_FILE=DevelopmentEnvironment.zip

curl -L https://github.com/tevanc14/developmentenvironment/archive/master.zip --output ${ZIP_FILE}
unzip ${ZIP_FILE}
rm ${ZIP_FILE}

