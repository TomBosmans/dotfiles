#!/usr/bin/env bash
set -euo pipefail

# Install packages
echo "Installing packages..."
apt-get update
apt-get install -y \
  bat \
  fd-find \
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

# Install grpcurl
if ! command -v grpcurl &>/dev/null; then
  echo "Installing grpcurl..."
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "arm64" ]; then
    GRPCURL_ARCHIVE="grpcurl_linux_arm64.tar.gz"
  else
    GRPCURL_ARCHIVE="grpcurl_linux_amd64.tar.gz"
  fi
  curl -fLo /tmp/grpcurl.tar.gz "https://github.com/fullstorydev/grpcurl/releases/latest/download/${GRPCURL_ARCHIVE}"
  tar -xzf /tmp/grpcurl.tar.gz -C /usr/local/bin grpcurl
  rm /tmp/grpcurl.tar.gz
fi

# Install websocat
if ! command -v websocat &>/dev/null; then
  echo "Installing websocat..."
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "arm64" ]; then
    WEBSOCAT_BIN="websocat.aarch64-unknown-linux-musl"
  else
    WEBSOCAT_BIN="websocat.x86_64-unknown-linux-musl"
  fi
  curl -fLo /usr/local/bin/websocat "https://github.com/vi/websocat/releases/latest/download/${WEBSOCAT_BIN}"
  chmod +x /usr/local/bin/websocat
fi

# Stow dotfiles
echo "Stowing dotfiles..."
stow -t ~ \
  zsh \
  nvim \
  tmux \
  git \
  bat

# Install tmux plugin manager
if [ ! -d ~/.config/tmux/plugins/tpm ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

# Build bat theme cache
echo "Building bat theme cache..."
bat cache --build
