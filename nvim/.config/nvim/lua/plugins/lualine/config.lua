local lsp = require("plugins.lualine.components.lsp")

return function()
  require("lualine").setup({
    options = {
      theme = "catppuccin",
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    winbar = {
      lualine_c = {
        {
          "filetype",
          icon_only = true,
          color = { bg = "#24273a" },
        },
        {
          "filename",
          padding = 0,
          file_status = true,
          newfile_status = false,
          color = { bg = "#24273a" },
          symbols = {
            modified = '󰳻',
            readonly = '',
            unnamed = '[No Name]',
            newfile = '[New]',
          }
        },
      },
    },
    inactive_winbar = {
      lualine_c = {
        {
          "filetype",
          icon_only = true,
        },
        {
          "filename",
          file_status = true,
          newfile_status = false,
          padding = 0,
          symbols = {
            modified = '󰳻',
            readonly = '',
            unnamed = '[No Name]',
            newfile = '[New]',
          }
        },
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { "branch" },
      lualine_c = { 'diff', 'diagnostics' },
      lualine_x = { lsp },
      lualine_y = { "progress" },
      lualine_z = { 'tabs' }
    },
    extensions = { "neo-tree" }
  })
end
