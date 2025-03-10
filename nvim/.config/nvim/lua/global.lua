return {
  is_windows = vim.fn.has("win32") == 1,
  is_unix = vim.fn.has("unix") == 1,
  is_wsl = vim.fn.has("wsl") == 1,
}
