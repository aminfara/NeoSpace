let s:neospace_layers_pairs_activated = 0

function! neospace#layers#pairs#plugins()
  return [
        \ ['jiangmiao/auto-pairs', {}],
        \ ['tpope/vim-surround', {}],
        \ ['tpope/vim-repeat', {}]
        \ ]
endfunction

function! neospace#layers#pairs#configs()
  let s:neospace_layers_pairs_activated = 1
endfunction

function! neospace#layers#pairs#activated()
  return s:neospace_layers_pairs_activated
endfunction
