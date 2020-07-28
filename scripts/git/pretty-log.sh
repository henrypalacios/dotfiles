#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"
source "$DOTFILES_PATH/scripts/core/documentation.sh"

##? Git log filtering
#?? 1.0.0
##?
##? Usage:
##?   pretty-log
docs::eval "$@"

commit=$(
  git log --graph \
    --color=always \
    --date=human \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%ad by %an" |
    fzf --ansi --no-sort \
      --preview '(git diff-tree --no-commit-id --name-status -r {2})' \
      --preview-window right:35%
)

commit_hash=$(echo ${commit} | awk '{print $2}')

echo ${commit_hash} | tr -d '\n' | xclip -selection clipboard