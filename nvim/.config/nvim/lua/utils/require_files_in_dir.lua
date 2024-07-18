return function(dir_path)
  -- Loop through all files in the directory
  for file in io.popen('ls "' .. dir_path .. '"'):lines() do
    -- Check if the file ends with ".lua" and is not the current file
    if file:sub(-4) == ".lua" and file ~= "init.lua" then
      -- Require the module
      dofile(dir_path .. "/" .. file)
    end
  end
end
