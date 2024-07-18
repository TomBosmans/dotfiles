require("which-key").register({
  ["<space>g"] = {
    name = "goto",
    d = { ":Telescope lsp_definitions <CR>", "lsp definition" },
    i = { ":Telescope lsp_implementations <CR>", "lsp implementations" },
    r = { ":Telescope lsp_references <CR>", "lsp references" },
  },
})
