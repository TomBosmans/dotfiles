return {
  ruby_lsp = {
    init_options = {
      formatter = 'standard',
      linters = { 'standard' },
    },
  },
  markdown_oxide = {},
  prismals = {},
  cssls = {},
  jsonls = {},
  eslint = {},
  biome = {},
  vtsls = {
    settings = {
      vtsls = {
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
            entriesLimit = 1000,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = "always",
        tsserver = {
          maxTsServerMemory = 8192,
        },
      },
    },
    initializationOptions = {
      documentFormatting = false,
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
        format = {
          enable = true,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}
