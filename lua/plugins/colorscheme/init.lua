return {
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          markdown = { colorscheme = "tokyonight" },
          help = { colorscheme = "tokyonight" },
        },
      }
    end,
  },
--  {
--    "folke/tokyonight.nvim",
--    lazy = false,
--    priority = 1000,
--    config = function()
--      local tokyonight = require "tokyonight"
--      tokyonight.setup { style = "moon" }
--      tokyonight.load()
--    end,
--  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup()
    end,
  },
  {
    "Everblush/everblush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everblush").setup({ nvim_tree = { contrast = true } })
    end,
  },
}
