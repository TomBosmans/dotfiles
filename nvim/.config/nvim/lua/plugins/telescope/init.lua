return {
  "nvim-telescope/telescope.nvim",
  event = { "VeryLazy" },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = require("plugins/telescope/config"),
}
