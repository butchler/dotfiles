""" vim-plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdcommenter'
"Plug 'ctrlpvim/ctrlp.vim'
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
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use ag for CtrlP, and don't cache
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor, case-sensitive
nnoremap K :Ack! -w "<C-r><C-w>"<CR>
" Same as above, but using visual selection.
vnoremap K y:Ack! <C-r>"<CR>
" bind \ to start :Ag command
nnoremap \ :Ack!<Space>

""" Completion
" Use tab/shift-tab to cycle completion suggestions
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc.nvim
" Confirm completion on enter
" This is needed to trigger effects like auto imports
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" if hidden is not set, TextEdit might fail.
set hidden
" Map Ctrl-P to coc-lists
nnoremap <C-p> :CocList files<CR>

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup
set backupcopy=yes

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Hover
nmap <leader>h :call CocActionAsync('doHover')<CR>

""" Splitjoin
" Use JSX settings for JS files
" Copied from splitjoin.vim/ftplugin/jsx/splitjoin.vim
" Modified to give higher priority to object literals, since that's what I split most often
autocmd FileType javascript,typescript,typescript.tsx let b:splitjoin_split_callbacks = [
      \ 'sj#html#SplitTags',
      \ 'sj#html#SplitAttributes',
      \ 'sj#js#SplitObjectLiteral',
      \ 'sj#js#SplitFatArrowFunction',
      \ 'sj#js#SplitArray',
      \ 'sj#js#SplitFunction',
      \ 'sj#js#SplitOneLineIf',
      \ 'sj#js#SplitArgs',
      \ ]

autocmd FileType javascript,typescript,typescript.tsx let b:splitjoin_join_callbacks = [
      \ 'sj#html#JoinAttributes',
      \ 'sj#html#JoinTags',
      \ 'sj#js#JoinObjectLiteral',
      \ 'sj#js#JoinFatArrowFunction',
      \ 'sj#js#JoinArray',
      \ 'sj#js#JoinArgs',
      \ 'sj#js#JoinFunction',
      \ 'sj#js#JoinOneLineIf',
      \ ]

let g:splitjoin_html_attributes_bracket_on_new_line=1
let g:splitjoin_trailing_comma=1

" Disable vim-json's concealing for performance
let g:vim_json_syntax_conceal = 0

" BufExplorer
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file name.
