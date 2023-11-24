require('Comment').setup({
  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  pre_hook = function(ctx)
    local U = require('Comment.utils')
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == 'typescriptreact' then

      -- Detemine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type,
        location = location,
      })
    end

    -- local status_utils_ok, utils = pcall(require, "ts_context_commentstring.utils")
    -- if not status_utils_ok then
    --   return
    -- end
    --
    -- local location = nil
    -- if ctx.ctype == U.ctype.block then
    --   location = utils.get_cursor_location()
    -- elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
    --   location = utils.get_visual_start_location()
    -- end
    --
    -- local status_internals_ok, internals = pcall(require, "ts_context_commentstring.internals")
    -- if not status_internals_ok then
    --   return
    -- end
    --
    -- return internals.calculate_commentstring {
    --   key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
    --   location = location,
    -- }
  end,
})
