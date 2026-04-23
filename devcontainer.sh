#!/usr/bin/env bash
set -e

# Devcontainer setup script for use with DevPod dotfiles.
# Installs neovim, opencode, and stows their configs.

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

# Install stow (needed to symlink configs)
sudo apt-get update
sudo apt-get install -y stow

# --- Neovim ---
# Install prebuilt release tarball
sudo apt-get install -y wget curl luarocks make gcc
NVIM_VERSION="v0.11.0"
ARCH=$(uname -m)
if [ "$ARCH" = "aarch64" ]; then
  NVIM_ARCH="arm64"
else
  NVIM_ARCH="x86_64"
fi
wget -q "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-${NVIM_ARCH}.tar.gz" -O /tmp/nvim.tar.gz
sudo tar -xzf /tmp/nvim.tar.gz -C /usr/local --strip-components=1
rm /tmp/nvim.tar.gz
stow nvim

# --- OpenCode ---
curl -fsSL https://opencode.ai/install | bash
stow opencode
