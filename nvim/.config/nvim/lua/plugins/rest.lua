-- TODO: setup correctly so it works
return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  keys = {
    { "<leader>rr", ":Rest run<cr>",                                              desc = "run" },
    { "<leader>re", ":lua require('telescope').extensions.rest.select_env()<cr>", desc = "select env" },
    { "<leader>rl", ":Rest logs<cr>",                                             desc = "logs" },
    { "<leader>rc", ":Rest cookies<cr>",                                          desc = "cookies" },
    { "<leader>rs", ":Rest env show<cr>",                                         desc = "show env" },
  },
  init = function()
    vim.bo.formatexpr = ""
    vim.bo.formatprg = "jq"
    require("telescope").load_extension("rest")
  end
}
