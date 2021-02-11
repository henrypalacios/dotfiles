# This is a useful file to have the same aliases/functions in bash and zsh
ulimit -n 200000
ulimit -u 2048

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Register custom aliases and functions
source "$DOTFILES_PATH/shell/aliases.sh"
source "$DOTFILES_PATH/shell/functions.sh"
for exportToSource in "$DOTFILES_PATH/shell/_exports/"*; do source "$exportToSource"; done
