let s:neospace_layers_spell_checking_activated = 0

function! neospace#layers#spell_checking#plugins()
  return []
endfunction

function! neospace#layers#spell_checking#configs()
  " TODO: Documnet global config
  let g:neospace_layers_spell_checking_language =
              \ get(g:, "neospace_layers_spell_checking_language", "en_au")

  " TODO: download right files for non english languages
  call neospace#helpers#download_file(
              \ 'http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl',
              \ g:neospace_data_home . '/site/spell/en.utf-8.spl')
  call neospace#helpers#download_file(
              \ 'http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug',
              \ g:neospace_data_home . '/site/spell/en.utf-8.sug')
  set spell
  execute "set spelllang=" . g:neospace_layers_spell_checking_language

  let s:neospace_layers_spell_checking_activated = 1
endfunction

function! neospace#layers#spell_checking#activated()
  return s:neospace_layers_spell_checking_activated
endfunction
