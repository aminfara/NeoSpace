let s:neospace_layers_tags_activated = 0

function! neospace#layers#tags#plugins()
  return [
        \ ["ludovicchabant/vim-gutentags", {}],
        \ ["majutsushi/tagbar", { 'on': 'TagbarOpen' }]
        \ ]
endfunction

function! neospace#layers#tags#configs()
  if neospace#plugins#plugin_exists("majutsushi/tagbar")
    let g:tagbar_autofocus = 1
        nnoremap <silent><Leader>tt :<C-u>TagbarOpen fj<CR>
        nnoremap <silent><Leader>tc :<C-u>TagbarClose<CR>
  endif

  let s:neospace_layers_tags_activated = 1
endfunction

function! neospace#layers#tags#activated()
  return s:neospace_layers_tags_activated
endfunction
