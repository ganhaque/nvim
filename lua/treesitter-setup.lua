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
      'rust',
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
    },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    -- autotag = {
    --   enabled = true
    -- },

    highlight = { enable = true },
    indent = { enable = true },
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

-- vim: ts=2 sts=2 sw=2 et
