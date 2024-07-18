#!/usr/bin/env zsh

function add_file() {
  [ -f "$HOME/.zsh/$1" ] && source "$HOME/.zsh/$1"
}

function add_plugin() {
  PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
  # For plugins
  add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
  add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
}
