-- local highlight = {
--   "IndentBlankLineOdd",
--   "IndentBlankLineEven",
-- }
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--   -- vim.api.nvim_set_hl(0, "IndentBlankLineOdd", { fg = "#E06C75" })
--   -- vim.api.nvim_set_hl(0, "IndentBlankLineEven", { fg = "#E06C75" })
--   vim.api.nvim_set_hl(0, "IndentBlankLineOdd", { fg = "#313244" })
--   vim.api.nvim_set_hl(0, "IndentBlankLineEven", { fg = "#1e1e2e" })
-- end)

-- vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup {
  -- scope = { highlight = highlight }
  indent = {
    char = "┊",
    -- highlight = highlight,
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    -- injected_languages = true,
  }
}

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
