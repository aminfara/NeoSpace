let s:neospace_layers_python_activated = 0

function! neospace#layers#python#plugins()
  return [
        \ ['zchee/deoplete-jedi', { 'for': 'python' }]
        \ ]
endfunction

function! neospace#layers#python#configs()
  let g:deoplete#sources#jedi#python_path = 'python3'

  augroup neospace_layers_python
    autocmd!
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal tabstop=4
  augroup END

  let s:neospace_layers_python_activated = 1
endfunction

function! neospace#layers#python#activated()
  return s:neospace_layers_python_activated
endfunction
