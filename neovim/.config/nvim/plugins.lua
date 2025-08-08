require('mini.surround').setup()
require('mini.splitjoin').setup({
  detect = {
    -- Add ; as separator for splitting TypeScript interfaces
    separator = '[,;]',
  },
})
require('mini.ai').setup()
require('mini.comment').setup({
  mappings = {
    -- Toggle comment on current line
    comment_line = ',/',

    -- Toggle comment on visual selection
    comment_visual = ',/',
  },
})
require('mini.jump').setup()
require('mini.notify').setup()
