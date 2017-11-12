let s:neospace_layers_color_base16_activated = 0

function! neospace#layers#color_base16#plugins()
  return [
        \ ['chriskempson/base16-vim', {}]
        \ ]
endfunction

function! neospace#layers#color_base16#configs()
  if !neospace#layers#better_visual#activated()
    echohl WariningMsg
    echomsg "You need to activate better_visual before color_base16 layer."
    echohl None
  endif

  if neospace#plugins#plugin_exists('chriskempson/base16-vim')
    colorscheme base16-default-dark
    if &t_Co == 256
      let g:base16colorspace=256
    endif

    if filereadable(expand("~/.vimrc_background"))
      source ~/.vimrc_background
    endif
  endif

  let s:neospace_layers_color_base16_activated = 1
endfunction

function! neospace#layers#color_base16#activated()
  return s:neospace_layers_color_base16_activated
endfunction
