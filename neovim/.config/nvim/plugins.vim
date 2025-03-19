""" vim-plug
" Install vim-plug with:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jlanzarotta/bufexplorer'
Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInstall coc-tsserver coc-eslint coc-lists' }
Plug 'neovim/nvim-lspconfig'

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhartington/formatter.nvim'
Plug 'lbrayner/vim-rzip'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

""" fzf.vim
" Use ripgrep for fzf
if executable('rg')
  " Search hidden files but don't search .git/
  let $FZF_DEFAULT_COMMAND = "rg --hidden -g '!.git/' --files"
end
" Map Ctrl-P to fzf
nnoremap <silent> <C-p> :Files<CR>
" Map Ctrl-B to fzf with open buffers
nnoremap <silent> <C-b> :Buffers<CR>

""" Ack/ag
" Use ripgrep for Ack
if executable('rg')
  " Search hidden files but not .git/, and use smartcase, and sort so order is consistent across runs
  let g:ackprg = "rg --hidden -g '!.git/' --vimgrep --smart-case --sort=path"
endif

" bind K to grep word under cursor, case-sensitive
nnoremap K :Ack! -w "<C-r><C-w>"<CR>
" Same as above, but using visual selection.
" Also does not automatically search, to allow the query to be altered.
vnoremap K y:Ack! <C-r>"
" bind \ to start :Ag command
nnoremap \ :Ack!<Space>

""" Splitjoin
" Treat .js files as JSX, mainly so splitjoin works with JSX inside .js files
augroup filetype_jsx
  autocmd!
  autocmd FileType javascript set filetype=javascriptreact
augroup END

let g:splitjoin_html_attributes_bracket_on_new_line=1
let g:splitjoin_trailing_comma=1

""" BufExplorer
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file name.

""" vim-polyglot
" Disable vim-json's concealing for performance
let g:vim_json_syntax_conceal = 0

""" formatter.nvim
" Automatically format on save for JS/TS files
"augroup FormatAutogroup
  "autocmd!
  "autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx FormatWrite
"augroup END
