local M = {}

function M.smart_quit()
  local modified_buffers = {}

  -- Check for modified buffers
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(bufnr, "modified") then
      table.insert(modified_buffers, bufnr)
    end
  end

  if #modified_buffers > 0 then
    vim.ui.input({
      prompt = "You have unsaved changes. Save all changes and quit? (y/n) ",
    }, function(input)
        if input == "y" then
          -- Save all modified buffers and then quit
          for _, bufnr in ipairs(modified_buffers) do
            vim.api.nvim_buf_call(bufnr, function()
              vim.cmd "wa"
            end)
          end
          vim.cmd "qall!"
        end
      end)
  else
    -- No modified buffers, quit immediately
    vim.cmd "qall!"
  end
end

return M
