require("which-key").register({
  ["<leader>T"] = {
    name = "Treesitter",
    p = { ":TSPlaygroundToggle <CR>", "toggle playground" },
    i = { ":TSInstall ", "install", silent = false },
    u = { ":TSUpdate <CR>", "update" },
    h = { ":TSModuleInfo <CR>", "help" },
    c = { ":TSContextToggle <CR>", "toggle context" },
  },
})
