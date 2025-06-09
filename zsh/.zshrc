bindkey -e
source "${HOME}/.zsh/utils.zsh"

add_plugin "Aloxaf/fzf-tab"
add_plugin "zsh-users/zsh-syntax-highlighting"

add_file "fzf.zsh"
add_file "alias.zsh"
add_file "exports.zsh"
add_file "prompt.zsh"
add_file "history.zsh"
add_file "completion.zsh"
add_file "tmux.zsh"

eval "$(zoxide init zsh)"

# add Flatpak apps to PATH
if [ -d "/var/lib/flatpak/exports/bin" ]; then
  PATH="/var/lib/flatpak/exports/bin:$PATH"
fi

if [ -d "$HOME/.local/share/flatpak/exports/bin" ]; then
   PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
fi

export PATH
