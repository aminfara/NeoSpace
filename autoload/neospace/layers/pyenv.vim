let s:neospace_layers_pyenv_activated = 0

function! neospace#layers#pyenv#plugins()
  return []
endfunction

function! neospace#layers#pyenv#configs()
  if executable('pyenv')
    let g:python_host_prog = systemlist('pyenv which python2')[0]
    let g:python3_host_prog = systemlist('pyenv which python3')[0]
  endif

  let s:neospace_layers_pyenv_activated = 1
endfunction

function! neospace#layers#pyenv#activated()
  return s:neospace_layers_pyenv_activated
endfunction
