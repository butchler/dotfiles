function PopulateQuickfixFromSelection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

  local qf_list = {}
  for _, line in ipairs(lines) do
    local count, filepath, lineno = line:match("%s*(%d+)%s+([^:]+):(%d+)")
    if count and filepath and lineno then
      table.insert(qf_list, {
        filename = filepath,
        lnum = tonumber(lineno)
      })
    end
  end

  vim.fn.setqflist(qf_list, 'r')
end

vim.api.nvim_create_user_command('SetQuickFixLinesSelection', PopulateQuickfixFromSelection, {range=true})
