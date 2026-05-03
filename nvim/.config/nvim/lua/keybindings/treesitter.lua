require("which-key").add({
  { "<leader>T", group = "Treesitter", icon = "" },
  { "<leader>Tp", ":TSPlaygroundToggle <CR>", desc = "toggle playground" },
  { "<leader>Ti", ":TSInstall ", desc = "install", silent = false, icon = "󰇚" },
  { "<leader>Tu", ":TSUpdate <CR>", desc = "update", icon = "󰚰" },
  { "<leader>Tc", ":TSContextToggle <CR>", desc = "toggle context", },
})
