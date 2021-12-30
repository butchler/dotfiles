""" Colors
set termguicolors

" Start in light mode
"set background=light

""" Press F10 to see highlight group at cursor
" From http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"source $HOME/.config/nvim/github-nofrils.vim

function NofrilsLight()
  let s:bg="#ffffff"
  let s:bgTerm="231"
  let s:fg="#24292e"
  let s:fgTerm="235"
  let s:fg2="#6a737d"
  let s:fg2Term="243"
  let s:bg2="#f6f8fa"
  let s:bg2Term="255"
  let s:bg3="#c8e1ff"
  let s:bg3Term="153"

  let s:blue="#0366d6"
  let s:blueTerm="33"

  set background=light

  call NofrilsHighlights()
endfunction

function NofrilsDark()
  let s:bg="#0d1117"
  let s:bgTerm="233"
  let s:fg="#c9d1d9"
  let s:fgTerm="253"
  let s:fg2="#8b949e"
  let s:fg2Term="246"
  let s:bg2="#161b22"
  let s:bg2Term="235"
  let s:bg3="#16233a"
  let s:bg3Term="237"

  let s:blue="#58a6ff"
  let s:blueTerm="69"

  set background=dark

  call NofrilsHighlights()
endfunction

function NofrilsHighlights()
  let s:fadedBlueFg="#57606a"
  let s:fadedBlueBg="#ddf4ff"

  let s:green="#2ea44f"
  let s:lightGreen="#e6ffed"
  let s:lightGreenTerm="157"
  let s:mediumGreen="#acf2bd"
  let s:mediumGreenTerm="150"
  let s:red="#cb2431"
  let s:redTerm="160"
  let s:lightRed="#ffeef0"
  let s:lightRedTerm="224"
  let s:yellow="#f1e05a"
  let s:yellowTerm="227"
  let s:darkBlue="#0a3069"
  let s:purple="#6f42c1"
  let s:teal="#2b7489"
  let s:orange="#e36209"
  let s:orangeTerm="208"

  hi! clear

  if exists("syntax on")
    syntax reset
  endif

  set t_Co=256
  let g:colors_name = "github-nofrils"

  exe 'hi! Normal ctermfg='s:fgTerm' ctermbg='s:bgTerm' guifg='s:fg' guibg='s:bg
  exe 'hi! Keyword ctermfg='s:fg2Term' guifg='s:fg2
  exe 'hi! Comment ctermfg='s:fg2Term' guifg='s:fg2
  exe 'hi! Constant ctermfg='s:blueTerm' guifg='s:blue
  exe 'hi! Type ctermfg='s:fg2Term' guifg='s:fg2' cterm=italic gui=italic'

  exe 'hi! CursorLine cterm=NONE ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! CursorLineNr ctermfg='s:blueTerm' ctermbg='s:bg2Term' guifg='s:blue' guibg='s:bg2
  exe 'hi! CursorColumn ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! ColorColumn ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! LineNr ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! link SignColumn LineNr'
  exe 'hi! link FoldColumn LineNr'
  exe 'hi! CocErrorSign ctermbg='s:bg2Term' guibg='s:bg2' ctermfg='s:redTerm' guifg='s:red
  exe 'hi! CocWarningSign ctermbg='s:bg2Term' guibg='s:bg2' ctermfg='s:orangeTerm' guifg='s:orange
  exe 'hi! CocInfoSign ctermbg='s:bg2Term' guibg='s:bg2' ctermfg='s:fgTerm' guifg='s:fg
  exe 'hi! CocHintSign ctermbg='s:bg2Term' guibg='s:bg2' ctermfg='s:fgTerm' guifg='s:fg
  exe 'hi! VertSplit ctermbg='s:fgTerm' ctermfg='s:bgTerm' guibg='s:fg' guifg='s:bg
  exe 'hi! MatchParen ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg3Term' guibg='s:bg3' gui=bold'
  "exe 'hi! MatchParen guifg='s:yellow
  exe 'hi! StatusLine ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg3Term' guibg='s:bg3' gui=bold cterm=bold'
  exe 'hi! StatusLineNC ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2' gui=bold cterm=bold'
  exe 'hi! TabLineSel ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2' gui=bold,underline cterm=bold,underline'
  exe 'hi! TabLine gui=underline cterm=underline guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! TabLineFill gui=underline cterm=underline ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! Pmenu ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! PmenuSel ctermfg='s:fgTerm' ctermbg='s:bg3Term' guibg='s:bg3
  exe 'hi! Directory ctermfg='s:blueTerm' guifg='s:blue
  exe 'hi! Folded ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bgTerm' guibg='s:bg
  exe 'hi! WildMenu ctermfg='s:blueTerm' guifg='s:blue' ctermbg='s:bgTerm' guibg='s:bg
  exe 'hi! DiffAdd ctermbg='s:lightGreenTerm' guibg='s:lightGreen
  exe 'hi! link DiffChange DiffAdd'
  exe 'hi! DiffDelete ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:lightRedTerm' guibg='s:lightRed' gui=NONE cterm=NONE'
  exe 'hi! DiffText ctermbg='s:mediumGreenTerm' guibg='s:mediumGreen' gui=NONE cterm=NONE'
  exe 'hi! link diffAdded DiffAdd'
  exe 'hi! link diffRemoved DiffDelete'
  exe 'hi! link diffChanged DiffChange'
  exe 'hi! ErrorMsg ctermfg='s:redTerm' guifg='s:red' ctermbg='s:bg2Term' guibg='s:bg2' gui=bold cterm=bold'
  exe 'hi! WarningMsg ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:yellowTerm' guibg='s:yellow
  exe 'hi! SpecialKey ctermfg='s:fgTerm' guifg='s:fg' ctermbg='s:bg2Term' guibg='s:bg2
  exe 'hi! Title guibg=bg ctermfg='s:fgTerm' guifg='s:fg' gui=bold cterm=bold'
  exe 'hi! link Todo Title'
  exe 'hi! Underlined  gui=underline cterm=underline'
  exe 'hi! Conceal guifg='s:fadedBlueFg' guibg='s:fadedBlueBg

  hi! link Character Constant
  hi! link Boolean Constant
  hi! link Float Constant
  hi! link Number Constant
  hi! link String Constant

  hi! link Statement Keyword
  hi! link Tag Keyword
  hi! link Operator Keyword
  hi! link Define Keyword
  hi! link Conditional Keyword
  hi! link Identifier Keyword
  hi! link typescriptDestructureLabel Keyword
  hi! link Special Keyword
  hi! link StorageClass Keyword
  hi! link typescriptExceptions Keyword
  hi! link Structure Keyword

  hi! link Function Normal
  hi! link PreProc Normal
  hi! link Label Normal
  hi! link NonText Normal
  hi! link typescriptFuncType Normal

  hi! link typescriptTypeReference Type

  hi! link typescriptInterfaceName Type
  hi! link typescriptAliasDeclaration Type
  hi! link typescriptEnum Type

  " Neovim Terminal Mode
  let g:terminal_color_0 = s:fg
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:green
  let g:terminal_color_3 = s:orange
  let g:terminal_color_4 = s:blue
  let g:terminal_color_5 = s:purple
  let g:terminal_color_6 = s:teal
  let g:terminal_color_7 = s:fg2
  let g:terminal_color_8 = g:terminal_color_0
  let g:terminal_color_9 = g:terminal_color_1
  let g:terminal_color_10 = g:terminal_color_2
  let g:terminal_color_11 = g:terminal_color_3
  let g:terminal_color_12 = g:terminal_color_4
  let g:terminal_color_13 = g:terminal_color_5
  let g:terminal_color_14 = g:terminal_color_6
  let g:terminal_color_15 = g:terminal_color_7

  " Javascript Highlighting
  hi! link jsBuiltins Keyword
  hi! link jsGlobalObjects Keyword
  hi! link jsExceptions Keyword
  hi! link jsArrowFunction Keyword
  hi! link jsFunction Keyword
  hi! link jsSuper Keyword

  " Html Highlighting
  exe 'hi! htmlLink ctermfg='s:blueTerm' guifg='s:blue' gui=underline cterm=underline'
  exec 'hi! link htmlStatement Keyword'
  exec 'hi! link htmlSpecialTagName Keyword'

  " Markdown Highlighting
  hi! link mkdCode Keyword
endfunction

command Light call NofrilsLight()
command Dark call NofrilsDark()

" Default to light mode
call NofrilsLight()
