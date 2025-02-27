require("which-key").register({
  ["<space>t"] = { ":Neotree toggle <CR>", "reveal in tree" },
  ["<leader>t"] = {
    "tree",
    f = { ":Neotree reveal <CR>", "files" },
    b = { ":Neotree buffers <CR>", "buffers" },
    g = { ":Neotree git_status <CR>", "git status" },
  },
})
