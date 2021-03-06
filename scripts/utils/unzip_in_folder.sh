#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"
source "$DOTFILES_PATH/scripts/core/documentation.sh"


##? Unzip .zip code into Code/<folder> selected
#?? 1.0.0
##?
##? Usage:
##?   unzip_in_folder [<name_filter>] [<folder>]
##?
docs::eval "$@"

project_root_directories="$HOME/Downloads/"
    
[[ -z "$name_filter" ]] && filterer="fzf" || filterer="fzf -q ${name_filter}"
project_directories=$(find $project_root_directories -iname \*.zip) 

file=$(echo "$project_directories" | ${filterer})

[[ "$folder" == "false" ]] && folder="" 
folders=$(find "$HOME/Code/$folder" -mindepth 1 -maxdepth 1 -type d)

to_folder=$(echo "$folders" | "fzf")


cd ${to_folder} && unzip ${file} -d ${to_folder}
