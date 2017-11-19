let s:neospace_layers_javascript_activated = 0

function! neospace#layers#javascript#plugins()
  return [
        \ ['carlitux/deoplete-ternjs', { 'do': 'npm -g install tern', 'for': 'javascript' }]
        \ ]
endfunction

function! neospace#layers#javascript#configs()

  let s:neospace_layers_javascript_activated = 1
endfunction

function! neospace#layers#javascript#activated()
  return s:neospace_layers_javascript_activated
endfunction
