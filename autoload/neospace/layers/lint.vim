let s:neospace_layers_lint_activated = 0

function! neospace#layers#lint#plugins()
  return [
        \ ['w0rp/ale', {}]
        \ ]
endfunction

function! neospace#layers#lint#configs()
  if neospace#plugins#plugin_exists('w0rp/ale')
  endif

  let s:neospace_layers_lint_activated = 1
endfunction

function! neospace#layers#lint#activated()
  return s:neospace_layers_lint_activated
endfunction
