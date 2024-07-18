return {
  "lewis6991/gitsigns.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  opts = require("plugins.gitsigns.options"),
  event = { "BufReadPost" },
}
