" space open/closes folds
nnoremap <space> za

" move vertically by visual line, without skipping on the very long lines
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>
"nnoremap jk <esc>
"vnoremap jk <esc>

" remap <ESC> to nothing
inoremap <ESC> <Nop>

let mapleader=","       " leader is comma

" map grep to ,g
nnoremap <leader>g :!grep 

" navigating in inset mode
"inoremap <c-j> <c-o>j
"inoremap <c-k> <c-o>k
"inoremap <c-h> <c-o>h
"inoremap <c-l> <c-o>l

inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" to resize windows more quickly
nnoremap <c-w>+ <c-w>10+
nnoremap <c-w>- <c-w>10-

" grep in buffers
function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction
function! GrepBuffers (expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction
command! -nargs=+ GrepBufs call GrepBuffers(<q-args>)
nnoremap <leader>z :call GrepBuffers("<C-R><C-W>")<CR> :copen<CR> 

