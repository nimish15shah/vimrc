" Vim filetype plugin file
" Language:     SDC (superset extension of tcl)
" Maintainer:   gaofeng.dong@gmail.com
" Last Update:  Thu Jun  2 13:30:55 IST 2016
" Version: 1.0

" Only do this when not done yet for this buffer
" Had to comment this out to use plugin managers
" because /etc/vimrc has syntax on and filetype on, which cannot be switched
" off
"if exists("b:did_ftplugin")
"  finish
"endif

au BufRead,BufNewFile *.sdc,*.SDC  set filetype=sdc

" Behaves just like Tcl
"runtime! ftplugin/tcl.vim
