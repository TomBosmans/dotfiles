return function()
  local client_names = {}
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    table.insert(client_names, client.name)
  end
  return table.concat(client_names, ",")
end
