require("which-key").register({
  ["t"] = {
    name = "Tabs",
    n = { ":tabnew <CR>", "new" },
    c = { ":tabclose <CR>", "close" },
    s = { ":tab split <CR>", "split" },
    ["1"] = { "1gt<CR>", "goto tab 1" },
    ["2"] = { "2gt<CR>", "goto tab 2" },
    ["3"] = { "3gt<CR>", "goto tab 3" },
    ["4"] = { "4gt<CR>", "goto tab 4" },
    ["5"] = { "5gt<CR>", "goto tab 5" },
    ["6"] = { "6gt<CR>", "goto tab 6" },
    ["7"] = { "7gt<CR>", "goto tab 7" },
    ["8"] = { "8gt<CR>", "goto tab 8" },
    ["9"] = { "9gt<CR>", "goto tab 9" },
  },
})
