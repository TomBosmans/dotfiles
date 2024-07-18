return {
  "nvim-neo-tree/neo-tree.nvim",
  config = require("plugins/neo-tree/config"),
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "s1n7ax/nvim-window-picker",
      version = "*",
      opts = {
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
        other_win_hl_color = "#54AEFF",
      },
    },
  },
}
