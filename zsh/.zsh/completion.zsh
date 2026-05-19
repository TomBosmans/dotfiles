#!/usr/bin/env zsh

fpath=(~/.zsh/completion /opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit
