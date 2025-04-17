return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'html',

        'bash',
        'c',
        'cpp',
        'diff',
        'go',
        'lua',
        'python',

        'html',
        'css',
        'javascript',
        'json',
        'typescript',
        'tsx',

        'yaml',
        'markdown',
        'markdown_inline',

        -- 'prisma',
        'sql',

        'rust',
        'wgsl',
        'wgsl_bevy',

        'glsl',
        'toml',

        'lua',
        'luadoc',
        'query',
        'vimdoc',
        'vim',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
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
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
