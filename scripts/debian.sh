#!/usr/bin/env bash
set -euo pipefail

# Install packages
echo "Installing packages..."
apt-get update
apt-get install -y \
  bat \
  fzf \
  zoxide \
  tmux \
  stow \
  zsh

# Install eza
if ! command -v eza &>/dev/null; then
  echo "Installing eza..."
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "arm64" ]; then
    EZA_ARCHIVE="eza_aarch64-unknown-linux-gnu.tar.gz"
  else
    EZA_ARCHIVE="eza_x86_64-unknown-linux-gnu.tar.gz"
  fi
  curl -fLo /tmp/eza.tar.gz "https://github.com/eza-community/eza/releases/latest/download/${EZA_ARCHIVE}"
  tar -xzf /tmp/eza.tar.gz -C /usr/local/bin
  rm /tmp/eza.tar.gz
fi

# Install Neovim v0.11.x (pinned to match config requirements)
if ! command -v nvim &>/dev/null; then
  echo "Installing Neovim..."
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "arm64" ]; then
    NVIM_ARCHIVE="nvim-linux-arm64.tar.gz"
  else
    NVIM_ARCHIVE="nvim-linux-x86_64.tar.gz"
  fi
  curl -LO "https://github.com/neovim/neovim/releases/download/v0.11.5/${NVIM_ARCHIVE}"
  tar -xzf "$NVIM_ARCHIVE" -C /opt
  ln -sf /opt/"${NVIM_ARCHIVE%.tar.gz}"/bin/nvim /usr/local/bin/nvim
  rm "$NVIM_ARCHIVE"
fi

# Stow dotfiles
echo "Stowing dotfiles..."
stow -t ~ \
  zsh \
  nvim \
  tmux \
  git \
  bat
