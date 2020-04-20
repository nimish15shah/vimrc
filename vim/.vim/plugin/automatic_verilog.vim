if exists("b:vlog_company") == 0
   let b:vlog_company = $USER
endif
if exists("b:vlog_max_col") == 0
   let b:vlog_max_col = 40
endif
if exists("b:vlog_arg_margin") == 0
   let b:vlog_arg_margin = "    "
endif
if exists("b:vlog_inst_margin") == 0
   let b:vlog_inst_margin = "        "
endif
if exists("b:verilog_indent_width")
   let b:vlog_ind = b:verilog_indent_width
else
   let b:vlog_ind = 4
endif


augroup configgroup_sv

  autocmd FileType verilog_systemverilog inoreabbrev __pkg phjlk
  "autocmd FileType verilog_systemverilog iab <buffer> pkg
   "     \<CR> package ;
    "    \<CR> endpackage

  "autocmd FileType verilog_systemverilog inoreabbrev __header <C-R>=AddHeader()<CR>
  autocmd FileType verilog_systemverilog command! Header call AddHeader()
  autocmd FileType verilog_systemverilog command! Comment call AddComment()
  autocmd FileType verilog_systemverilog command! Seq call AddSeq()
  autocmd FileType verilog_systemverilog command! Comb call AddComb()
  autocmd FileType verilog_systemverilog command! Mod call AddMod()
  autocmd FileType verilog_systemverilog command! Ifelse call AddIfElse()
  autocmd FileType verilog_systemverilog command! For call AddFor()
  autocmd FileType verilog_systemverilog command! ForE call AddForE()
  autocmd FileType verilog_systemverilog command! Log call AddLogic()
  autocmd FileType verilog_systemverilog command! Intf call AddInterface()
  autocmd FileType verilog_systemverilog command! Def call AddDefine()
  autocmd FileType verilog_systemverilog command! Case call AddCase()
  autocmd FileType verilog_systemverilog command! Class call AddClass()
  autocmd FileType verilog_systemverilog command! Func call AddFunc()
  autocmd FileType verilog_systemverilog command! Task call AddTask()
  autocmd FileType verilog_systemverilog command! Pkg call AddPkg()
  autocmd FileType verilog_systemverilog command! Assert call AddAssert()
  autocmd FileType verilog_systemverilog nnoremap ; :call AddSemiColon()<CR>
  
  "autocmd FileType verilog_systemverilog map ` ma?^\s*\<module\><CR>Wyiw'a:echo "module -->" @0<CR>
augroup END


function! AddAssert()
   let curr_line = line(".")
   call append(curr_line,  "  assert property (@(posedge clk) ) else $warning(1);")
   call setpos('.', [0, curr_line + 1, len("  assert property (@(posedge clk)  "), 0]) "set cursor to appropriate location
endfunction

function! AddPkg()
  let line= getline(line("."))
  let pkg_name= line
  let curr_line = line(".")
  call append(curr_line  , "package ".pkg_name.";")
  call append(curr_line+1, "endpackage: ".pkg_name)
endfunction

function! AddTask()
  let line= getline(line("."))
  let def_name= line
  let curr_line = line(".")
  call append(curr_line+0, "  task ".def_name."();")
  call append(curr_line+1, "  endtask : ".def_name)
endfunction

function! AddFunc()
  let line= getline(line("."))
  let def_name= line
  let curr_line = line(".")
  call append(curr_line+0, "  function ".def_name."();")
  call append(curr_line+1, "  endfunction : ".def_name)
endfunction

function! AddClass()
  let line= getline(line("."))
  let def_name= line
  let curr_line = line(".")
  call append(curr_line, "class ".def_name.";")
  call append(curr_line+1, "endclass : ".def_name)
endfunction

function! AddCase()
  let curr_line = line(".")
  call append(curr_line, "  case () ")
  call append(curr_line+1, "    A : begin end")
  call append(curr_line+2, "    default : = 'x;")
  call append(curr_line+3, "  endcase")
endfunction

function! AddDefine()
  let line= getline(line("."))
  let def_name= line
  let curr_line = line(".")
  call append(curr_line,   "`ifndef ".def_name)
  call append(curr_line+1,   "  `define ".def_name)
  call append(curr_line+2,   "")
  call append(curr_line+3,   "`endif //".def_name)
endfunction

