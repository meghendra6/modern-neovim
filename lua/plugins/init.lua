return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  { "nacro90/numb.nvim",   event = "BufReadPre",           config = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = true,
  },

  -- User interface
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup {
        input = { relative = "editor" },
        select = {
          backend = { "telescope", "fzf", "builtin" },
        },
      }
    end,
    enabled = true,
  },
  {
    "ray-x/guihua.lua",
    run = "cd lua/fzy && make",
    enabled = false,
  },
  {
    "doums/suit.nvim",
    config = function()
      require("suit").setup {}
    end,
    enabled = false,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = true,
    config = { default = true }, -- same as config = true
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
  },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = {
      integrations = { diffview = true },
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
    },
  },
  {
    "monaqa/dial.nvim",
    event = "BufReadPre",
    config = function()
      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
    end,
  },

  -- WhichKey
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    event = "VeryLazy",
    config = function()
      require("config.whichkey").setup()
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPre",
    config = function()
      require("config.lualine").setup()
    end,
    dependencies = { "nvim-web-devicons" },
  },

  -- Better icons
  {
    "nvim-tree/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  },

  -- Buffer line
  {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    config = function()
      require("config.bufferline").setup()
    end,
  },

  -- Better Netrw
  {
    "tpope/vim-vinegar",
    event = "VeryLazy",
  },

  -- nvim-tree
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("config.nvimtree").setup()
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    config = function()
      require("config.treesitter").setup()
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
      { "windwp/nvim-ts-autotag",                      event = "InsertEnter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
      { "p00f/nvim-ts-rainbow",                        event = "BufReadPre" },
      { "RRethy/nvim-treesitter-textsubjects",         event = "BufReadPre" },
      { "nvim-treesitter/playground",                  cmd = { "TSPlaygroundToggle" } },
      -- {
      --   "lewis6991/spellsitter.nvim",
      --   config = function()
      --     require("spellsitter").setup()
      --   end,
      -- },
      { "nvim-treesitter/nvim-treesitter-context",     event = "BufReadPre",          enabled = false },
      { "mfussenegger/nvim-treehopper",                module = { "tsht" },           enabled = false },
      {
        "m-demare/hlargs.nvim",
        config = function()
          require("config.hlargs").setup()
        end,
        enabled = true,
      },
      {
        "AckslD/nvim-FeMaco.lua",
        config = function()
          require("femaco").setup()
        end,
        ft = { "markdown" },
        cmd = { "Femaco" },
        module = { "femaco_edit" },
        enabled = false,
      },
      -- { "yioneko/nvim-yati", event = "BufReadPre" },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      { "nvim-telescope/telescope-project.nvim" },
      { "cljoly/telescope-repo.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = "tami5/sqlite.lua",
      },
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("config.project").setup()
        end,
      },
      { "nvim-telescope/telescope-dap.nvim" },
      {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
          { "tami5/sqlite.lua", module = "sqlite" },
        },
      },
      { "nvim-telescope/telescope-smart-history.nvim" },
      {
        "alpha2phi/telescope-arecibo.nvim",
      },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "dhruvmanila/telescope-bookmarks.nvim" },
      { "nvim-telescope/telescope-github.nvim" },
      { "jvgrootveld/telescope-zoxide" },
      { "Zane-/cder.nvim" },
      "nvim-telescope/telescope-symbols.nvim",
      -- "nvim-telescope/telescope-ui-select.nvim",
    },
    event = "VimEnter",
    config = function()
      require("config.telescope").setup()
    end,
  },

  -- trouble.nvim
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    module = { "trouble.providers.telescope" },
    config = function()
      require("trouble").setup {
        use_diagnostic_signs = true,
      }
    end,
  },

  -- Sidebar
  {
    "liuchengxu/vista.vim",
    cmd = { "Vista" },
    config = function()
      vim.g.vista_default_executive = "nvim_lsp"
    end,
    enabled = false,
  },
  {
    "sidebar-nvim/sidebar.nvim",
    event = "VimEnter",
    cmd = { "SidebarNvimToggle" },
    config = function()
      require("sidebar-nvim").setup { open = false }
    end,
  },
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    config = function()
      require("aerial").setup {
        backends = { "lsp", "treesitter" },
        on_attach = function(bufnr)
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
    end,
    module = { "aerial", "telescope._extensions.aerial" },
    cmd = { "AerialToggle" },
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    module = {
      "harpoon",
      "harpoon.cmd-ui",
      "harpoon.mark",
      "harpoon.ui",
      "harpoon.term",
      "telescope._extensions.harpoon",
    },
    config = function()
      require("config.harpoon").setup()
    end,
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    module = { "refactoring", "telescope" },
    keys = { [[<leader>r]] },
    config = function()
      require("config.refactoring").setup()
    end,
  },
  { "python-rope/ropevim", build = "pip3 install ropevim", enabled = false },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    enabled = true,
    config = function()
      require("bqf").setup()
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPre",
    enabled = false,
    config = function()
      require("hlslens").setup()
    end,
  },
  { "nvim-pack/nvim-spectre", module = "spectre", keys = { "<leader>s" } },
  {
    "https://gitlab.com/yorickpeterse/nvim-pqf",
    event = "BufReadPre",
    config = function()
      require("pqf").setup()
    end,
  },
  {
    "andrewferrier/debugprint.nvim",
    module = { "debugprint" },
    keys = { "g?p", "g?P", "g?v", "g?V", "g?o", "g?O" },
    cmd = { "DeleteDebugPrints" },
    config = function()
      require("debugprint").setup()
    end,
  },

  -- Git
  {
    "TimUntersberger/neogit",
    event = "VeryLazy",
    cmd = "Neogit",
    module = { "neogit" },
    config = function()
      require("config.neogit").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    cmd = "Neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    opt = true,
    cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
    dependencies = {
      "tpope/vim-rhubarb",
      "idanarye/vim-merginal",
      --[[ "rhysd/committia.vim", ]]
    },
  },
  {
    "rbong/vim-flog",
    event = "VeryLazy",
    cmd = { "Flog", "Flogsplit", "Floggit" },
    wants = { "vim-fugitive" },
  },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    module = "gitlinker",
    config = function()
      require("gitlinker").setup { mappings = nil }
    end,
  },
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
    enabled = true,
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    cmd = {
      "GitConflictChooseTheirs",
      "GitConflictChooseOurs",
      "GitConflictChooseBoth",
      "GitConflictChooseNone",
      "GitConflictNextConflict",
      "GitConflictPrevConflict",
      "GitConflictListQf",
    },
    config = function()
      require("git-conflict").setup()
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    cmd = { "GitBlameToggle" },
  },
  {
    "knsh14/vim-github-link",
    event = "VeryLazy",
    cmd = { "GetCommitLink", "GetCurrentBranchLink", "GetCurrentCommitLink" },
  },
  { "segeljakt/vim-silicon",  cmd = { "Silicon" } },
  {
    "mattn/vim-gist",
    event = "VeryLazy",
    opt = true,
    dependencies = { "mattn/webapi-vim" },
    cmd = { "Gist" },
    config = function()
      vim.g.gist_open_browser_after_post = 1
    end,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    keys = { [[<C-\>]] },
    cmd = { "ToggleTerm", "TermExec" },
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require("config.toggleterm").setup()
    end,
  },

  -- Motions
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    enabled = false,
  },
  {
    "wellle/targets.vim",
    event = "CursorMoved",
    enabled = true,
  },
  {
    "unblevable/quick-scope",
    event = "VeryLazy",
    keys = { "F", "f", "T", "t" },
    -- config = function()
    --   vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    -- end,
    enabled = true,
  },
  {
    "jinh0/eyeliner.nvim",
    keys = { "F", "f", "T", "t" },
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
    enabled = false,
  },
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    fn = { "<Plug>WordMotion_w" },
  },

  -- Buffer
  {
    "kazhala/close-buffers.nvim",
    event = "VeryLazy",
    cmd = { "BDelete", "BWipeout" },
  },
  {
    "matbme/JABS.nvim",
    event = "VeryLazy",
    cmd = "JABSOpen",
    config = function()
      require("config.jabs").setup()
    end,
    enabled = true,
  },
  {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    config = function()
      require("marks").setup {}
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    opt = true,
    event = "InsertEnter",
    module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
    config = function()
      require("config.autopairs").setup()
    end,
  },

  -- Jumps
  -- change default key 's' to '<leader>s' in /Users/scottlee/.config/modern-neovim/share/nvim/lazy/leap.nvim/lua/leap
  {
    "ggandor/leap.nvim",
    keys = { "<C-s>", "S" },
    config = function()
      local leap = require "leap"
      leap.add_default_mappings()
    end,
    disable = false,
  },
  {
    "abecodes/tabout.nvim",
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup {
        completion = false,
        ignore_beginning = true,
      }
    end,
  },
  {
    "AndrewRadev/splitjoin.vim",
    keys = { "gS", "gJ" },
    enabled = true,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opt = true,
    config = function()
      require("config.cmp").setup()
    end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      { "hrsh7th/cmp-nvim-lsp", module = { "cmp_nvim_lsp" } },
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- "lukas-reineke/cmp-rg",
      "davidsierradz/cmp-conventionalcommits",
      { "onsails/lspkind-nvim", module = { "lspkind" } },
      -- "hrsh7th/cmp-calc",
      -- "f3fora/cmp-spell",
      -- "hrsh7th/cmp-emoji",
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("config.snip").setup()
        end,
        module = { "luasnip" },
      },
      "rafamadriz/friendly-snippets",
      "honza/vim-snippets",
      { "tzachar/cmp-tabnine", build = "./install.sh", enabled = false },
    },
  },

  -- Code documentation
  {
    "danymat/neogen",
    config = function()
      require("config.neogen").setup()
    end,
    cmd = { "Neogen" },
    module = "neogen",
    enabled = true,
  },

  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    config = function()
      require("config.doge").setup()
    end,
    cmd = { "DogeGenerate", "DogeCreateDocStandard" },
    enabled = true,
  },

  -- Rust
  {
    "simrat39/rust-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
    opt = true,
    module = "rust-tools",
    ft = { "rust" },
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
    disable = false,
  },

  -- Tags
  {
    "ludovicchabant/vim-gutentags",
    event = "VeryLazy",
  },
  {
    "lyuts/vim-rtags",
    event = "VeryLazy",
  },

  -- Renamer
  {
    "filipdutescu/renamer.nvim",
    event = "VeryLazy",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("renamer").setup()
    end,
  },

  -- yank to system clipboard on remote environment
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
      require("osc52").setup {}
      vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
      vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
      vim.keymap.set("x", "<leader>c", require("osc52").copy_visual)
    end,
    enabled = true,
  },
}
