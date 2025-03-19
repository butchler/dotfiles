" Based on from https://vi.stackexchange.com/a/2198
let g:nb_buffers_to_keep = 100

function! s:SortTimeStamps(lhs, rhs)
  return a:lhs[1] > a:rhs[1] ?  1
     \ : a:lhs[1] < a:rhs[1] ? -1
     \ :                        0
endfunction

function! s:Close(nb_to_keep)
  " Only delete listed, non-modified, non-terminal, non-active buffers
  let hidden_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && ! getbufvar(v:val, "&modified") && getbufvar(v:val, "&buftype") != "terminal" && empty(win_findbuf(v:val))')
  "let times = map(copy(hidden_buffers), '[(v:val), getftime(bufname(v:val))]')
  " Sort by buffer last used time, not file modified time
  let times = map(copy(hidden_buffers), '[(v:val), getbufinfo(v:val)[0].lastused]')
  call filter(times, 'v:val[1] > 0')
  call sort(times, function('s:SortTimeStamps'))
  let nb_to_delete = len(times)-a:nb_to_keep
  " Only delete buffers if there are more old, hidden buffers than nb_to_keep
  if nb_to_delete > 0
    let buffers_to_strip = map(copy(times[0:(nb_to_delete-1)]), 'v:val[0]')
    exe 'bw '.join(buffers_to_strip, ' ')
  endif
endfunction

command! -nargs=0 CloseOldBuffers call s:Close(g:nb_buffers_to_keep)
command! -nargs=1 CloseOldBuffers call s:Close(<args>)
" Automatically close old buffers when opening a new buffer
" This sometimes causes weird issues with missing buffers
"augroup CloseOldBuffers
  "au!
  "au BufNew * call s:Close(g:nb_buffers_to_keep)
"augroup END
