require("which-key").add({
  { "]", group = "Next" },
  { "[", group = "Previous" },

  {"]g", ":lua require('gitsigns').next_hunk({navigation_message = false}) <CR>", desc = "goto next git hunk" },
  {"[g", ":lua require('gitsigns').prev_hunk({navigation_message = false}) <CR>", desc = "goto prev git hunk" },

  {"]d", ":lua vim.diagnostic.goto_next() <CR>", desc = "goto next diagnostic" },
  {"[d", ":lua vim.diagnostic.goto_prev() <CR>", desc = "goto prev diagnostic" },
})
