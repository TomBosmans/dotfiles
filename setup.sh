#!/usr/bin/env bash

# INFO: install dependencies
apt update && apt install -y\
  neovim\
  zsh\
  fzf\
  bat\
  exa\
  tmux\
  zoxide\
  stow\
  make\
  ripgrep\
  git

# INFO: place all our config files in the right spot
stow */

# INFO: make zsh default shell
chsh -s $(which zsh)

# INFO: install nvim packages
nvim --headless "+Lazy! restore" +qa

# INFO: install tmux packagse
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm/bin/install_plugins
