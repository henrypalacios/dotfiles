#!/usr/bin/env bash

set -euo pipefail

##? Install Google Chrome via Official Repository
#?? 1.0.0
##?
##? Usage:
##?   install_chrome


wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt update

sudo apt install google-chrome-stable -y