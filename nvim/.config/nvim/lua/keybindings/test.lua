require("which-key").register({
  ["<leader>x"] = {
    name = "Tests",
    a = { ":lua require('neotest').run.attach() <CR>", "attach" },
    n = { ":lua require('neotest').run.run() <CR>", "run nearest" },
    f = { ":lua require('neotest').run.run(vim.fn.expand('%')) <CR>", "run file" },
    d = { ":lua require('neotest').run.run({strategy = 'dap'}) <CR>", "debug" },
    o = { ":lua require('neotest').output.open() <CR>", "output" },
    q = { ":lua require('neotest').run.stop() <CR>", "stop" },
    l = { ":lua require('neotest').run.run_last()", "run latest" },
    s = {
      name = "Summary",
      o = { ":lua require('neotest').summary.open() <CR>", "open" },
      c = { ":lua require('neotest').summary.close() <CR>", "close" },
    },
  },
})
