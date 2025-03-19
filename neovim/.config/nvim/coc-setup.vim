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
"nnoremap <C-p> :CocList files<CR>

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
