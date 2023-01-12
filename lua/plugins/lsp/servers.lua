local M = {}

local servers = {
  clangd = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = {
          command = "cargo clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins", "MiniTest" },
          -- disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          -- library = vim.api.nvim_get_runtime_file("", true),
          maxPreload = 2000,
          preloadFileSize = 50000,
        },
        completion = { callSnippet = "Replace" },
        telemetry = { enable = false },
        hint = {
          enable = false,
        },
      },
    },
  },
  tsserver = {
    disable_formatting = false,
  },
  dockerls = {},
}

function M.on_attach(client, bufnr)
  local caps = client.server_capabilities

  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  if caps.completionProvider then
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  end

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  if caps.documentFormattingProvider then
    vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
  end

  -- Configure key mappings
  require("plugins.lsp.keymaps").setup(client, bufnr)

  -- Configure highlighting
  require("plugins.lsp.highlighter").setup(client, bufnr)

  -- Configure formatting
  require("plugins.lsp.null-ls.formatters").setup(client, bufnr)

  -- tagfunc
  -- if caps.definitionProvider then
  --   vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
  -- end
     vim.bo[bufnr].tagfunc = ""

  -- sqls
  if client.name == "sqls" then
    require("sqls").on_attach(client, bufnr)
  end

  -- Configure for jdtls
  if client.name == "jdt.ls" then
    require("jdtls").setup_dap { hotcodereplace = "auto" }
    require("jdtls.dap").setup_dap_main_class_configs()
    vim.lsp.codelens.refresh()
  end

  -- nvim-navic
  if caps.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end

  -- if client.name ~= "null-ls" then
  --   -- inlay-hints
  --   local ih = require "inlay-hints"
  --   ih.on_attach(client, bufnr)
  --
  --   -- semantic highlighting
  --   if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
  --     local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
  --     vim.api.nvim_create_autocmd("TextChanged", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.semantic_tokens_full()
  --       end,
  --     })
  --     -- fire it first time on load as well
  --     vim.lsp.buf.semantic_tokens_full()
  --   end
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- for nvim-cmp

local opts = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

-- Setup LSP handlers
require("plugins.lsp.handlers").setup()

function M.setup()
  -- null-ls
  require("plugins.lsp.null-ls").setup(opts)

  -- Installer
  require("plugins.lsp.installer").setup(servers, opts)

  -- Inlay hints
  -- require("plugins.lsp.inlay-hints").setup()
end

local diagnostics_active = true

function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.remove_unused_imports()
  vim.diagnostic.setqflist { severity = vim.diagnostic.severity.WARN }
  vim.cmd "packadd cfilter"
  vim.cmd "Cfilter /main/"
  vim.cmd "Cfilter /The import/"
  vim.cmd "cdo normal dd"
  vim.cmd "cclose"
  vim.cmd "wa"
end

return M
