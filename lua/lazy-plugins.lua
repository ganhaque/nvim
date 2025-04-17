
-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- { "ganhaque/galana" },
  { dir = "~/.config/nvim/galana.nvim" },

  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  -- 'tpope/vim-sleuth',


  require 'plugins/lspconfig',
  require 'plugins/rustaceanvim',

  require 'plugins/mini',
  -- require 'plugins/snacks',
  -- require 'plugins/lint',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',

  -- -- NOTE: This is where your plugins related to LSP can be installed.
  -- --  The configuration is done below. Search for lspconfig to find it below.
  -- {
  --   -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   -- opts = {
  --   --   inlay_hints = {
  --   --     enabled = true,
  --   --   },
  --   -- },
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     -- Useful status updates for LSP
  --     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --     {
  --       'j-hui/fidget.nvim',
  --       opts = {}
  --     },
  --
  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --
  --
  --     -- {
  --     --   'lvimuser/lsp-inlayhints.nvim',
  --     --   opts = {}
  --     -- },
  --   },
  -- },

  require 'plugins/cmp',

  require 'plugins/gitsigns',

  require 'plugins/treesitter',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    -- opts = {
    --   options = {
    --     icons_enabled = false,
    --     theme = 'onedark',
    --     component_separators = '|',
    --     section_separators = '',
    --   },
    -- },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    -- opts = {
    --   indent = {
    --     char = "┊",
    --   },
    --   scope = {
    --     enabled = true,
    --     show_start = false,
    --     show_end = false,
    --     -- injected_languages = true,
    --   }
    -- },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim' },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    }
  },

  -- {
  --   -- Highlight, edit, and navigate code
  --   'nvim-treesitter/nvim-treesitter',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter-textobjects',
  --     'JoosepAlviste/nvim-ts-context-commentstring',
  --     'nvim-treesitter/playground',
  --   },
  --   build = ':TSUpdate',
  -- },
  --
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter"
  --   },
  --   keys = {
  --     { "<leader>tc", "<cmd>TSContextToggle<CR>", desc = "Toggle nvim-treesitter-context" },
  --     -- { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus nvimtree" },
  --   },
  -- },

  ------

  { 'kyazdani42/nvim-tree.lua',
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvimtree" },
      -- { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus nvimtree" },
    },
  },

  -- {
  --   "catppuccin/nvim",
  --   -- "ganhaque/catppuccin-old",
  --   name = "catppuccin",
  --   priority = 1000,
  -- },

  { "rktjmp/lush.nvim" },


  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        RRGGBB = true,
      }
    },
  },

  -- { 'kyazdani42/nvim-web-devicons' },

  -- {"m4xshen/smartcolumn.nvim", opts = {}},
  -- {
  --   'akinsho/bufferline.nvim',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   keys = {
  --     -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
  --     -- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  --     -- { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
  --     -- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
  --     -- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
  --     -- { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
  --     -- { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  --     -- { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
  --     -- { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  --   },
  -- },

  { "nvim-lua/plenary.nvim" },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    opts = {}
  },

  { "nvim-tree/nvim-web-devicons" },
  -- {
  --   "goolord/alpha-nvim",
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --     "nvim-lua/plenary.nvim"
  --   },
  --   -- lazy = false,
  -- },
  -- { "simrat39/symbols-outline.nvim", opts = {} },


  { "ojroques/nvim-bufdel" },
  { "phaazon/hop.nvim", opts = {} },
  -- {
  --   "echasnovski/mini.ai",
  --   -- keys = {
  --   --   { "a", mode = { "x", "o" } },
  --   --   { "i", mode = { "x", "o" } },
  --   -- },
  --   event = "VeryLazy",
  --   opts = function()
  --     local ai = require("mini.ai")
  --     return {
  --       n_lines = 500,
  --       custom_textobjects = {
  --         o = ai.gen_spec.treesitter({
  --           a = { "@block.outer", "@conditional.outer", "@loop.outer" },
  --           i = { "@block.inner", "@conditional.inner", "@loop.inner" },
  --         }, {}),
  --         f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
  --         c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
  --         t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
  --       },
  --     }
  --   end,
  --   config = function(_, opts)
  --     require("mini.ai").setup(opts)
  --     -- register all text objects with which-key
  --     -- require("lazyvim.util").on_load("which-key.nvim", function()
  --     --   ---@type table<string, string|table>
  --     local i = {
  --       [" "] = "Whitespace",
  --       ['"'] = 'Balanced "',
  --       ["'"] = "Balanced '",
  --       ["`"] = "Balanced `",
  --       ["("] = "Balanced (",
  --       [")"] = "Balanced ) including white-space",
  --       [">"] = "Balanced > including white-space",
  --       ["<lt>"] = "Balanced <",
  --       ["]"] = "Balanced ] including white-space",
  --       ["["] = "Balanced [",
  --       ["}"] = "Balanced } including white-space",
  --       ["{"] = "Balanced {",
  --       ["?"] = "User Prompt",
  --       _ = "Underscore",
  --       a = "Argument",
  --       b = "Balanced ), ], }",
  --       c = "Class",
  --       f = "Function",
  --       o = "Block, conditional, loop",
  --       q = "Quote `, \", '",
  --       t = "Tag",
  --     }
  --     local a = vim.deepcopy(i)
  --     for k, v in pairs(a) do
  --       a[k] = v:gsub(" including.*", "")
  --     end
  --
  --     -- local ic = vim.deepcopy(i)
  --     -- local ac = vim.deepcopy(a)
  --     -- for key, name in pairs({ n = "Next", l = "Last" }) do
  --     --   i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
  --     --   a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
  --     -- end
  --
  --     -- require("which-key").add({
  --     --   mode = { "o", "x" },
  --     --   i = i,
  --     --   a = a,
  --     -- })
  --
  --     require("which-key").add({
  --       mode = { "o", "x" },
  --       { "a ", desc = "Whitespace" },
  --       { 'a"', desc = 'Balanced "' },
  --       { "a'", desc = "Balanced '" },
  --       { "a(", desc = "Balanced (" },
  --       { "a)", desc = "Balanced )" },
  --       { "a<", desc = "Balanced <" },
  --       { "a>", desc = "Balanced >" },
  --       { "a?", desc = "User Prompt" },
  --       { "a[", desc = "Balanced [" },
  --       { "a]", desc = "Balanced ]" },
  --       { "a_", desc = "Underscore" },
  --       { "a`", desc = "Balanced `" },
  --       { "aa", desc = "Argument" },
  --       { "ab", desc = "Balanced ), ], }" },
  --       { "ac", desc = "Class" },
  --       { "af", desc = "Function" },
  --       { "ao", desc = "Block, conditional, loop" },
  --       { "aq", desc = "Quote `, \", '" },
  --       { "at", desc = "Tag" },
  --       { "a{", desc = "Balanced {" },
  --       { "a}", desc = "Balanced }" },
  --       { "i ", desc = "Whitespace" },
  --       { 'i"', desc = 'Balanced "' },
  --       { "i'", desc = "Balanced '" },
  --       { "i(", desc = "Balanced (" },
  --       { "i)", desc = "Balanced ) including white-space" },
  --       { "i<", desc = "Balanced <" },
  --       { "i>", desc = "Balanced > including white-space" },
  --       { "i?", desc = "User Prompt" },
  --       { "i[", desc = "Balanced [" },
  --       { "i]", desc = "Balanced ] including white-space" },
  --       { "i_", desc = "Underscore" },
  --       { "i`", desc = "Balanced `" },
  --       { "ia", desc = "Argument" },
  --       { "ib", desc = "Balanced ), ], }" },
  --       { "ic", desc = "Class" },
  --       { "if", desc = "Function" },
  --       { "io", desc = "Block, conditional, loop" },
  --       { "iq", desc = "Quote `, \", '" },
  --       { "it", desc = "Tag" },
  --       { "i{", desc = "Balanced {" },
  --       { "i}", desc = "Balanced } including white-space" },
  --     })
  --   end,
  -- },
  -- -- Fast and feature-rich surround actions. For text that includes
  -- -- surrounding characters like brackets or quotes, this allows you
  -- -- to select the text inside, change or modify the surrounding characters,
  -- -- and more.
  -- {
  --   "echasnovski/mini.surround",
  --   opts = {
  --     mappings = {
  --       add = "sa", -- Add surrounding in Normal and Visual modes
  --       delete = "sd", -- Delete surrounding
  --       -- find = "gsf", -- Find surrounding (to the right)
  --       -- find_left = "gsF", -- Find surrounding (to the left)
  --       -- highlight = "gsh", -- Highlight surrounding
  --       replace = "sr", -- Replace surrounding
  --       -- update_n_lines = "gsn", -- Update `n_lines`
  --     },
  --   },
  -- },

  -- {
  --   "SmiteshP/nvim-navic",
  --   dependencies =  {
  --     'neovim/nvim-lspconfig',
  --   },
  --   opts = {
  --     lsp = {
  --       auto_attach = true,
  --     }
  --   },
  -- },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim"
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tt",
        "<cmd>Trouble diagnostics toggle filter.buf=0 filter.severity=vim.diagnostic.severity.ERROR focus=true<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      -- {
      --   "<leader>xx",
      --   "<cmd>Trouble diagnostics toggle<cr>",
      --   desc = "Diagnostics (Trouble)",
      -- },
      -- {
      --   "<leader>xX",
      --   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      --   desc = "Buffer Diagnostics (Trouble)",
      -- },
      -- {
      --   "<leader>cs",
      --   "<cmd>Trouble symbols toggle focus=false<cr>",
      --   desc = "Symbols (Trouble)",
      -- },
      -- {
      --   "<leader>cl",
      --   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      --   desc = "LSP Definitions / references / ... (Trouble)",
      -- },
      -- {
      --   "<leader>xL",
      --   "<cmd>Trouble loclist toggle<cr>",
      --   desc = "Location List (Trouble)",
      -- },
      -- {
      --   "<leader>xQ",
      --   "<cmd>Trouble qflist toggle<cr>",
      --   desc = "Quickfix List (Trouble)",
      -- },
    },
  },


  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  --   'stevearc/aerial.nvim',
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons"
  --   },
  -- },

  { "hiphish/rainbow-delimiters.nvim", lazy = true },
  {
    'tzachar/highlight-undo.nvim',
    opts = {},
  },
  { "chentoast/marks.nvim", opts = {} },

  {
    "ThePrimeagen/harpoon",
    opts = {
      global_settings = {
        tabline = true,
      },
      tabline = true,
    }
  },

  { "xorid/asciitree.nvim" },
  { "ds1sqe/Calendar.nvim" },

  -- {
  --   "johmsalas/text-case.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     require("textcase").setup({})
  --     require("telescope").load_extension("textcase")
  --   end,
  --   keys = {
  --     "ga", -- Default invocation prefix
  --     { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
  --   },
  --   cmd = {
  --     -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
  --     "Subs",
  --     "TextCaseOpenTelescope",
  --     "TextCaseOpenTelescopeQuickChange",
  --     "TextCaseOpenTelescopeLSPChange",
  --     "TextCaseStartReplacingCommand",
  --   },
  --   -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
  --   -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
  --   -- available after the first executing of it or after a keymap of text-case.nvim has been used.
  --   lazy = false,
  -- },

  -- { "elentok/format-on-save.nvim" },

  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,      -- Recommended
  --   -- ft = "markdown" -- If you decide to lazy-load anyway
  --
  --   dependencies = {
  --     -- You will not need this if you installed the
  --     -- parsers manually
  --     -- Or if the parsers are in your $RUNTIMEPATH
  --     "nvim-treesitter/nvim-treesitter",
  --
  --     "nvim-tree/nvim-web-devicons"
  --   }
  -- },

  -- can't get it to work
  -- {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
  --
  --
}, {})
