return function()
  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

  require("neo-tree").setup({
    source_selector = {
      winbar = false,
      statusline = false
    },
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["<cr>"] = "open_with_window_picker",
        ["<C-x>"] = "split_with_window_picker",
        ["<C-v>"] = "vsplit_with_window_picker",
        ["<C-t>"] = "open_tabnew",
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local content = node.path:gsub(state.path:gsub("[%-_^$.*+-?]", "%%%0"), ""):sub(2)
          vim.fn.setreg('"', content)
          vim.fn.setreg("1", content)
          vim.fn.setreg("+", content)
        end,
      },
    },
  })
end
