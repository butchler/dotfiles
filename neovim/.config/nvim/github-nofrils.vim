" Vim color file
" github-nofrils
" Created by Adam with ThemeCreator (https://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "github-nofrils"

" Define reusable colorvariables.
let s:bg="#ffffff"
let s:fg="#24292e"
let s:bg2="#f6f8fa"
let s:bg3="#c8e1ff"
let s:border="#e1e4e8"

let s:green="#2ea44f"
let s:lightGreen="#e6ffed"
let s:mediumGreen="#acf2bd"
let s:red="#cb2431"
let s:lightRed="#ffeef0"
let s:yellow="#f1e05a"
let s:blue="#0366d6"
let s:purple="#6f42c1"
let s:teal="#2b7489"
let s:orange="#e36209"

let s:comment="#6a737d"
let s:const=s:blue
let s:keyword=s:comment
let s:builtin=s:comment
let s:func=s:fg
let s:str=s:const
let s:type=s:comment
let s:var=s:fg
let s:error=s:red
let s:warning=s:yellow

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine  guibg='s:bg2
exe 'hi CursorLineNr guifg='s:str' guibg='s:bg
exe 'hi CursorColumn  guibg='s:bg2
exe 'hi ColorColumn  guibg='s:bg2
exe 'hi LineNr guifg='s:fg' guibg='s:bg2
hi! link SignColumn LineNr
hi! link FoldColumn LineNr
exe 'hi CocErrorSign guibg='s:bg2' guifg='s:red
exe 'hi CocWarningSign guibg='s:bg2' guifg='s:warning
exe 'hi CocInfoSign guibg='s:bg2' guifg='s:fg
exe 'hi CocHintSign guibg='s:bg2' guifg='s:fg
exe 'hi VertSplit guibg='s:fg' guifg='s:bg
exe 'hi MatchParen guifg='s:fg' guibg='s:bg3
exe 'hi StatusLine guifg='s:fg' guibg='s:bg3' gui=bold'
exe 'hi StatusLineNC guifg='s:fg' guibg='s:bg2' gui=bold'
exe 'hi TabLineSel guifg='s:fg' guibg='s:bg2' gui=bold,underline'
exe 'hi TabLine gui=underline guifg='s:fg' guibg='s:bg2
exe 'hi TabLineFill gui=underline guifg='s:fg' guibg='s:bg2
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg' guibg='s:bg
exe 'hi WildMenu guifg='s:str' guibg='s:bg

exe 'hi Boolean guifg='s:const
exe 'hi Character guifg='s:const
exe 'hi Comment guifg='s:comment
exe 'hi Conditional guifg='s:keyword
exe 'hi Constant guifg='s:const
exe 'hi Define guifg='s:keyword
exe 'hi DiffAdd guibg='s:lightGreen
hi! link DiffChange DiffAdd
exe 'hi DiffDelete guifg='s:fg' guibg='s:lightRed' gui=NONE'
exe 'hi DiffText guibg='s:mediumGreen' gui=NONE'
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link diffChanged DiffChange
exe 'hi ErrorMsg guifg='s:error' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning
exe 'hi Float guifg='s:const
exe 'hi Function guifg='s:func
exe 'hi Identifier guifg='s:type'  gui=italic'
exe 'hi Keyword guifg='s:keyword''
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:fg' guibg='s:bg
exe 'hi Number guifg='s:const
exe 'hi Operator guifg='s:keyword
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:comment
exe 'hi SpecialKey guifg='s:fg' guibg='s:bg2
exe 'hi Statement guifg='s:keyword
exe 'hi StorageClass guifg='s:type'  gui=italic'
exe 'hi String guifg='s:str
exe 'hi Tag guifg='s:keyword
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guibg='s:bg' guifg='s:fg'  gui=bold'
exe 'hi Type guifg='s:type
exe 'hi Underlined   gui=underline'

" Neovim Terminal Mode
let g:terminal_color_0 = s:fg
let g:terminal_color_1 = s:red
let g:terminal_color_2 = s:green
let g:terminal_color_3 = s:orange
let g:terminal_color_4 = s:blue
let g:terminal_color_5 = s:purple
let g:terminal_color_6 = s:teal
let g:terminal_color_7 = s:comment
let g:terminal_color_8 = g:terminal_color_0
let g:terminal_color_9 = g:terminal_color_1
let g:terminal_color_10 = g:terminal_color_2
let g:terminal_color_11 = g:terminal_color_3
let g:terminal_color_12 = g:terminal_color_4
let g:terminal_color_13 = g:terminal_color_5
let g:terminal_color_14 = g:terminal_color_6
let g:terminal_color_15 = g:terminal_color_7

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword''
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var

" Html Highlighting
exe 'hi htmlLink guifg='s:blue' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin
