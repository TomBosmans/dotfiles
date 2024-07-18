return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function()
    local options = require("plugins.catppuccin.options")
    require("catppuccin").setup(options)

    vim.cmd.colorscheme("catppuccin")
  end,
}
