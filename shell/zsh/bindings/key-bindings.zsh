autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# ctrl+p - Go to project
zle     -N   go_to_project
bindkey '^p' go_to_project
