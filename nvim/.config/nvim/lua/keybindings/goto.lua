require("which-key").add({
  { "<localleader>g", group = "goto" },
  { "<localleader>gd", ":Telescope lsp_definitions <CR>", desc = "definition" },
  { "<localleader>gi", ":Telescope lsp_implementations <CR>", desc = "implementation" },
  { "<localleader>gr", ":Telescope lsp_references <CR>", desc = "reference" },
})
