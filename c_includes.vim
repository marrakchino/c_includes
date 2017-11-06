" c_includes.vim
" author: Nabil Elqatib, marrakchino (nabilelqatib@gmail.com)
" version 0.1

" Only do this when not done yet for this buffer
if exists("b:C_includes_vim")
  finish
endif
let b:C_includes_vim = 1

let g:c_libraries = ['<stdlib.h>', '<stdio.h>', '<string.h>', '<stdbool.h>']

function s:InsertIncludes()
  " mark the current position
  normal ma
  " move to the first line in the file
  normal gg
  for library in g:c_libraries
    let found = 0
    let line = 1
    " check if the library is already included, if so, break and do nothing
    while line < (line("$"))
      if (getline(line) =~ library)
        let found = 1
        break
      endif
      let line = line + 1
    endwhile
    if found == 0
      let library = "#include " . library
      put=library
    endif
  endfor
  " go back to the initial position
  normal 'a
endfunction

command! -nargs=0 InsertIncludes :call <SID>InsertIncludes()
" TODO: Create a mapping to the function
