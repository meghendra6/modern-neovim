return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function(plugin)
      require("plugins.lsp.servers").setup(plugin)
    end,
    dependencies = {
      -- { "lvimuser/lsp-inlayhints.nvim", branch = "readme" },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "jayp0521/mason-null-ls.nvim" },
      "folke/neodev.nvim",
      "RRethy/vim-illuminate",
      "jose-elias-alvarez/null-ls.nvim",
      {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup {}
        end,
      },
      { "b0o/schemastore.nvim", module = { "schemastore" } },
      { "jose-elias-alvarez/typescript.nvim", module = { "typescript" } },
      {
        "SmiteshP/nvim-navic",
        config = function()
          require("nvim-navic").setup {}
        end,
        module = { "nvim-navic" },
      },
      {
        "simrat39/inlay-hints.nvim",
        config = function()
          require("inlay-hints").setup()
        end,
      },
      {
        "zbirenbaum/neodim",
        event = "LspAttach",
        config = function()
          require("config.neodim").setup()
        end,
        enabled = false,
      },
      {
        "theHamsta/nvim-semantic-tokens",
        config = function()
          require("config.semantictokens").setup()
        end,
        enabeld = true,
      },
      {
        "David-Kunz/markid",
        enabled = false,
      },
      {
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline" },
        config = function()
          require("symbols-outline").setup()
        end,
        enabled = false,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    ensure_installed = {
      "stylua",
      "ruff",
      "debugpy",
      "codelldb",
    },
    config = function(plugin)
      require("mason").setup()
      local mr = require "mason-registry"
      for _, tool in ipairs(plugin.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local nls = require "null-ls"
      nls.setup {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.ruff.with { extra_args = { "--max-line-length=180" } },
        },
      }
    end,
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    enabled = false,
  },
}
