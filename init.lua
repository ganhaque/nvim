--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
require('lazy-bootstrap')

-- [[ Configure plugins ]]
require('lazy-plugins')

-- [[ Setting options ]]
require('options')

-- [[ Basic Keymaps ]]
require('keymaps')

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require('telescope-setup')

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require('treesitter-setup')

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require('lsp-setup')

-- [[ Configure nvim-cmp ]]
-- (completion)
require('cmp-setup')


require('nvim-tree-setup')

-- require('colorscheme')
-- require('bufferline-setup')
-- require('alpha-setup')
-- require('splitjoin-setup')
require('comment-setup')
-- require('ufo-setup')
require('lualine-setup')


require('opts.todo-comment')
require('opts.markdown-preview')


require('autocommands')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

vim.cmd.colorscheme "galana"
-- vim.cmd.colorscheme "catppuccin"


-- Disable spell checking for MDX files
-- vim.cmd([[
--   augroup mdx_spellcheck
--     autocmd!
--     autocmd FileType mdx setlocal nospell
--   augroup END
-- ]])

vim.filetype.add({
  extension = {
    mdx = "markdown",
  }
})


-- Define a custom highlight group for matching patterns
-- vim.cmd("highlight CustomNectarHighlight guifg=#2cd391")
-- vim.cmd("highlight CustomEdgeHighlight guifg=#d7dd49")
-- vim.cmd("highlight CustomLanternHighlight guifg=#ffe300")
-- vim.cmd("highlight CustomForgeHighlight guifg=#ff8e3e")
-- vim.cmd("highlight CustomGrailHighlight guifg=#ff614f")
-- vim.cmd("highlight CustomHeartHighlight guifg=#f07784")
-- vim.cmd("highlight CustomRoseHighlight guifg=#ef64ff")
-- vim.cmd("highlight CustomKnockHighlight guifg=#b54efc")
-- vim.cmd("highlight CustomScaleHighlight guifg=#cb9f4d")
-- vim.cmd("highlight CustomSkyHighlight guifg=#2c69e1")
-- vim.cmd("highlight CustomWinterHighlight guifg=#beefff")
-- vim.cmd("highlight CustomMoonHighlight guifg=#cbbdd6")
-- vim.cmd("highlight CustomMothHighlight guifg=#F2E9C2")

-- vim.cmd("highlight CustomNectarHighlight guibg=#2cd391 guifg=Black")
-- vim.cmd("highlight CustomEdgeHighlight guibg=#d7dd49 guifg=Black")
-- vim.cmd("highlight CustomLanternHighlight guibg=#ffe300 guifg=Black")
-- vim.cmd("highlight CustomForgeHighlight guibg=#ff8e3e guifg=Black")
-- vim.cmd("highlight CustomGrailHighlight guibg=#ff614f guifg=Black")
-- vim.cmd("highlight CustomHeartHighlight guibg=#f07784 guifg=Black")
-- vim.cmd("highlight CustomRoseHighlight guibg=#ef64ff guifg=Black")
-- vim.cmd("highlight CustomKnockHighlight guibg=#b54efc guifg=Black")
-- vim.cmd("highlight CustomScaleHighlight guibg=#cb9f4d guifg=Black")
-- vim.cmd("highlight CustomSkyHighlight guibg=#2c69e1 guifg=Black")
-- vim.cmd("highlight CustomWinterHighlight guibg=#beefff guifg=Black")
-- vim.cmd("highlight CustomMothHighlight guibg=#F2E9C2 guifg=Black")
-- vim.cmd("highlight CustomMoonHighlight guibg=#cbbdd6 guifg=Black")

-- vim.cmd([[
--   augroup CustomWinterHighlighting
--     autocmd!
--     autocmd BufWinEnter * call matchadd('CustomWinterHighlight', '\v\d+ Winter', -1)
--     autocmd BufWinEnter * call matchadd('CustomEdgeHighlight', '\v\d+ Edge', -1)
--     autocmd BufWinEnter * call matchadd('CustomLanternHighlight', '\v(\d+) Lantern', -1)
--     autocmd BufWinEnter * call matchadd('CustomForgeHighlight', '\v(\d+) Forge', -1)
--     autocmd BufWinEnter * call matchadd('CustomGrailHighlight', '\v(\d+) Grail', -1)
--     autocmd BufWinEnter * call matchadd('CustomHeartHighlight', '\v(\d+) Heart', -1)
--     autocmd BufWinEnter * call matchadd('CustomRoseHighlight', '\v(\d+) Rose', -1)
--     autocmd BufWinEnter * call matchadd('CustomKnockHighlight', '\v(\d+) Knock', -1)
--     autocmd BufWinEnter * call matchadd('CustomScaleHighlight', '\v(\d+) Scale', -1)
--     autocmd BufWinEnter * call matchadd('CustomSkyHighlight', '\v(\d+) Sky', -1)
--     autocmd BufWinEnter * call matchadd('CustomMoonHighlight', '\v(\d+) Moon', -1)
--     autocmd BufWinEnter * call matchadd('CustomMothHighlight', '\v(\d+) Moth', -1)
--   augroup END
-- ]])
