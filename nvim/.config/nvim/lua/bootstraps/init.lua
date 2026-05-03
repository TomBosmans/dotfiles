local require_files_in_dir = require("utils/require_files_in_dir")
local get_dir_path = require("utils/get_dir_path")

local dir_path = get_dir_path()
require_files_in_dir(dir_path)
