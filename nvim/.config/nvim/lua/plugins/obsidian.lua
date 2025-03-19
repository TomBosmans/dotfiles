return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = {
    "BufReadPre " ..vim.fn.expand "~" .. "/Documents/notes/*.md",
    "BufNewFile " ..vim.fn.expand "~" .. "/Documents/notes/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/notes",
      },
    },
    completion = {
      blink = true,
      min_chars = 2,
    },
    ui = {
      enable = false
    }
  },
  -- this is needed for ui, but looks wrong
  -- init = function()
  --   vim.opt_local.conceallevel = 1
  -- end,
}
