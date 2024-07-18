return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = require("plugins.mason.options"),
    event = { "BufReadPost" },
    cmd = { "Mason" },
  },
}
