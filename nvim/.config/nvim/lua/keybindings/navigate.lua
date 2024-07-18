require("which-key").register({
  ["]g"] = { ":lua require('gitsigns').next_hunk({navigation_message = false}) <CR>", "goto next git hunk" },
  ["[g"] = { ":lua require('gitsigns').prev_hunk({navigation_message = false}) <CR>", "goto prev git hunk" },
  ["]d"] = { ":lua vim.diagnostic.goto_next() <CR>", "goto next diagnostic" },
  ["[d"] = { ":lua vim.diagnostic.goto_prev() <CR>", "goto prev diagnostic" },
})
