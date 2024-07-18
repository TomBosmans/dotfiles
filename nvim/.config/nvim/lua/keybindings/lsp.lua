require("which-key").register({
  ["<space>f"] = { ":lua vim.lsp.buf.format { async = true } <CR>", "format" },
  ["<space>r"] = { ":lua vim.lsp.buf.rename() <CR>", "rename" },
  ["<space>e"] = { ":lua vim.diagnostic.open_float() <CR>", "diagnostic" },
  ["<space>ca"] = { ":lua vim.lsp.buf.code_action() <CR>", "code actions" },
  K = { ":lua vim.lsp.buf.hover()<CR>", "hover" },
  ["<leader>l"] = {
    name = "Lsp",
    i = { ":LspInstall ", "install", silent = false },
    u = { ":LspUnstall ", "install", silent = false },
    I = { ":LspInfo <CR>", "info" },
    l = { ":LspLog <CR>", "log" },
    r = { ":LspRestart <CR>", "restart" },
    s = { ":LspStart <CR>", "start" },
    S = { ":LspStop <CR>", "stop" },
  },
})
