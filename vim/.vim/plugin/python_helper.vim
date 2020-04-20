
augroup configgroup_python

  autocmd FileType python command! Header call AddHeader()
  autocmd FileType python command! Comment call AddComment()
  
augroup END


function! AddHeader()
  call append(0,  "#-----------------------------------------------------------------------")
  call append(1,  "# Created by         : KU Leuven")
  call append(2,  "# Filename           : ".expand("%"))
  call append(3,  "# Author             : Nimish Shah")
  call append(4,  "# Created On         : ".strftime("%Y-%m-%d %H:%M"))
  call append(5,  "# Last Modified      : ")
  call append(6,  "# Update Count       : ".strftime("%Y-%m-%d %H:%M"))
  call append(7,  "# Description        : ")
  call append(8,  "#                      ")
  call append(9,  "#-----------------------------------------------------------------------")
endfunction


function! AddComment()
   let curr_line = line(".")
   call append(curr_line,  "#-------------------------------------------")
   call append(curr_line+1,"#       ")
   call append(curr_line+2,"#-------------------------------------------")
endfunction
