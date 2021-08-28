export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'
export GRADLE_HOME=/opt/gradle/latest
export GEM_HOME="$HOME/.gem"
export GOPATH="/usr/local/go"
export VOLTA_HOME="$HOME/.volta"

export NAVI_PATH="/home/henry/.dotfiles/doc/navi"

export FZF_DEFAULT_OPTS='
  --color=pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934
  --reverse
'

export path=(
  "$HOME/bin"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
  "$GRADLE_HOME/bin"
  "$GEM_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.cargo/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/opt/homebrew/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
)


export PATH="$NAVI_PATH/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
