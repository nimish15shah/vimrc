
" useful commands:
" '. : Jump to last modification line.

" `. : Jump to exact spot in last modification line

" CTRL-O : Retrace your movements in file in backwards.

" CTRL-I : Retrace your movements in file in forwards.
"
" 0  : Move to the start of the line
" E  : Move to the End of the line
" use T, and F, instead of t, and f,. The lowercase commands go forward; the uppercase ones go backwards.
"
"    Ctrl-y Moves screen up one line
"    Ctrl-e Moves screen down one line
"    Ctrl-u Moves cursor & screen up ½ page
"    Ctrl-d Moves cursor & screen down ½ page
"    Ctrl-b Moves screen up one page, cursor to last line
"    Ctrl-f Moves screen down one page, cursor to first line
"
"    ctrl-w j for switch amog split windows
"    ctrl-w k for switch amog split windows
"    Ctrl-r: Redo changes which were undone    
"

" Packages
" Align : https://www.vim.org/scripts/script.php?script_id=294
"   Command syntax : :.,+3Align =     (to allign on = sign on 4 lines)
" verilog_systemverilog
" Tabular for better allignment
"   Command syntax : :.,+3Tabularize /reg-ex/l0
"   Example :.,+1Tabularize /\s\S/l0 to allign white spacing in declaration as
"   shown below:
"     int a;      -->  int   a;
"     logic b;         logic b;
"
" call pathogen#runtime_append_all_bundles()  " use pathogen

set nocp
set nocompatible

filetype off " required for Vundle


"execute pathogen#infect()

"Plug
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" NERDtree
"Plug 'scrooloose/nerdtree'

"Plug 'https://github.com/nachumk/systemverilog.vim.git'

" Initialize plugin system
call plug#end()

syntax on
filetype plugin indent on

source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/settings.vim
source $HOME/.vim/vimrc/file_types.vim
source $HOME/.vim/vimrc/plugin_configs.vim

" Navigating with default marks
" Command 	Description
" `. 	       jump to position where last change occurred in current buffer
" `" 	       jump to position where last exited current buffer
" `0 	       jump to position in last file edited (when exited Vim)
" `1 	       like `0 but the previous file (also `2 etc)
" '' 	       jump back (to line in current buffer where jumped from)
" `` 	       jump back (to position in current buffer where jumped from)
" `[ or `] 	jump to beginning/end of previously changed or yanked text
" `< or `> 	jump to beginning/end of last visual selection 

" Use global marks to mark locations in frequently used files


" Useful bookmarks
" https://www.mattlayman.com/blog/2019/supercharging-vim-navigate-files-instantly/
" ctrlP tutorial: https://www.youtube.com/watch?v=8XGueeQJsrA

