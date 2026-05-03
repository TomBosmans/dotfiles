# AGENTS.md

## Overview

GNU Stow dotfiles repo. Each top-level folder is an independent stow package — no build system, no tests, no linting.

## Stow commands

Run from repo root:

    stow -t ~ <folder>          # install one package
    stow -t ~ */                # install all packages
    stow -R -t ~ <folder>       # restow (unlink then relink)

The `-t ~` flag is required — the default stow target is the parent directory, not `~`.

## Structure

- Each top-level folder (`zsh/`, `nvim/`, `kitty/`, etc.) mirrors the home directory tree, e.g. `kitty/.config/kitty/kitty.conf`
- `scripts/` — setup scripts (`macos.sh`, `debian.sh`), not a stow package
- `.agents/skills/commits/` — commit message conventions (loaded automatically by OpenCode)

## Conventions

- Commits follow Conventional Commits — use the `commits` skill
- Scopes: each stow package name (`zsh`, `nvim`, `kitty`, …), plus `deps` and `config` (for setup scripts)
- Catppuccin Macchiato is the shared color scheme across tools
- JetBrainsMono Nerd Font is the shared font

## Gitignored

- `zsh/.zsh/plugins` — zsh plugins installed at runtime
- `tmux/.config/tmux/plugins` — tmux plugins installed via TPM
