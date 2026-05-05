# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each folder is a stow package that can be installed independently.

| Folder       | Application                                                        | Description                                                                 |
| ------------ | ------------------------------------------------------------------ | --------------------------------------------------------------------------- |
| `bat/`       | [bat](https://github.com/sharkdp/bat)                              | Syntax-highlighted cat replacement with Catppuccin themes ([details](bat/.config/bat/README.md)) |
| `dunst/`     | [Dunst](https://dunst-project.org)                                 | Notification daemon configuration                                           |
| `git/`       | [Git](https://git-scm.com)                                         | Global gitconfig and gitignore                                              |
| `i3/`        | [i3](https://i3wm.org)                                             | Tiling window manager configuration                                         |
| `kitty/`     | [Kitty](https://sw.kovidgoez.net/kitty/)                           | Terminal emulator with Catppuccin Macchiato color scheme                    |
| `nvim/`      | [Neovim](https://neovim.io)                                        | Full configuration with vim.pack, LSP, treesitter, telescope, and more ([details](nvim/.config/nvim/README.md)) |
| `opencode/`  | [OpenCode](https://opencode.ai)                                    | AI coding assistant configuration with MCP server integrations ([details](opencode/.config/opencode/README.md)) |
| `picom/`     | [picom](https://github.com/yshui/picom)                            | Compositor for X11                                                          |
| `polybar/`   | [Polybar](https://github.com/polybar/polybar)                      | Status bar with Catppuccin theme and Spotify integration                    |
| `rofi/`      | [Rofi](https://github.com/davatorium/rofi)                         | Application launcher configuration                                          |
| `tmux/`      | [tmux](https://github.com/tmux/tmux)                               | Terminal multiplexer configuration ([details](tmux/.config/tmux/README.md)) |
| `zathura/`   | [Zathura](https://pwmt.org/projects/zathura/)                      | Document viewer configuration                                               |
| `zsh/`       | [Zsh](https://www.zsh.org)                                         | Shell configuration with aliases, completions, fzf, and syntax highlighting |

## Dependencies

All configs use [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) as the default font.

## Usage

Install a single package:

```sh
stow -t ~ <folder>
```

Install all packages:

```sh
stow -t ~ */
```

## Setup

For a full system setup (install dependencies + stow configs), run the OS-specific script:

```sh
# macOS
./scripts/macos.sh

# Debian/Ubuntu (devcontainers)
./scripts/debian.sh
```
