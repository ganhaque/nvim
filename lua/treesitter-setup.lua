-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'go',
      'lua',
      'python',
      -- 'rust',
      'css',
      'html',
      'javascript',
      'json',
      'typescript',
      'tsx',
      'vimdoc',
      'vim',
      'yaml',
      'markdown',
      'markdown_inline',
      'prisma',
      'wgsl',
      'wgsl_bevy',
      'glsl',
      'toml',
      'sql',
    },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    -- autotag = {
    --   enabled = true
    -- },

    highlight = { enable = true },
    indent = {
      enable = true
    },
    -- context_commentstring = {
    --   enabled = true,
    -- },
    context_commentstring = {
      enabled = true,
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s',
        },
        typescript = { __default = '// %s', __multiline = '/* %s */' },
      }
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          -- [']m'] = '@function.outer',
          ['<leader>sj'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          -- [']M'] = '@function.outer',
          ['<leader>ej'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          -- ['[m'] = '@function.outer',
          ['<leader>sk'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          -- ['[M'] = '@function.outer',
          ['<leader>ek'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

require'treesitter-context'.setup{
  enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

-- vim: ts=2 sts=2 sw=2 et
