-- Async make
local Job = require('plenary.job')

function make(opts)
  local makeprg = vim.bo.makeprg
  local errorformat = vim.bo.errorformat
  if makeprg == '' then
    return
  end

  -- escape special characters in args
  args = string.gsub(opts.args or '', '%%', '%%%%')
  -- substitute $*
  makeprg, _ = string.gsub(makeprg, '%$%*', args);
  -- expand
  makeprg = vim.fn.expandcmd(makeprg)

  local function on_exit(job, retval)
    local result = {}
    vim.list_extend(result, job:result())
    vim.list_extend(result, job:stderr_result())
    vim.notify(string.format(
      ':!%s\n%s\n\nshell returned %d',
      makeprg,
      table.concat(result, '\n'),
      retval
    ))
    vim.fn.setqflist({}, ' ', {
      title = makeprg,
      lines = result,
      efm = errorformat,
    })
    vim.api.nvim_exec_autocmds('QuickFixCmdPost', {})

    if #result > 0 then
      vim.cmd('copen')
    end
  end

  Job:new({
    command = 'sh',
    args = { '-c', makeprg },
    on_exit = vim.schedule_wrap(on_exit),
  }):start()
end

vim.api.nvim_create_user_command('Make', make, {
  nargs = '*',
  complete = 'file',
})
