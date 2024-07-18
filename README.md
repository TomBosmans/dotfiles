# DOTFILES

Use stow to place the configs in the right spot

## Install tmux packages
```zsh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux source ~/.tmux.conf
```
Press prefix + I (capital i, as in Install) to fetch the plugin.

## add themes to bat
```zsh
bat cache --build
```
