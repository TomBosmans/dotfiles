require("which-key").register({
  ["<leader>g"] = {
    name = "Git",
    a = { ":Git <CR>", "manage" },
    l = { ":Git log <CR>", "log" },
    p = { ":Git pull <CR>", "pull" },
    P = { ":Git push origin HEAD --force-with-lease <CR>", "push" },
    f = { ":Git fetch <CR>", "fetch" },
    r = { ":Git rebase --interactive ", "rebase", silent = false },
    R = { "::Git reset HEAD~ <CR>", "reset" },
    c = { ":Telescope git_branches <CR>", "branches" },
    C = { ":Telescope git_commits <CR>", "commits" },
    h = {
      name = "Hunk",
      r = { ":Gitsigns reset_hunk<CR>", "reset hunk" },
      R = { ":Gitsigns reset_buffer<CR>", "reset buffer" },
      b = { ":lua require('gitsigns').blame_line({full=true})<CR>", "blame" },
      p = { ":Gitsigns preview_hunk<CR>", "preview" },
      l = { ":Gitsigns toggle_linehl<CR>", "toggle linehl" },
    },
    d = {
      name = "Diffview",
      o = { ":DiffviewOpen <CR>", "open" },
      h = { ":DiffviewFileHistory % <CR>", "history" },
      c = { ":DiffviewClose <CR>", "close" },
    },
  },
})
