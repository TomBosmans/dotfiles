require("which-key").register({
  ["<leader>s"] = {
    name = "sort",
    s = { ":Sort <CR>", "asc", mode = "v" },
    S = { ":Sort! <CR>", "desc", mode = "v" }
  },
})
