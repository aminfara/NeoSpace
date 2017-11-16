let s:neospace_layers_comment_activated = 0

function! neospace#layers#comment#plugins()
  return [
        \ ['tpope/vim-commentary', {}]
        \ ]
endfunction

function! neospace#layers#comment#configs()
  if neospace#plugins#plugin_exists('tpope/vim-commentary')
  endif

  let s:neospace_layers_comment_activated = 1
endfunction

function! neospace#layers#comment#activated()
  return s:neospace_layers_comment_activated
endfunction
