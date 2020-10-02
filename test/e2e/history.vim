let s:suite = themis#suite('vaffle_e2e_history')
let s:assert = themis#helper('assert')
let s:cwd = getcwd()


function! s:suite.before_each() abort
  %bwipeout!
  execute printf('cd %s', fnameescape(s:cwd))
endfunction



function! s:suite.test_keepalt() abort
  cd test/e2e/files
  " Open file
  e history/foo.txt

  Vaffle
  " Move to parent directory
  normal h

  call s:assert.equals(
        \ fnamemodify(bufname('#'), ':t'),
        \ 'foo.txt',
        \ 'Vaffle navigation should keep alternate file')
endfunction
