local M = {}

local servers = {
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

function M.setup()
  -- TODO
end

function M.on_attach(client, bufnr)
  -- nvim-navic
  if caps.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end
end

return M
