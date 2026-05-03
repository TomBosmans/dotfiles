# INFO: Opens tmux on startup when:
#  - tmux exists on the system
#  - we're in an interactive shell, and
#  - tmux doesn't try to run within itself
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi
