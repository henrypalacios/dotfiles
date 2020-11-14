##? VIM and .vimrc configuration installer
#?? 1.0.0
##?
##? Usage:
##?   commit
##?   commit <message>

red='\033[0;31m'
green='\033[0;32m'
purple='\033[0;35m'
normal='\033[0m'

_w() {
  local -r text="${1:-}"
  echo -e "$text"
}
_a() { _w " > $1"; }
_e() { _a "${red}$1${normal}"; }
_s() { _a "${green}$1${normal}"; }
_q() { read -rp "🤔 $1: " "$2"; }

current_timestamp() { date +%s; }

create_vimrc() {
  if [ -d "$1" ]; then
    local -r backup_path="$1.$(current_timestamp).back"

    _e "The path '$1' already exist"
    _s "Creating a backup in '$backup_path'"

    mv "$1" "$backup_path"
  else
    _a "Ok! dotfiles wll be located in: ${purple}$DOTFILES_PATH${normal}"
  fi

  mkdir -p "$1"
}

command_exists() {
  type "$1" >/dev/null 2>&1
}

install_package() {
  if ! command_exists "$1"; then
    _e "$1 not installed, trying to install"

    if command_exists apt; then
      _a "Installing using apt"
      sudo apt -y install "$1" >/dev/null 2>&1
    elif command_exists yum; then
      _a "Installing using yum"
      yes | sudo yum install "$1" >/dev/null 2>&1
    elif command_exists brew; then
      _a "Installing using brew"
      yes | brew install "$1" >/dev/null 2>&1
    else
      _e "Could not install $1, no package provider found"
      exit 1
    fi
  fi
}


_w "  ┌────────────────────────────────────┐"
_w "~ │ 👨‍💻 This is my ${green}VIM${normal} installer! │ ~"
_w "  └────────────────────────────────────┘"
vim_folder=~/.vim
vim_rc=~/.vimrc

install_package vim

# detect if there's a .vim folder
if [ -d $vim_folder ]
then
  _e "The $(vim_folder) already exist"
  _q "Would you like to backup your $(vim_folder) folder first? [y/n] " ans
  if [ "$ans" == "y" ]
  then
    backup_path="$vim_folder-$(current_timestamp).back"
    _s "Creating a backup in '$backup_path'"
    mv "$vim_folder" "$backup_path" 
  else
    exit
  fi
fi

# check if vimrc is already exist
if [ -L $vim_rc ] || [ -f $vim_rc ]
then
  _e "The '$vim_rc'  already exist"
  _q "Would you like to backup your '$vim_rc' first? [y/n] " ans
  if [ "$ans" == "y" ]
  then
    backup_path="$vim_rc-$(current_timestamp).back"
    _s "Creating a backup in '$backup_path'"
    mv "$vim_folder" "$backup_path" 
  else
    exit
  fi
fi

# check if git is installed
url=https://raw.githubusercontent.com/henrypalacios/dotfiles/master/editors/vim/.vimrc
echo `curl -# -C - -o "${url}" "${vim_rc}"` || {
  echo "sorry, it was not possible to download the file"
  exit
}

