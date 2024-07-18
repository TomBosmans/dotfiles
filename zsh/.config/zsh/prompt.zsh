#!/usr/bin/env zsh

workspace() {
  local git_path=$(git rev-parse --show-prefix)
  if [ ! -z $git_path ]; then
    echo -n "%F{red}$name%f %F{blue}$git_path%f"
  else
    echo -n "%F{red}$name%f"
  fi
}

working_dir() {
  if [ ! -z $name ]; then
    workspace
  else
    echo "%F{blue}%~%f"
  fi
}

git_state() {
  local BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{green}$BRANCH%f"

    if [ ! -z "$(git status --short)" ]; then
      echo " %F{red}✗%f"
    else
      echo " %F{green}✔%f"
    fi
  fi
}

precmd() { precmd() { print "" } } # new line after enter
setopt prompt_subst
PROMPT='%B$(working_dir)$(git_state)%b
▶ '
