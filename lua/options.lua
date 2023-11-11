-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- vim: ts=2 sts=2 sw=2 et

---

vim.o.cmdheight = 1
-- always show tabs
vim.o.showtabline = 2
-- convert tab to spaces
vim.o.expandtab = true
-- number of spaces inserted for each indentation
vim.o.shiftwidth = 2

vim.opt.signcolumn = "yes"

vim.o.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 3

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.cursorline = false

-- highlight all matches on previous search pattern
vim.opt.hlsearch = true

-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 32


vim.opt.list = true
vim.opt.listchars:append "space:⋅"

-- hyphenated words recognized by searches
vim.opt.iskeyword:append "-"
