return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    dim_inactive = {
      enabled = true,
    },
    -- Override blink colors until color issues fixed in catppuccin.
    custom_highlights = function(colors)
      return {
        BlinkCmpKind = { fg = colors.blue },
        BlinkCmpMenu = { fg = colors.text },
        BlinkCmpMenuBorder = { fg = colors.blue },
        BlinkCmpDocBorder = { fg = colors.blue },
        BlinkCmpSignatureHelpActiveParameter = { fg = colors.mauve },
        BlinkCmpSignatureHelpBorder = { fg = colors.blue },
      }
    end,
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
