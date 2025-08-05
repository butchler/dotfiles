""" General
syntax on

filetype plugin indent on

set clipboard+=unnamedplus

" Use indentation of previous line
set autoindent

set ts=2
set sw=2
set expandtab
set ignorecase
set smartcase

" Allow focusing with mouse
set mouse=a

" Make new splits open on right side
set splitright

set undofile
set undodir=$HOME/.nvim/undo

" Highlight current line
set cursorline

" Highlight matching search terms
set hlsearch

" Search as you type
set incsearch

" Make sure that there are lines above/below the cursor.
set scrolloff=5

" Jump many characters at once when scrolling horizontally. Only used when
" wrapping is disabled.
set sidescroll=20

" When wrapping is enabled, don't wrap in the middle of a word.
set linebreak

" Automatically wrap after 100 columns.
" Can disable with :set tw=0
set textwidth=80

" Open git commit editor in new split instead of nested nvim
let $VISUAL = 'nvr -cc split --remote-wait'

" Show line/column number in status bar
set ruler

if has('nvim')
  " Make new terminal windows start in insert mode.
  autocmd TermOpen * startinsert

  " Don't automatically close terminal buffers when they are hidden
  autocmd TermOpen * set bufhidden=hide
end

" Allow opening non-suffixed filenames with `gf`
set suffixesadd=.svg,.json,.ts,.tsx,.js

" Automatically make windows same size
autocmd WinEnter * wincmd =
" But also make sure windows are at least as wide as our textwidth, plus extra
" space for the error/warning column.
set winwidth=122
set winheight=20

" Don't visually wrap text
set nowrap

" Set backupcopy so webpack-dev-server/tsserver always notices file saves
set backupcopy=yes

" Copied from https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
" Mainly for `:Redir hi` to make debugging highlights less painful
function! Redir(cmd, rng, start, end)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let cmd = a:cmd =~' %'
			\ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
			\ : matchstr(a:cmd, '^!\zs.*')
		if a:rng == 0
			let output = systemlist(cmd)
		else
			let joined_lines = join(getline(a:start, a:end), '\n')
			let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
			let output = systemlist(cmd . " <<< $" . cleaned_lines)
		endif
	else
		redir => output
		execute a:cmd
		redir END
		let output = split(output, "\n")
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	call setline(1, output)
endfunction

command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)

" Custom minimal tabline with no buffer names, only number fo windows
" Based on :help setting-tabline
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ' '
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    let tablabel = MyTabLabel(i + 1, i + 1 == tabpagenr())

    " the label is made by MyTabLabel()
    if i + 1 == tabpagenr()
      let s .= '[' . tablabel . ']'
    else
      let s .= ' ' . tablabel . ' '
    endif
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X[x]'
  endif

  return s
endfunction

function MyTabLabel(n, isselected)
  let numwindows = tabpagewinnr(a:n, '$')
  return numwindows
endfunction

" Multiple errorformat entries:
"
" 1. Match output of `tsc --noEmit --pretty false`. Based on https://www.reddit.com/r/vim/comments/7dv9as/how_to_edit_the_vim_quickfix_list/
" 2. Match the format of quickfix window entries, for manually pruning entries
" 3. Catchall telling vim to ignore any lines which don't match any previous patterns
set errorformat+=%f(%l\\,%c):\ %m
set errorformat+=%f\|%l\ col\ %c\|%m
set errorformat+=%-G%.%#
"set! errorformat=%f(%l\\,%c):\ %m,%f\|%l\ col\ %c\|%m,%-G%.%#

" These can be used to add a plain list of files (or files and line numbers) to the quickfix window
"setlocal errorformat+=%f:%l
"setlocal errorformat+=%f

" Uses the current selected range of lines, or uses the entire buffer if no range is selected.
command -range=% SetQuickfix cgetexpr getline(<line1>, <line2>)
