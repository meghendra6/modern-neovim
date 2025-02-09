local M = {}

local nls_utils = require "plugins.lsp.null-ls.utils"

local method = require("null-ls").methods.CODE_ACTION

function M.list_registered(filetype)
  local registered_providers = nls_utils.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

return M
