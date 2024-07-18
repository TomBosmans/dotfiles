return function()
  local cmp = require("cmp")
  local kinds = require("utils.kinds")

  cmp.setup({
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        local abbr = vim_item.abbr
        local icon = kinds[vim_item.kind]
        local kind = vim_item.kind
        local source = ({
          buffer = "Buffer",
          nvim_lsp = "LSP",
          luasnip = "LuaSnip",
          nvim_lua = "Lua",
          latex_symbols = "LaTeX",
        })[entry.source.name]

        vim_item.kind = string.format('%s %s', icon, kind)
        vim_item.menu = source
        vim_item.abbr = abbr
        return vim_item
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    }),
  })

  -- Setup up vim-dadbod
  cmp.setup.filetype({ "sql" }, {
    sources = {
      { name = "vim-dadbod-completion" },
      { name = "buffer" },
    },
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end
