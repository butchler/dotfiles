""" Colors
set termguicolors

" Nofrils for solarized
" Removes most of solarized's syntax highlighting, expect for the most important things (make
" keywords and comments stand out less, and strings/constants stand out more)
function! SolarizedNofrils() abort
  " Special from solarized8
  hi! CustomRed cterm=NONE gui=NONE ctermfg=9 guifg=#cb4b16 ctermbg=NONE guibg=NONE
  " Special from solarized8
  hi! CustomGreen cterm=NONE gui=NONE ctermfg=2 guifg=#719e07 ctermbg=NONE guibg=NONE
  " Type from solarized8
  hi! CustomYellow cterm=NONE gui=NONE ctermfg=3 guifg=#b58900 ctermbg=NONE guibg=NONE

  hi! link Identifier Normal
  hi! link Statement Comment
  hi! link PreProc Comment
  hi! link Type Comment
  hi! link Special Comment
  "hi! link Underlined Comment
  hi! link Ignore Comment
  hi! link diffAdded CustomGreen
  hi! link diffRemoved CustomRed

  " Make info and hint diagnostics use same colors as warnings
  hi! link CocInfoSign CocWarningSign
  hi! link CocHintSign CocWarningSign
endfunction

" Based on https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
augroup MyColors
  au!
  autocmd ColorScheme * call SolarizedNofrils()
augroup END

" Start in light mode
set background=light
colorscheme solarized8_high

""" Press F10 to see highlight group at cursor
" From http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
