#!/usr/bin/env zsh

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

zstyle ':fzf-tab:*' fzf-flags \
  --color=bg:#24273a,bg+:#363a4f,fg:#cad3f5,fg+:#cad3f5,hl:#ed8796,hl+:#ed8796,spinner:#f4dbd6,pointer:#f4dbd6,marker:#f4dbd6,prompt:#c6a0f6,header:#ed8796,info:#c6a0f6 \
  --bind=tab:accept

source <(fzf --zsh)
