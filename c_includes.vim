" Only do this when not done yet for this buffer
if exists("b:C_includes_vim")
  finish
endif
let b:C_includes_vim = 1

let g:c_libraries = ['<stdlib.h>', '<stdio.h>', '<string.h>']

function InsertIncludes()
  normal gg
  for library in g:c_libraries
    let library = "#include " . library
    put=library
  endfor
  normal o
  normal ggdd
  normal ''
endfunction
