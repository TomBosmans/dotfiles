require("which-key").add({
  { "<leader>f", group = "find" },
  { "<leader>ff", ":Telescope find_files <CR>", desc = "files" },
  { "<leader>fg", ":Telescope git_files <CR>", desc = "git files" },
  { "<leader>fb", ":Telescope buffers <CR>", desc = "buffers" },
  { "<leader>fa", ":Telescope live_grep <CR>", desc = "grep" },
})
