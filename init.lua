-- NOTE: to be remove
-- https://github.com/neovim/neovim/issues/31675
vim.hl = vim.highlight

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
-- require('markview-setup')


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
vim.cmd("highlight CustomNectarHighlight guifg=#2cd391")
vim.cmd("highlight CustomEdgeHighlight guifg=#d7dd49")
vim.cmd("highlight CustomLanternHighlight guifg=#ffe300")
vim.cmd("highlight CustomForgeHighlight guifg=#ff8e3e")
vim.cmd("highlight CustomGrailHighlight guifg=#ff614f")
vim.cmd("highlight CustomHeartHighlight guifg=#f07784")
vim.cmd("highlight CustomRoseHighlight guifg=#ef64ff")
vim.cmd("highlight CustomKnockHighlight guifg=#b54efc")
vim.cmd("highlight CustomScaleHighlight guifg=#cb9f4d")
vim.cmd("highlight CustomSkyHighlight guifg=#2c69e1")
vim.cmd("highlight CustomWinterHighlight guifg=#beefff")
vim.cmd("highlight CustomMoonHighlight guifg=#cbbdd6")
vim.cmd("highlight CustomMothHighlight guifg=#F2E9C2")

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

local function apply_custom_highlighting()
  -- Clear existing matches to prevent duplicates
  vim.fn.clearmatches()

  -- Define patterns and their associated highlight groups
  local highlights = {
    { pattern = [[\v\d+ Winter]], group = "CustomWinterHighlight" },
    { pattern = [[\v\d+ Edge]], group = "CustomEdgeHighlight" },
    { pattern = [[\v(\d+) Lantern]], group = "CustomLanternHighlight" },
    { pattern = [[\v(\d+) Forge]], group = "CustomForgeHighlight" },
    { pattern = [[\v(\d+) Grail]], group = "CustomGrailHighlight" },
    { pattern = [[\v(\d+) Heart]], group = "CustomHeartHighlight" },
    { pattern = [[\v(\d+) Rose]], group = "CustomRoseHighlight" },
    { pattern = [[\v(\d+) Knock]], group = "CustomKnockHighlight" },
    { pattern = [[\v(\d+) Scale]], group = "CustomScaleHighlight" },
    { pattern = [[\v(\d+) Sky]], group = "CustomSkyHighlight" },
    { pattern = [[\v(\d+) Moon]], group = "CustomMoonHighlight" },
    { pattern = [[\v(\d+) Moth]], group = "CustomMothHighlight" },
    { pattern = [[\v(\d+) Nectar]], group = "CustomNectarHighlight" },
  }

  -- Apply each highlight
  for _, highlight in ipairs(highlights) do
    vim.fn.matchadd(highlight.group, highlight.pattern, -1)
  end
end

-- Create an autocommand group and attach the highlighting function
vim.api.nvim_create_augroup("CustomWinterHighlighting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "CustomWinterHighlighting",
  pattern = "*",
  callback = apply_custom_highlighting,
})


-- TODO: change these in colorscheme
-- https://www.reddit.com/r/neovim/comments/19aratu/psa_nvimtreesitter_breaking_changes_on_highlight/
-- " tree-sitter "standard capture names"
vim.cmd([[
hi link @variable.parameter         @parameter
hi link @variable.member            @field
hi link @module                     @namespace
hi link @number.float               @float
hi link @string.special.symbol      @symbol
hi link @string.regexp              @string.regex
hi link @markup.strong              @text.strong
hi link @markup.italic              @text.emphasis
hi link @markup.underline           @text.underline   " note: some are changed to @string.special
hi link @markup.strikethrough       @text.strike
hi link @markup.heading             @text.title
hi link @markup.quote               @text.quote
hi link @markup.link.url            @text.uri
hi link @markup.math                @text.math
hi link @markup.environment         @text.environment
hi link @markup.environment.name    @text.environment.name
hi link @markup.link                @text.reference
hi link @markup.raw                 @text.literal
hi link @markup.raw.block           @text.literal.block
hi link @markup.link.label          @string.special
hi link @markup.list                @punctuation.special
]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

local lspconfig = require('lspconfig')
lspconfig.wgsl_analyzer.setup({})

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

