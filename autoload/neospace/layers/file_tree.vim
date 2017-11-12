let s:neospace_layers_file_tree_activated = 0

function! neospace#layers#file_tree#plugins()
  return [
    \ ['scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }]
    \ ]
endfunction

function! neospace#layers#file_tree#configs()
  if neospace#plugins#plugin_exists('scrooloose/nerdtree')
    let g:NERDTreeShowHidden=1

    nnoremap <silent><Leader>nn :<C-u>call
          \ <SID>neospace_layers_file_tree_nerdtree_open()<CR>
    nnoremap <silent><Leader>nc :<C-u>NERDTreeToggle<CR>
  endif

  let s:neospace_layers_file_tree_activated = 1
endfunction

function! neospace#layers#file_tree#activated()
  return s:neospace_layers_file_tree_activated
endfunction

function! s:neospace_layers_file_tree_nerdtree_open()
  if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction
