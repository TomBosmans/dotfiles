#!/usr/bin/env zsh
set -euo pipefail

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Install packages
echo "Installing packages..."
brew install \
  eza \
  zoxide \
  bat \
  fzf \
  neovim \
  tmux \
  stow \
  opencode

brew install --cask kitty
brew install --cask font-jetbrains-mono-nerd-font

# Stow dotfiles
echo "Stowing dotfiles..."
stow -t ~ \
  zsh \
  nvim \
  tmux \
  git \
  bat \
  kitty \
  opencode