function! AddInterface()
  let line= getline(line("."))
  let intf_name= line
  let curr_line = line(".")
  call append(curr_line,   "interface ".intf_name." (input clk, rst);")
  call append(curr_line+1, "")
  call append(curr_line+2, "  modport  (input , output );")
  call append(curr_line+3, "  modport  (input , output );")
  call append(curr_line+4, "endinterface")
  call append(curr_line+5, "")
endfunction

function! AddHeader()
  call append(0, "//=======================================================================")
  call append(1,  "// Created by         : KU Leuven")
  call append(2,  "// Filename           : ".expand("%"))
  call append(3,  "// Author             : Nimish Shah")
  call append(4,  "// Created On         : ".strftime("%Y-%m-%d %H:%M"))
  call append(5,  "// Last Modified      : ")
  call append(6,  "// Update Count       : ".strftime("%Y-%m-%d %H:%M"))
  call append(7,  "// Description        : ")
  call append(8,  "//                      ")
  call append(9, "//=======================================================================")
endfunction

function! AddSemiColon()
  call setline('.', getline('.').";")
endfunction

function! AddComment()
   let curr_line = line(".")
   call append(curr_line,  "  //===========================================")
   call append(curr_line+1,"  //       ")
   call append(curr_line+2,"  //===========================================")
  call setpos('.', [0, curr_line + 2, len("  //       "), 0]) "set cursor to appropriate location
endfunction

"===============================================================
"        Add an always statement
"===============================================================
function! AddSeq()
  let curr_line = line(".")
  call append(curr_line  , "  always_ff @(posedge clk or negedge rst) begin")
  call append(curr_line+1, "    if (rst== RESET_STATE) begin")
  call append(curr_line+2, "    end else begin")
  call append(curr_line+3, "    end")
  call append(curr_line+4, "  end")
  call append(curr_line+5, "")
endfunction

function! AddComb()
  let curr_line = line(".")
  call append(curr_line,   "  always_comb begin")
  call append(curr_line+1, "  end")
  call append(curr_line+2, "")
endfunction


function! AddMod()
  let line= getline(line("."))
  let mod_name= line
  let curr_line = line(".")
  call append(curr_line,   "module ".mod_name." (")
  call append(curr_line+1, "  input ,")
  call append(curr_line+2, "  output ")
  call append(curr_line+3, "  ); ")
  call append(curr_line+4, "")
  call append(curr_line+5, "endmodule")
  call append(curr_line+6, "")
endfunction


function! AddIfElse()
  let curr_line = line(".")
  call append(curr_line  , "    if () begin")
  call append(curr_line+1, "    end else begin")
  call append(curr_line+2, "    end")
  call setpos('.', [0, curr_line + 1, len("    if ( "), 0]) "set cursor to appropriate location
endfunction

function! AddFor()
  let curr_line = line(".")
  call append(curr_line+0, "    for (integer i=0; i<  ; i=i+1) begin")
  call append(curr_line+1, "    end")
endfunction

function! AddForE()
  let curr_line = line(".")
  call append(curr_line+0, "    foreach ( [i]) begin")
  call append(curr_line+1, "    end")
endfunction

function! AddLogic()
  let curr_line = line(".")
  let str= getline(curr_line)
  let list= split(str)
  call setline(curr_line, "  logic [".list[0]."-1 : ".list[1]."] ".list[2].";")
endfunction


function! AddAlways(clk_edge, rst_edge)
   let curr_line = line(".")
   if a:clk_edge == "posedge" && a:rst_edge == "posedge"
      call append(curr_line,   "always @(posedge clk or posedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "negedge" && a:rst_edge == "posedge"
      call append(curr_line,   "always @(negedge ".clk." or posedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "posedge" && a:rst_edge == "negedge"
      call append(curr_line,   "always @(posedge ".clk." or negedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (!".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "negedge" && a:rst_edge == "negedge"
      call append(curr_line,   "always @(negedge ".clk." or negedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (!".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "posedge" && a:rst_edge == ""
      call append(curr_line,   "always @(posedge ".clk.") begin")
      call append(curr_line+1, "end")
   elseif a:clk_edge == "negedge" && a:rst_edge == ""
      call append(curr_line,   "always @(negedge ".clk.") begin")
      call append(curr_line+1, "end")
   else
      call append(curr_line,   "always_comb begin")
      call append(curr_line+1, "end")
   endif
endfunction
