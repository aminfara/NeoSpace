let s:neospace_layers_color_gruvbox_activated = 0

function! neospace#layers#color_gruvbox#plugins()
  return [
        \ ["morhetz/gruvbox", {}]
        \ ]
endfunction

function! neospace#layers#color_gruvbox#configs()
  if !neospace#layers#better_visual#activated()
    echohl WariningMsg
    echomsg "You need to activate better_visual before color_gruvbox layer."
    echohl None
  endif

  if neospace#plugins#plugin_exists("morhetz/gruvbox")
    set background=dark
    colorscheme gruvbox
  endif

  let s:neospace_layers_color_gruvbox_activated = 1
endfunction

function! neospace#layers#color_gruvbox#activated()
  return s:neospace_layers_color_gruvbox_activated
endfunction
