""" Colors
set termguicolors

" Start in light mode
"set background=light

""" Press F10 to see highlight group at cursor
" From http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

source $HOME/.config/nvim/github-nofrils.vim

"command Light call NofrilsLight()
"command Dark call NofrilsDark()
command Light colorscheme github-nofrils-light
command Dark colorscheme github-nofrils-dark

" Default to light mode
"call NofrilsLight()
colorscheme github-nofrils-light
