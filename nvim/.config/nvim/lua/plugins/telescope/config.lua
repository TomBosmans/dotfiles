return function()
  local telescope = require("telescope")

  local lsp_theme = {
    results_title = "",
    preview_title = "",
    theme = "cursor",
    layout_config = { height = 0.3, width = 0.99 },
    border = true,
    show_line = false,
  }

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
        },
        n = {
          ["<C-h>"] = "which_key",
        },
      },
    },

    pickers = {
      lsp_references = lsp_theme,
      lsp_definitions = lsp_theme,
      lsp_implementations = lsp_theme,
      lsp_type_definitions = lsp_theme,
      lsp_code_actions = { theme = "cursor" },
      lsp_document_symbols = {},
      lsp_workspace_symbols = {},
      git_branches = { theme = "dropdown", previewer = false },

      buffers = {
        show_all_buffers = true,
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          },
          n = {
            ["<c-d>"] = "delete_buffer",
          },
        },
      },
    },

    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      ["ui-select"] = {
        require("telescope.themes").get_cursor({}),
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
end
