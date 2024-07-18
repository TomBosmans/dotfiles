require("which-key").register({
  ["<leader>d"] = {
    name = "Treesitter",
    t = { ":Trouble <CR>", "toggle trouble" },
    r = { ":TroubleRefresh ", "refrsh trouble" },
  },
})
