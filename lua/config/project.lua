local M = {}

function M.setup()
  require("project_nvim").setup {
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git" ,"Makefile", "package.json", "CMakeList.txt"},
    ignore_lsp = { "null-ls" },
    -- silent_chdir = false,
  }
end

return M
