return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = { "BufReadPost" },
    cmd = { "Mason" },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost" },
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim", "blink.cmp" },
    opts = {
      ensure_installed = require("lsp.ensure_installed"),
      handlers = {
        function(server_name)
          local server = require("lsp.servers")[server_name] or {}
          require("lspconfig")[server_name].setup({
            on_attach = require("lsp.keymaps").on_attach,
            settings = server.settings,
            capabilities = require("blink.cmp").get_lsp_capabilities(
              server.capabilities
            ),
          })
        end,
      }
    },
  }
}
