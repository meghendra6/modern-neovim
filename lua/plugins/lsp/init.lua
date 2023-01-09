local M = {}

M.setup {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
      {
        "williamboman/mason.nvim",
        config = true,
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
      },
      { "williamboman/mason-lspconfig.nvim", config = { automatic_installation = true } },
      -- "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("plugins.lsp.servers").setup()
    end,
  },
}

function M.on_attach(client, bufnr)
  -- nvim-navic
  if caps.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end
end

return M
