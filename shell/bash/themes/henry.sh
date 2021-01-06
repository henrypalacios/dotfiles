PROMPT_COMMAND="henry_theme"

FIRST_CHARACTER="⎇"
GREEN_COLOR="32"
RED_COLOR="31"

henry_theme() {
  LAST_CODE="$?"
  current_dir=$(dot core short_pwd)
  STATUS_COLOR=$GREEN_COLOR

  if [ $LAST_CODE -ne 0 ]; then
    STATUS_COLOR=$RED_COLOR
  fi

  export PS1="\[\e[${STATUS_COLOR}m\]\e[0;34m${FIRST_CHARACTER}  \e[1;92m${current_dir} \e[0m"
}
