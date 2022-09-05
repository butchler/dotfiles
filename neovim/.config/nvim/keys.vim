""" Key bindings
 " Use comma as leader key
let mapleader = ","

" Move around quicker
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-h> 10h
nnoremap <C-l> 10l
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap <C-h> 10h
vnoremap <C-l> 10l

" Move around wrapped lines
nnoremap <Up> gk
nnoremap <Down> gj

" Insert newlines/spaces from normal mode
nnoremap <CR> o<Esc>
" Return the enter key to its normal functionality (opening the file) when in
" the quickfix window.
autocmd FileType qf nnoremap <buffer> <CR> <CR>
"autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nnoremap <Space> i<Space><Esc>

" Open terminal in current file's directory
nnoremap <leader><CR> :lcd %:p:h<CR>:vs<CR>:terminal<CR>

" Escape to normal mode in terminal splits
tnoremap <Esc> <C-\><C-n>

" Switch windows with tab
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" Remap <C-i>/<Tab> (move forward in jumplist, the opposite of <C-o>) because
" we are using <Tab> for something else
nnoremap <C-n> <C-i>

" Alias uppercase mistypings
command W w
command Wq wq
command Q q

" Clear highlights
"nnoremap <C-c> :noh<CR>
nnoremap <Esc> :noh<CR>
" Work around TypeScript type error signs getting stuck for some reason
"nnoremap <Esc> :noh<CR>:sign unplace *<CR>

" ,/ to toggle comments
map <leader>/ <plug>NERDCommenterToggle

" Search for visually selected text by pressing / in visual mode
" Based on http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap / y/<C-R>"<CR>

" Toggle folds with backspace
nnoremap <Backspace> za

" Yank current file path
" Based on https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
nnoremap <leader>cp :let @* = expand("%")<CR>

""" Fugitive
" Load commits that touched current file into quickfix window
command Ghistory Glog -- %

" Open status window on left side
nnoremap <leader>gs :Git<CR><C-w>H

" Make all windows same size
nnoremap <leader>= <C-w>=

" Open location list
nnoremap <leader>l :lopen<CR>

" Search for uppercase characters
nnoremap <leader>u /\u<CR>

nnoremap <leader>e :Explore<CR>
"nnoremap <leader>e :e .<CR>

command! -nargs=1 S :s/<args>\+/\0\r/g

nmap ; :

" Start tmux sessions in terminals
command! -nargs=1 Term :call termopen("tmux new-session -s '<args>' -A") | file 'TMUX:<args>'
command! Tmux :call termopen("tmux")
