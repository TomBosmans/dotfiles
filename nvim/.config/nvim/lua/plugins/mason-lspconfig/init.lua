return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = require("plugins/mason-lspconfig/config"),
    event = { "BufReadPost" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
  },
}
