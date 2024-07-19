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
