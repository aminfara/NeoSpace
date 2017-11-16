let s:neospace_layers_easy_motion_activated = 0

function! neospace#layers#easy_motion#plugins()
  return [
        \ ['easymotion/vim-easymotion', {}]
        \ ]
endfunction

function! neospace#layers#easy_motion#configs()
  if neospace#plugins#plugin_exists('easymotion/vim-easymotion')
    let g:EasyMotion_smartcase = 1

    nmap <Leader>s <Plug>(easymotion-s2)
    vmap <Leader>s <Plug>(easymotion-s2)
  endif

  let s:neospace_layers_easy_motion_activated = 1
endfunction

function! neospace#layers#easy_motion#activated()
  return s:neospace_layers_easy_motion_activated
endfunction
