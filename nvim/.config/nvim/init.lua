vim.g.mapleader = ","

require("core")
require("bootstraps")

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "catppuccin" } },
  ui = { border = "rounded" }
})

require("keybindings")
