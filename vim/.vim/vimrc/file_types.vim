" comment toggling in python
augroup configgroup
  autocmd FileType python nnoremap # :s/^/#/<CR> :let @/=""<CR> <Esc>:nohlsearch <CR>
  autocmd FileType python nnoremap !# :s/#/<CR> :let @/=""<CR> <Esc>:nohlsearch <CR>
  autocmd FileType verilog_systemverilog nnoremap # :s/^/\/\//<CR> :let @/=""<CR> <Esc>:nohlsearch <CR>
  autocmd FileType verilog_systemverilog nnoremap !# :s/\/\//<CR> :let @/=""<CR> <Esc>:nohlsearch <CR>
  
  " For verilog systemverilog
  autocmd FileType verilog_systemverilog source ~/.vim/plugin/automatic_verilog.vim

augroup END

augroup EDAhighlight
  " syntax highlighting for Synopsys tools
  autocmd FileType tcl source ~/.vim/syntax/synopsys.vim
  "au BufRead,BufNewFile *.tcl source ~/.vim/syntax/synopsys.vim

  " syntax highlighting for Cadence tools
  autocmd FileType tcl source ~/.vim/syntax/cadence.vim
  "au BufRead,BufNewFile *.tcl source ~/.vim/syntax/cadence.vim
augroup END

" syntax highlighting for Candence .lib file
"autocmd BufNewFile,BufRead tcbn*.lib, cds*.lib,assura*.lib   set syntax=cdslib


