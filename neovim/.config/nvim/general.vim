""" General
syntax on

filetype plugin indent on

set clipboard+=unnamedplus

" Use indentation of previous line
set autoindent

set ts=2
set sw=2
set expandtab
set ignorecase
set smartcase

" Allow focusing with mouse
set mouse=a

" Make new splits open on right side
set splitright

set undofile
set undodir=$HOME/.nvim/undo

" Highlight current line
set cursorline

" Highlight matching search terms
set hlsearch

" Search as you type
set incsearch

" Make sure that there are lines above/below the cursor.
set scrolloff=5

" Automatically wrap after 100 columns.
" Can disable with :set tw=0
"set textwidth=100
"set textwidth=120
set textwidth=80

" Open git commit editor in new split instead of nested nvim
let $VISUAL = 'nvr -cc split --remote-wait'

" Show line/column number in status bar
set ruler

if has('nvim')
  " Make new terminal windows start in insert mode.
  autocmd TermOpen * startinsert

  " Don't automatically close terminal buffers when they are hidden
  autocmd TermOpen * set bufhidden=hide
end

" Allow opening non-suffixed filenames with `gf`
set suffixesadd=.svg,.json,.ts,.tsx,.js

" Automatically make windows same size
autocmd WinEnter * wincmd =
" But also make sure windows are at least as wide as our textwidth
" TODO: Figure out how to set winwidth to the value of textwidth
set winwidth=120
set winheight=20

" Don't visually wrap text
set nowrap

" Set backupcopy so webpack-dev-server/tsserver always notices file saves
set backupcopy=yes
