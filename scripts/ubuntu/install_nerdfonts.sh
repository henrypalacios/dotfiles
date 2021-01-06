#!/usr/bin/env bash

set -euo pipefail

##? Install Nerd Fonts Fira Code
#?? 1.0.0
##?
##? Usage:
##?   install_nerdfonts

fonts_path=~/.fonts

[ -d $fonts_path ] || mkdir $fonts_path

cd $fonts_path && curl -fLo "Fira Code Medium Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
