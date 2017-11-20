let s:neospace_plugins_need_sync = 0
let s:neospace_plugins_vim_plug_path =
            \ g:neospace_data_home . "/site/autoload/plug.vim"
let s:neospace_plugins_path = g:neospace_data_home . "/plugins"

function! neospace#plugins#plugin_exists(plugin)
  let l:plugin_shortname = split(a:plugin, "/")[1]
  return !empty(glob(s:neospace_plugins_path . "/" . tolower(l:plugin_shortname)))
endfunction

function! neospace#plugins#manage_plugins()
  call s:neospace_plugins_install_plugin_manager()
  call s:neospace_plugins_load_plugins()
  call s:neospace_plugins_sync_plugins()
endfunction

function! s:neospace_plugins_install_plugin_manager()
  function! IsVimPlugInstalled()
    let s:neospace_plugins_need_sync = 1
  endfunction

  let l:vim_plug_url =
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  call neospace#helpers#download_file(
              \ l:vim_plug_url,
              \ s:neospace_plugins_vim_plug_path,
              \ function('IsVimPlugInstalled')
              \ )
endfunction

function! s:neospace_plugins_load_plugins()
  call plug#begin(s:neospace_plugins_path)
  for layer in neospace#helpers#get_active_layers()
    call s:neospace_plugins_load_layer_plugins(layer)
  endfor
  call plug#end()
endfunction

function! s:neospace_plugins_sync_plugins()
  if s:neospace_plugins_need_sync
    augroup neospace_plugins
      autocmd!
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
  endif
endfunction

function! s:neospace_plugins_load_layer_plugins(layer)
  let LayerPlugins =
    \ function("neospace#layers#" . a:layer . "#plugins")

  for plugin_tuple in LayerPlugins()
    if !neospace#plugins#plugin_exists(plugin_tuple[0])
      let s:neospace_plugins_need_sync = 1
    endif

    call plug#(plugin_tuple[0], plugin_tuple[1])
  endfor
endfunction
