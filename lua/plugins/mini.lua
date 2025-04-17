return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup {
        mappings = {
          add = "sa", -- Add surrounding in Normal and Visual modes
          delete = "sd", -- Delete surrounding
          -- find = "gsf", -- Find surrounding (to the right)
          -- find_left = "gsF", -- Find surrounding (to the left)
          -- highlight = "gsh", -- Highlight surrounding
          replace = "sr", -- Replace surrounding
          -- update_n_lines = "gsn", -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
        search_method = 'nearest',
      }

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }


      require('mini.icons').setup {
        -- -- default config
        -- -- Icon style: 'glyph' or 'ascii'
        -- style = 'glyph',
        --
        -- -- Customize per category. See `:h MiniIcons.config` for details.
        -- default   = {},
        -- directory = {},
        -- extension = {},
        -- file      = {},
        -- filetype  = {},
        -- lsp       = {},
        -- os        = {},
        --
        -- -- Control which extensions will be considered during "file" resolution
        -- use_file_extension = function(ext, file) return true end,
      }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim

      require('mini.splitjoin').setup {
        -- Module mappings. Use `''` (empty string) to disable one.
        -- Created for both Normal and Visual modes.
        mappings = {
          -- toggle = 'gS',
          split = '<leader>k',
          join = '<leader>j',
        },

        -- Detection options: where split/join should be done
        detect = {
          -- Array of Lua patterns to detect region with arguments.
          -- Default: { '%b()', '%b[]', '%b{}' }
          brackets = {
            '%b()',
            '%b[]',
            '%b{}',
            '%b<>'
          },

          -- String Lua pattern defining argument separator
          separator = ',',

          -- Array of Lua patterns for sub-regions to exclude separators from.
          -- Enables correct detection in presence of nested brackets and quotes.
          -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
          exclude_regions = nil,
        },

        -- Split options
        split = {
          hooks_pre = {},
          hooks_post = {},
        },

        -- Join options
        join = {
          hooks_pre = {},
          hooks_post = {},
        },
      }

      require('mini.pairs').setup {
        -- map_bs = false, -- <BS> key (backspace)
        check_ts = true,
        enable_check_bracket_line = false,
        -- ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=], -- will not insert unless space?
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = {
          "TelescopePrompt",
          -- "spectre_panel"
        },
        -- fast_wrap = {
        --   map = "<M-e>",
        --   chars = { "{", "[", "(", '"', "'" },
        --   pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        --   offset = 0, -- Offset from pattern match
        --   end_key = "$",
        --   -- keys = "qwertyuiopzxcvbnmasdfghjkl",
        --   keys = "asdghklqwertyuiopzxcvbnmfj", --hop default
        --   check_comma = true,
        --   highlight = "PmenuSel",
        --   highlight_grey = "LineNr",
        -- },
      }

    end,
  },

}
-- vim: ts=2 sts=2 sw=2 et
