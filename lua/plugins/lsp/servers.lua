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
  -- null-ls
-- TODO: enable null-ls
--  require("plugins.lsp.null-ls").setup(opts)

  -- Installer
  require("plugins.lsp.installer").setup(servers, opts)

  -- Inlay hints
  -- require("config.lsp.inlay-hints").setup()
end


function M.on_attach(client, bufnr)
  local caps = client.server_capabilities

  -- nvim-navic
  if caps.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end
end

local opts = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}


return M
