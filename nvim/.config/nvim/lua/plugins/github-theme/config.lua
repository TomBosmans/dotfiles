return function()
  require('github-theme').setup({
    options = {
      transparent = false,
      hide_end_of_buffer = true,
      hide_nc_statusline = true,
      styles = {
        comments = 'Italic',
        functions = 'NONE',
        keywords = 'Bold',
        variables = 'NONE',
      },
      darken = {
        floats = true,
        sidebars = {
          enable = true,
          list = { 'qf', 'vista_kind', 'terminal', 'packer' },
        },
      },
    },
  })

  vim.cmd('colorscheme github_dark')
end
