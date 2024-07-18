return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
  },
  config = require("plugins/treesitter/config"),
  build = ":TSUpdate",
  event = "BufReadPost",
}
