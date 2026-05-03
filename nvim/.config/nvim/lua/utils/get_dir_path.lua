return function()
  local info = debug.getinfo(2, "S")
  local path = info.source:sub(2)
  return path:match("(.*/)")
end
