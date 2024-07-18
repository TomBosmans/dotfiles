require("which-key").register({
  ["<leader>F"] = {
    name = "Formatter",
    i = { ":NullLsInstall ", "install", silent = false },
    u = { ":NullLsUninstall ", "uninstall", silent = false },
    I = { ":NullLsInfo <CR>", "info" },
    l = { ":NullLsLog <CR>", "log" },
  },
})
