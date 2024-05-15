-- " set to 1, the nvim will auto close current preview window when changing
-- " from Markdown buffer to another buffer
-- " default: 1
vim.g.mkdp_auto_close = 0

-- " set to 1, Vim will refresh Markdown when saving the buffer or
-- " when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
-- " move the cursor
-- " default: 0
vim.g.mkdp_refresh_slow = 0

-- " specify browser to open preview page
-- " for path with space
-- " valid: `/path/with\ space/xxx`
-- " invalid: `/path/with\\ space/xxx`
-- " default: ''
vim.g.mkdp_browser = 'firefox'
