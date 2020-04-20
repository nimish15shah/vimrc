
" matchit
source ~/.vim/plugin/matchit.vim

if exists('loaded_matchit')
let b:match_ignorecase=0
let b:match_words=
  \ '\<begin\>:\<end\>,' .
  \ '\<if\>:\<else\>,' .
  \ '\<module\>:\<endmodule\>,' .
  \ '\<class\>:\<endclass\>,' .
  \ '\<program\>:\<endprogram\>,' .
  \ '\<clocking\>:\<endclocking\>,' .
  \ '\<property\>:\<endproperty\>,' .
  \ '\<sequence\>:\<endsequence\>,' .
  \ '\<package\>:\<endpackage\>,' .
  \ '\<covergroup\>:\<endgroup\>,' .
  \ '\<primitive\>:\<endprimitive\>,' .
  \ '\<specify\>:\<endspecify\>,' .
  \ '\<generate\>:\<endgenerate\>,' .
  \ '\<interface\>:\<endinterface\>,' .
  \ '\<function\>:\<endfunction\>,' .
  \ '\<task\>:\<endtask\>,' .
  \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
  \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
  \ '`ifdef\>:`else\>:`endif\>,'
endif

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
"" CtrlP settings
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files = 200000
"let g:ctrlp_user_command= 'grep'
"let g:ctrlp_working_path_mode = 0
if executable('ag')
  " use silver searcher if present
  " Disable caching as 'ag' is very fast
  " Also does not ignore git-ignore files. searches in everything
  let g:ctrlp_user_command = '[ $PWD == $HOME ] && echo "In HOME Directory" || ag %s -l --nocolor --ignore=vendor --ignore images --ignore svg --ignore fonts --skip-vcs-ignores -g ""'
  "let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
else
  " Ignore git ignore files
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  let g:ctrlp_clear_cache_on_exit = 0
endif
let g:ctrlp_clear_cache_on_exit = 0

" make splitting horizontally default behaviour
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-x>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<cr>', '<c-cr>', '<c-s>'],
  \ }


"" NERDtree
"" Toggle Nerdtree display
"nnoremap <Leader>t :NERDTreeToggle<Enter>
"" Open the NERDtree for the file in current buffer
"nnoremap <silent> <Leader>n :NERDTreeFind<CR>
"" Make it prettier
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

