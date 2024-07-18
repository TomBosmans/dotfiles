require("which-key").register({
  ["<C-w>"] = {
    name = "Window",
    ["h"] = { ":NvimTmuxNavigateLeft<CR>", "window left" },
    ["l"] = { ":NvimTmuxNavigateRight<CR>", "window right" },
    ["j"] = { ":NvimTmuxNavigateDown<CR>", "window down" },
    ["k"] = { ":NvimTmuxNavigateUp<CR>", "window up" },
  }
})
