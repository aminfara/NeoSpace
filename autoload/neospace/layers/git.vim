let s:neospace_layers_git_activated = 0

function! neospace#layers#git#plugins()
  return [
        \ ["tpope/vim-fugitive", {}],
        \ ["airblade/vim-gitgutter", {}]
        \ ]
endfunction

function! neospace#layers#git#configs()
  if neospace#plugins#plugin_exists("tpope/vim-fugitive")
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gl :Git log --stat --graph --decorate --all<CR>
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gh :Gsplit<CR>
    nnoremap <silent> <leader>gv :Gvsplit<CR>
  endif

  let s:neospace_layers_git_activated = 1
endfunction

function! neospace#layers#git#activated()
  return s:neospace_layers_git_activated
endfunction
