-- TODO: setup correctly so it works
return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  init = function()
    vim.bo.formatexpr = ""
    vim.bo.formatprg = "jq"
  end
}
