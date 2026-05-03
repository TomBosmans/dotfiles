#!/usr/bin/env zsh

command -v zoxide &>/dev/null && alias cd="z"
command -v eza &>/dev/null && alias ls="eza --icons --classify"
command -v bat &>/dev/null && alias cat="bat --plain"
command -v nvim &>/dev/null && alias vim="nvim"
