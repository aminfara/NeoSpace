let s:neospace_layers_javascript_activated = 0

function! neospace#layers#javascript#plugins()
  return [
        \ ['carlitux/deoplete-ternjs', { 'do': 'npm -g install tern', 'for': 'javascript' }],
        \ ['ternjs/tern_for_vim', { 'for': 'javascript' }]
        \ ]
endfunction

function! neospace#layers#javascript#configs()
  let &wildignore = 'node_modules,' . &wildignore

  let g:deoplete#sources#ternjs#include_keywords = 1
  let g:deoplete#sources#ternjs#omit_object_prototype = 0
  let g:deoplete#sources#ternjs#case_insensitive = 1
  let g:deoplete#sources#ternjs#timeout = 1

  " Use tern_for_vim.
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

  let s:neospace_layers_javascript_activated = 1
endfunction

function! neospace#layers#javascript#activated()
  return s:neospace_layers_javascript_activated
endfunction
