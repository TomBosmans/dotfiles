require("which-key").add({
  { "<leader>c", group = "copy", icon = "" },
  { "<leader>cr", ":let @+ = expand('%')<CR>", desc = "relative path", icon = ""},
  { "<leader>ca", ":let @+ = expand('%:p')<CR>", desc = "absolute path", icon = ""},
  { "<leader>cn", ":let @+ = expand('%:t')<CR>", desc = "file name", icon = ""},
})
