-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et



------

local opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- keymap("n", "<leader>ar", ":.+1,$tabdo :tabc<CR>", opts)
-- keymap("n", "<leader>", ":bprevious<CR>", opts)
-- keymap("n", "<Tab>", ":lua require('harpoon.ui').nav_next()<CR>", opts)
-- keymap("n", "<S-Tab>", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<leader>aa", ":BufferLineTogglePin<CR>", opts)
keymap("n", "<leader>ar", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<leader>al", ":BufferLineCloseLeft<CR>", opts)
keymap("n", "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<CR>", opts)
keymap("n", "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<CR>", opts)
keymap("n", "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<CR>", opts)
keymap("n", "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<CR>", opts)
keymap("n", "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<CR>", opts)
keymap("n", "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<CR>", opts)
keymap("n", "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<CR>", opts)
keymap("n", "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<CR>", opts)
keymap("n", "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<CR>", opts)


-- keymap("n", "<S-h>", ":HopLineBC<CR>", opts)
-- keymap("n", "<S-l>", ":HopLineAC<CR>", opts)
keymap("n", "<S-h>", "^", opts)
keymap("n", "<S-l>", "$", opts)
keymap("v", "<S-h>", "^", opts)
keymap("v", "<S-l>", "$", opts)
-- keymap("n", "<leader>j", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
-- keymap("n", "<leader>k", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

-- center when search next/prev
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- keymap("n", "<A-k>", ":m -2<CR>", opts)
-- keymap("n", "<A-j>", ":m +1<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<leader>p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom --
-- Ctrl-s to save (remember to change .bash_profile)
keymap("n", "<C-s>", ":w<CR>", opts) --save
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)
-- select & format all
keymap("n", "<leader>sa", "gg<S-v>G", opts)
keymap("n", "<leader>fa", "gg=G''", opts)

keymap("n", "<leader>q", "<cmd>lua require('utils.smart-quit').smart_quit()<CR>", opts)
keymap("n", "<leader>qa", "<cmd>lua require('utils.smart-quit-all').smart_quit()<CR>", opts)

-- Navigation
-- keymap("i", "C-h", "<Left>", opts)
-- keymap("i", "C-j", "<Down>", opts)
-- keymap("i", "C-k", "<Up?", opts)
-- keymap("i", "C-l", "<Right>", opts)

-- keymap("i", "hz", "<Left>", opts)
-- keymap("i", "zh", "<Left>", opts)
-- keymap("i", "jz", "<Down>", opts)
-- keymap("i", "zj", "<Down>", opts)
-- keymap("i", "kz", "<Up>", opts)
-- keymap("i", "zk", "<Up>", opts)
-- keymap("i", "lz", "<Right>", opts)
-- keymap("i", "zl", "<Right>", opts)

-- Nvchad toggle line numbers
-- keymap("n", "<Leader>n", "<cmd> set nu! <CR>", opts) -- toggle line number
-- keymap("n", "<eader>rn", "<cmd> set rnu! <CR>", opts) -- toggle relative number

keymap("n", "<ESC>", ":noh<CR>", opts) --no highlight
keymap("n", "<leader>w", ":BufDel<CR>", opts) --delete buffer (not closing window)

-- nvimtree
-- keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts) --toggle nvimtree
-- keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts) --focus nvimtree

--Cheatsheet
keymap("n", "<leader>?", ":Cheatsheet<CR>", opts) --bring up cheatsheet telescope

--accelerated-jk
-- vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
-- vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

keymap("n", "W", ":HopWord<cr>", { silent = true })
-- keymap("n", "S", ":HopChar2<cr>", { silent = true })
-- keymap("n", "Q", ":HopPattern<cr>", { silent = true })
-- keymap("", "H", ":HopChar2<cr>", { silent = true })

-- keymap("o", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
-- keymap("o", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
-- keymap("o", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
-- keymap("o", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)

-- keymap("n", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
-- keymap("n", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
-- keymap("n", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
-- keymap("n", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)

-- keymap("", "<Leader>l", require("lsp_lines").toggle, opts)
-- vim.keymap.set(
--   "",
--   "<Leader>tl",
--   require("lsp_lines").toggle,
--   { desc = "Toggle lsp_lines" }
-- )

-- keymap("n", "<Leader>mc", MiniMap.close)
-- keymap("n", "<Leader>mf", MiniMap.toggle_focus)
-- keymap("n", "<Leader>mo", MiniMap.open)
-- keymap("n", "<Leader>mr", MiniMap.refresh)
-- keymap("n", "<Leader>ms", MiniMap.toggle_side)
-- keymap("n", "<Leader>mt", MiniMap.toggle)

-- keymap("n", "<leader>m", ":MinimapToggle<cr>", { silent = true })
keymap("n", "<leader>t", ":TroubleToggle<cr>", { silent = true })

local diagnostics_active = true
vim.keymap.set('n', '<leader>d', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)

-- Telescope buffer
keymap("n", "<leader>fb", ":Telescope buffers<cr>", { silent = true })
keymap("n", "<leader>ff", ":Telescope find_files<cr>", { silent = true })
keymap("n", "<leader>fw", ":Telescope live_grep theme=ivy<cr>", { silent = true })
keymap("n", "<leader>fo", ":Telescope oldfiles<cr>", { silent = true })
keymap("n", "<leader>gs", ":Telescope git_status<cr>", { silent = true })

-- git-blame.nvim
keymap("n", "<leader>gbt", ":GitBlameToggle<cr>", { silent = true })
keymap("n", "<leader>gby", ":GitBlameCopyCommitURL<cr>", { silent = true })

keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { silent = true })


-- Harpoon
-- keymap("n", "<leader>aa", "<cmd>lua require('harpoon.mark').toggle_file()<cr>", opts)
-- keymap("n", "<leader>ar", "<cmd>lua require('harpoon.mark').rm_file()<cr>", opts)
-- keymap("n", "<leader>ar", "<cmd>lua require('harpoon.mark').toggle_file()<cr><cmd>lua require('harpoon.mark').toggle_file()<cr>", opts)
-- keymap("n", "<leader>ac", "<cmd>lua require('harpoon.mark').clear_all()<cr>", opts)
-- keymap("n", "<leader>am", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
-- keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
-- keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
-- keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
-- keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
-- keymap("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
-- keymap("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
-- keymap("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
-- keymap("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
-- keymap("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)
-- keymap("n", "[a", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
-- keymap("n", "]a", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)

