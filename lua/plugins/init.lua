return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  { "nacro90/numb.nvim", event = "BufReadPre", config = true },
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
    disable = false,
  },
  {
    "ray-x/guihua.lua",
    run = "cd lua/fzy && make",
    disable = true,
  },
  {
    "doums/suit.nvim",
    config = function()
      require("suit").setup {}
    end,
    disable = true,
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
  {
    "SmiteshP/nvim-navic",
    config = function()
        require("nvim-navic").setup {}
    end,
    module = { "nvim-navic" },
    dependencies = "neovim/nvim-lspconfig"
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
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require("config.treesitter").setup()
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
      { "windwp/nvim-ts-autotag", event = "InsertEnter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
      { "p00f/nvim-ts-rainbow", event = "BufReadPre" },
      { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
      { "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
      -- {
      --   "lewis6991/spellsitter.nvim",
      --   config = function()
      --     require("spellsitter").setup()
      --   end,
      -- },
      { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre", disable = true },
      { "mfussenegger/nvim-treehopper", module = { "tsht" }, disable = true },
      {
        "m-demare/hlargs.nvim",
        config = function()
          require("config.hlargs").setup()
        end,
        disable = false,
      },
      {
        "AckslD/nvim-FeMaco.lua",
        config = function()
          require("femaco").setup()
        end,
        ft = { "markdown" },
        cmd = { "Femaco" },
        module = { "femaco_edit" },
        disable = true,
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
    event = "VeryLazy",
    cmd = { "Vista" },
    config = function()
      vim.g.vista_default_executive = "nvim_lsp"
    end,
    disable = true,
  },
  {
    "sidebar-nvim/sidebar.nvim",
    event = "VeryLazy",
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
        backends = { "treesitter", "lsp" },
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
  { "python-rope/ropevim", build = "pip3 install ropevim", disable = true },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    disable = false,
    config = function()
      require("bqf").setup()
    end,
  },
  { "kevinhwang91/nvim-hlslens",
    event = "BufReadPre",
    disable = true,
    config = function()
      require('hlslens').setup()
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
    disable = false,
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
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    cmd = { "GitBlameToggle" }
  },
  {
    "tanvirtin/vgit.nvim",
    config = function()
      require("vgit").setup()
    end,
    cmd = { "VGit" },
  },
  {
    "knsh14/vim-github-link",
    cmd = { "GetCommitLink",
      "GetCurrentBranchLink",
      "GetCurrentCommitLink" }
  },
  {"segeljakt/vim-silicon",
    cmd = { "Silicon" }
  },
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

}
