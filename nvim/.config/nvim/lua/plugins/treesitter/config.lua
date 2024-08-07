return function()
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
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end
