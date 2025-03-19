let g:colors_name = "github-nofrils-light"
set background=light
set t_Co=256
hi clear

let s:bg="#ffffff"
let s:fg="#24292e"
let s:fg2="#6a737d"
let s:bg2="#f6f8fa"
let s:bg3="#c8e1ff"
let s:fgLinkBlue="#0366d6"
let s:bgGreen="#e6ffed"
let s:bgGreen2="#acf2bd"
let s:bgRed="#ffeef0"
let s:bgSelect="#b4d7ff"

" Colors shared by light and dark modes
let s:green="#2ea44f"
let s:red="#cb2431"
let s:yellow="#f1e05a"
let s:purple="#6f42c1"
let s:teal="#2b7489"
let s:orange="#e36209"

" Neovim Terminal Mode
let g:terminal_color_0 = s:fg
let g:terminal_color_1 = s:red
let g:terminal_color_2 = s:green
let g:terminal_color_3 = s:orange
let g:terminal_color_4 = s:fgLinkBlue
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

exe 'hi Normal          guifg='s:fg'          guibg='s:bg
exe 'hi Visual                                guibg='s:bgSelect
exe 'hi Title           guifg='s:fg'          guibg='s:bg'         gui=bold'
exe 'hi Comment         guifg='s:fg2
exe 'hi Constant        guifg='s:fgLinkBlue
exe 'hi Type            guifg='s:fg2'                              gui=italic'
exe 'hi Underlined                                                 gui=underline'
exe 'hi htmlLink        guifg='s:fgLinkBlue'                       gui=underline'
exe 'hi CursorLine                            guibg='s:bg2
exe 'hi Pmenu                                 guibg='s:bg2
exe 'hi CursorLineNr                          guibg='s:bg2'        gui=bold'
"exe 'hi CocErrorSign    guifg='s:red'         guibg='s:bg2
"exe 'hi CocWarningSign  guifg='s:orange'      guibg='s:bg2
exe 'hi VertSplit       guifg='s:fg'          guibg='s:bg
exe 'hi StatusLine      guifg='s:fg'          guibg='s:bg3'        gui=bold'
exe 'hi StatusLineNC    guifg='s:fg'          guibg='s:bg2'        gui=bold'
exe 'hi TabLineSel      guifg='s:fg'          guibg='s:bg2'        gui=bold,underline'
exe 'hi TabLine         guifg='s:fg'          guibg='s:bg2'        gui=underline'
exe 'hi PmenuSel                              guibg='s:bg3
exe 'hi DiffAdd                               guibg='s:bgGreen
exe 'hi DiffDelete      guifg='s:fg'          guibg='s:bgRed'      gui=NONE'
exe 'hi DiffText                              guibg='s:bgGreen2'   gui=NONE'
exe 'hi ErrorMsg        guifg='s:red'         guibg='s:bg2'        gui=bold'
exe 'hi WarningMsg      guifg='s:fg'          guibg='s:yellow

hi! link Folded Normal
hi! link Function Normal
hi! link PreProc Normal
hi! link Label Normal
hi! link NonText Normal
hi! link typescriptFuncType Normal

hi! link Todo Title

hi! link Keyword Comment
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
hi! link jsBuiltins Keyword
hi! link jsGlobalObjects Keyword
hi! link jsExceptions Keyword
hi! link jsArrowFunction Keyword
hi! link jsFunction Keyword
hi! link jsSuper Keyword
hi! link htmlStatement Keyword
hi! link htmlSpecialTagName Keyword
hi! link mkdCode Keyword

hi! link Directory Constant
hi! link Character Constant
hi! link Boolean Constant
hi! link Float Constant
hi! link Number Constant
hi! link String Constant

hi! link typescriptTypeReference Type
hi! link typescriptInterfaceName Type
hi! link typescriptAliasDeclaration Type
hi! link typescriptEnum Type

hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine
hi! link LineNr CursorLine
hi! link SignColumn LineNr
hi! link FoldColumn LineNr
"hi! link Pmenu CursorLine
"hi! link CocMenuSel PmenuSel
"hi! link CocInfoSign CursorLine
"hi! link CocHintSign CocInfoSign
"hi! link CocListLine CursorLine
"hi! link CocListSearch Search
hi! link DiagnosticHint Type

hi! link MatchParen StatusLine

hi! link TabLineFill TabLine

hi! link diffChanged DiffChange
hi! link DiffChange DiffAdd
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link SpecialKey DiffDelete

"let s:fadedBlueFg="#57606a"
"let s:fadedBlueBg="#ddf4ff"
"exe 'hi Conceal guifg='s:fadedBlueFg' guibg='s:fadedBlueBg
