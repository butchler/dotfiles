" Vim color file
" github-nofrils
" Created by Adam with ThemeCreator (https://github.com/mswift42/themecreator)

hi! clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "github-nofrils"

" Define reusable colorvariables.
let s:bg="#ffffff"
let s:fg="#24292e"
let s:fg2="#6a737d"
let s:bg2="#f6f8fa"
let s:bg3="#c8e1ff"
"let s:border="#e1e4e8"

let s:green="#2ea44f"
let s:lightGreen="#e6ffed"
let s:mediumGreen="#acf2bd"
let s:red="#cb2431"
let s:lightRed="#ffeef0"
let s:yellow="#f1e05a"
let s:blue="#0366d6"
let s:darkBlue="#0a3069"
let s:purple="#6f42c1"
let s:teal="#2b7489"
let s:orange="#e36209"

let s:fadedBlueFg="#57606a"
let s:fadedBlueBg="#ddf4ff"

exe 'hi! CursorLine  guibg='s:bg2
exe 'hi! CursorLineNr guifg='s:blue' guibg='s:bg2
exe 'hi! CursorColumn  guibg='s:bg2
exe 'hi! ColorColumn  guibg='s:bg2
exe 'hi! LineNr guifg='s:fg' guibg='s:bg2
exe 'hi! link SignColumn LineNr'
exe 'hi! link FoldColumn LineNr'
exe 'hi! CocErrorSign guibg='s:bg2' guifg='s:red
exe 'hi! CocWarningSign guibg='s:bg2' guifg='s:orange
exe 'hi! CocInfoSign guibg='s:bg2' guifg='s:fg
exe 'hi! CocHintSign guibg='s:bg2' guifg='s:fg
exe 'hi! VertSplit guibg='s:fg' guifg='s:bg
exe 'hi! MatchParen guifg='s:fg' guibg='s:bg3
exe 'hi! StatusLine guifg='s:fg' guibg='s:bg3' gui=bold'
exe 'hi! StatusLineNC guifg='s:fg' guibg='s:bg2' gui=bold'
exe 'hi! TabLineSel guifg='s:fg' guibg='s:bg2' gui=bold,underline'
exe 'hi! TabLine gui=underline guifg='s:fg' guibg='s:bg2
exe 'hi! TabLineFill gui=underline guifg='s:fg' guibg='s:bg2
exe 'hi! Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi! PmenuSel  guibg='s:bg3
exe 'hi! Directory guifg='s:blue
exe 'hi! Folded guifg='s:fg' guibg='s:bg
exe 'hi! WildMenu guifg='s:blue' guibg='s:bg
exe 'hi! DiffAdd guibg='s:lightGreen
exe 'hi! link DiffChange DiffAdd'
exe 'hi! DiffDelete guifg='s:fg' guibg='s:lightRed' gui=NONE'
exe 'hi! DiffText guibg='s:mediumGreen' gui=NONE'
exe 'hi! link diffAdded DiffAdd'
exe 'hi! link diffRemoved DiffDelete'
exe 'hi! link diffChanged DiffChange'
exe 'hi! ErrorMsg guifg='s:red' guibg='s:bg2' gui=bold'
exe 'hi! WarningMsg guifg='s:fg' guibg='s:yellow
exe 'hi! SpecialKey guifg='s:fg' guibg='s:bg2
exe 'hi! Title guibg=bg guifg='s:fg' gui=bold'
exe 'hi! link Todo Title
exe 'hi! Underlined  gui=underline'
exe 'hi! Conceal guifg='s:fadedBlueFg' guibg='s:fadedBlueBg

exe 'hi! Normal guifg='s:fg' guibg='s:bg
exe 'hi! Keyword guifg='s:fg2
exe 'hi! Comment guifg='s:fg2
exe 'hi! Constant guifg='s:blue
exe 'hi! Type guifg='s:fg2' gui=italic'

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
exe 'hi! htmlLink guifg='s:blue' gui=underline'
hi! link htmlStatement Keyword
hi! link htmlSpecialTagName Keyword

" Markdown Highlighting
hi! link mkdCode Keyword
