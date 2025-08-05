" split.vim - Simple TypeScript line splitter
" Usage: :call SplitLine() or map to a key like <leader>s

function! SplitLine()
    let line = getline('.')

    " Simple replacements
    let line = substitute(line, '(', "(\n", 'g')
    let line = substitute(line, ')', "\n)", 'g')
    let line = substitute(line, ', ', ",\n", 'g')
    let line = substitute(line, '; ', ";\n", 'g')
    let line = substitute(line, '{ ', "{\n", 'g')
    let line = substitute(line, ' }', "\n}", 'g')

    " Split into lines and replace current line
    let lines = split(line, '\n')
    call setline('.', lines[0])

    for i in range(1, len(lines) - 1)
        call append(line('.') + i - 1, lines[i])
    endfor
endfunction

" Command to call the function
command! SplitLine call SplitLine() | Format
nnoremap <leader>s :SplitLine<CR>
