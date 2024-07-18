require("which-key").register({
  ["<leader>f"] = {
    name = "Find",
    f = { ":Telescope find_files <CR>", "files" },
    g = { ":Telescope git_files <CR>", "git files" },
    b = { ":Telescope buffers <CR>", "find" },
    a = { ":Telescope live_grep <CR>", "grep" },
  },
})
