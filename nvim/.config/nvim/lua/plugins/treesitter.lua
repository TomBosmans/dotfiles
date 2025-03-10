return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
  },
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.install").compilers = { "clang", "gcc" }
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "javascript",
        "typescript",
        "html",
        "css",
        "tsx",
        "vim",
        "lua",
        "json",
        "jsonc",
        "yaml",
        "toml",
        "prisma",
        "markdown",
        "markdown_inline",
        "http",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
