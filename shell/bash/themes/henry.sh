PROMPT_COMMAND="henry_theme"

FIRST_CHARACTER="⎇"

henry_theme() {
  current_dir=$(dot filesystem short_pwd)

  export PS1="\e[0;34m${FIRST_CHARACTER}  \e[1;92m${current_dir} \e[0m"
}