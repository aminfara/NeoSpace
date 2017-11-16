let s:neospace_layers_better_mappings_activated = 0

function! neospace#layers#better_mappings#plugins()
  return []
endfunction

function! neospace#layers#better_mappings#configs()
  imap jk <Esc>

  vnoremap < <gv
  vnoremap > >gv

  " better navigation of wrapped lines
  nnoremap j gj
  nnoremap k gk

  noremap <silent> <C-h> :wincmd h<CR>
  noremap <silent> <C-j> :wincmd j<CR>
  noremap <silent> <C-k> :wincmd k<CR>
  noremap <silent> <C-l> :wincmd l<CR>
  noremap <silent> <leader><left>  :wincmd h<CR>
  noremap <silent> <leader><down>  :wincmd j<CR>
  noremap <silent> <leader><up>    :wincmd k<CR>
  noremap <silent> <leader><right> :wincmd l<CR>

  " <F2> for toggling paste mode
  nnoremap <silent> <F2> :<C-u>set paste!<CR>
  silent set pastetoggle=<F2>

  nnoremap <silent> <F3> :<C-u>nohlsearch<CR>
  nnoremap <silent> <F4> :<C-u>set spell!<CR>


  " Help related
  cabbrev th tab help
  cabbrev tabhelp tab help

  augroup neospace_layers_better_mappings
    autocmd!
    autocmd FileType help noremap <buffer> q :q<cr>
  augroup END

  let s:neospace_layers_better_mappings_activated = 1
endfunction

function! neospace#layers#better_mappings#activated()
  return s:neospace_layers_better_mappings_activated
endfunction
