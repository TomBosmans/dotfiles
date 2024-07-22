#!/usr/bin/env bash

# INFO: update package mananger
apt update

# INFO: install packages
apt install -y exa fzf stow ripgrep zoxide make

# INFO: setup git
apt install -y git
stow git

# INFO: setup locales
apt install -y locales
# uncomment en_US.UTF-8 from /etc/locale.gen
sed -i '/^# en_US\.UTF-8 UTF-8/s/^# //' /etc/locale.gen
locale-gen

# INFO: setup tmux
apt install -y tmux
stow tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
# install packages
~/.config/tmux/plugins/tpm/bin/install_plugins

# INFO: setup bat
apt install -y bat
stow bat
# On debian the command by default is batcat...
ln -s /usr/bin/batcat /usr/local/bin/bat

# INFO: setup zsh
apt install -y zsh
stow zsh
chsh -s $(which zsh)

# INFO: setup nvim
apt install -y wget gettext cmake
git clone git@github.com:neovim/neovim.git
cd neovim
git checkout v0.10.0
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build
cpack -G DEB && dpkg -i --force-overwrite nvim-linux64.deb
dpkg -i --force-overwrite nvim-linux64.deb
cd ../..
stow nvim
# nvim --headless "+Lazy! restore" +qa
