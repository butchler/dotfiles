""" vim-plug
" Install vim-plug with:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jlanzarotta/bufexplorer'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInstall coc-tsserver coc-eslint coc-lists' }
Plug 'mileszs/ack.vim'

call plug#end()

""" Ack/ag
if executable('ag') " Use ag for Ack
  let g:ackprg = 'ag --nogroup --nocolor --column --hidden --ignore .git/'
endif

" bind K to grep word under cursor, case-sensitive
nnoremap K :Ack! -w "<C-r><C-w>"<CR>
" Same as above, but using visual selection.
vnoremap K y:Ack! <C-r>"<CR>
" bind \ to start :Ag command
nnoremap \ :Ack!<Space>

""" coc.nvim
" Completion
" Based on `:help coc-completion-example`
" Use <tab> and <S-tab> to navigate completion list
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1): "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Use <CR> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" if hidden is not set, TextEdit might fail.
set hidden
" Map Ctrl-P to coc-lists
nnoremap <C-p> :CocList files<CR>

" Reduce delay until floating diagnostic windows are shown
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let mapleader = ","

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Hover
nmap <leader>h :call CocActionAsync('doHover')<CR>

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
