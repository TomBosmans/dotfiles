local keys = {}

for key, _ in pairs(require("lsp.servers")) do
  table.insert(keys, key)
end

return keys
