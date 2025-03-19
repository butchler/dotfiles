-- Based on https://github.com/dprint/dprint/issues/301#issuecomment-907386813
local dprintConfig = {
  function()
    return {
      exe = "dprint",
      args = { "fmt", "--stdin", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      stdin = true,
    }
  end
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.DEBUG,
  filetype = {
    typescript = dprintConfig,
    typescriptreact = dprintConfig,
    javascript = dprintConfig,
    javascriptreact = dprintConfig,
  }
}
