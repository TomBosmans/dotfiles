# Path to your oh-my-zsh installation.
export ZSH="/Users/tombosmans/.oh-my-zsh"
eval "$(rbenv init -)"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
  export EDITOR="nvim"
fi

export FZF_BASE=/usr/local/bin/fzf
# export FZF_DEFAULT_OPTS="--reverse"
export FZF_DEFAULT_COMMAND="ag --hidden -l -g ''"

export BAT_THEME="Nord"
export PROJECT_FOLDER=~/Projects

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias co="git checkout"

alias docket="cd ~/Projects/docket/; nvim"
alias hr_tool="cd ~/Projects/hr_tool_expressjs/; nvim"

alias magit="emacs -nw -q --load ~/magit/init.el"

alias fetchTest="zsh ~/Projects/docket/scripts/fetch_test_db.sh"
alias fetchInt="zsh ~/Projects/docket/scripts/fetch_int_db.sh"

start() {
  zsh $PROJECT_FOLDER/docket/scripts/start.sh
}

colored_ssh() {
  echo -e "\033]11;#336699\a"
  command ssh $@
  echo -ne "\033]110;\007\033]111;\007"
}

# reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37
note() {
  local TEXT=$1
  echo -e "\e[1;33m $TEXT \e[0m"
}

error() {
  local TEXT=$1
  echo -e "\e[1;31m $TEXT \e[0m"
}

success() {
  local TEXT=$1
  echo -e "\e[1;32m $TEXT \e[0m"
}

fileExists() {
  local FILE=$1
  test -f "$FILE"
}

folderExists() {
  local FOLDER=$1
  test -d "$FOLDER"
}

setupTest() {
  NAME=$1
  DB_NAME="${NAME}test"
  DIR=$(PWD)
  cd ~/Projects/docket/services/$NAME
  dropdb $DB_NAME
  createdb $DB_NAME
  POSTGRES_DATABASE=$DB_NAME yarn run typeorm schema:sync
  POSTGRES_DATABASE=$DB_NAME yarn typeorm migration:run
  cd $DIR
}

# COLORS
local nord0_term="-1"
local nord1_term="0"
local nord3_term="8"
local nord5_term="7"
local nord6_term="15"
local nord7_term="14"
local nord8_term="6"
local nord9_term="4"
local nord10_term="12"
local nord11_term="1"
local nord12_term="11"
local nord13_term="3"
local nord14_term="2"
local nord15_term="5"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$nord1_term,bg:$nord0_term,spinner:$nord9_term,hl:$nord3_term"\
" --color=fg:$nord5_term,header:$nord8_term,info:$nord10_term,pointer:$nord9_term"\
" --color=marker:$nord9_term,fg+:$nord6_term,prompt:$nord9_term,hl+:$nord9_term"
