return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPre",
  config = true,
  opts = {
    render = 'virtual',
    virtual_symbol = '■',
  },
}
