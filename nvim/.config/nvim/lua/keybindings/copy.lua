require("which-key").register({
  ["<leader>c"] = {
    name = "Copy",
    r = { ":let @+ = expand('%')<CR>", "relative path" },
    a = { ":let @+ = expand('%:p')<CR>", "absolute path" },
    n = { ":let @+ = expand('%:t')<CR>", "file name" },
  },
})
