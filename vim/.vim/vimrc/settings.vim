" Moving from curr line to start of next or end of previous line with arrows
set whichwrap+=<,>,[,]

" Python related setting:
set foldmethod=indent
set foldnestmax=6 " Enable folding upto a particular nesting level
set foldlevelstart=0   " open most folds by default

" tabs are at space of 4
set tabstop=2
" indenting is 4 spaces
set shiftwidth=2
set expandtab

set autoindent
"set cindent
"set smartindent

set wildmode=longest,list,full
set wildmenu " visual autocomplete for command menu

" Closing one split window without resizing other windows
set noea
" i.e. oppsite of
" set equalalways

" To turn relative line numbers on
:set relativenumber
:set rnu

" To turn relative line numbers off
":set norelativenumber
":set nornu


set cursorline " highlight current line

"set showcmd             " show command in bottom bar

set incsearch           " search as characters are entered
"
" To avoid complains about backup files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Omni completion on
" To be done with <c-x><c-o>
set omnifunc=syntaxcomplete#Complete

" Autocomplete with dictionary words in text mode
set complete+=kspell

" directory for swap files,
" to stop cluttering working directories
set dir=~/tmp

" Disable annoying swapfile prompt, but keep generating swap files
set shortmess=A

