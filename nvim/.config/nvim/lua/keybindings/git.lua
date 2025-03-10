require("which-key").add({
  { "<leader>g", group = "Git" },
  { "<leader>ga", ":Git <CR>", desc = "manage" },
  { "<leader>gl", ":Git log <CR>", desc = "log" },
  { "<leader>gp", ":Git pull <CR>", desc = "pull" },
  { "<leader>gP", ":Git push origin HEAD --force-with-lease <CR>", desc = "push" },
  { "<leader>gf", ":Git fetch <CR>", desc = "fetch" },
  { "<leader>gr", ":Git rebase --interactive <CR>", desc = "rebase", silent = false },
  { "<leader>gR", ":Git reset HEAD~ <CR>", desc = "reset" },
  { "<leader>gb", ":Telescope git_branches <CR>", desc = "branches" },
  { "<leader>gc", ":Telescope git_commits <CR>", desc = "commits" },

  { "<leader>gh", group = "Hunk" },
  { "<leader>ghr", ":Gitsigns reset_hunk<CR>", desc = "reset hunk" },
  { "<leader>ghR", ":Gitsigns reset_buffer<CR>", desc = "reset buffer" },
  { "<leader>ghb", ":lua require('gitsigns').blame_line({full=true})<CR>", desc = "blame" },
  { "<leader>ghp", ":Gitsigns preview_hunk<CR>", desc = "preview" },
  { "<leader>ghl", ":Gitsigns toggle_linehl<CR>", desc = "toggle linehl" },

  { "<leader>gd", group = "Diffview" },
  { "<leader>gdo", ":DiffviewOpen <CR>", desc = "open" },
  { "<leader>gdh", ":DiffviewFileHistory % <CR>", desc = "history" },
  { "<leader>gdc", ":DiffviewClose <CR>", desc = "close" },
})
