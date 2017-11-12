let s:neospace_layers_status_line_activated = 0
let s:neospace_layers_status_line_theme = 'base16'

function! neospace#layers#status_line#plugins()
  return [
        \ ['vim-airline/vim-airline', {}],
        \ ['vim-airline/vim-airline-themes', {}]
        \ ]
endfunction

function! neospace#layers#status_line#configs()
  if neospace#plugins#plugin_exists('vim-airline/vim-airline')
    let g:airline_powerline_fonts = 0
    let g:airline_theme = s:neospace_layers_status_line_theme
    let g:airline#extensions#tabline#enabled = 1

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline#extensions#tabline#left_sep = '▏'
    let g:airline#extensions#tabline#left_alt_sep = '▏'
    let g:airline#extensions#tabline#right_sep = '▕'
    let g:airline#extensions#tabline#right_alt_sep = '▕'
    let g:airline_left_sep          = ''
    let g:airline_left_alt_sep      = '>'
    let g:airline_right_sep         = ''
    let g:airline_right_alt_sep     = '<'
    let g:airline_symbols.readonly  = '⊘'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇' "⮑, ➔, ➥, ⤴
    " let g:airline_symbols.paste     = 'ρ' "Þ, ∥
    let g:airline_symbols.whitespace = 'Ξ'
  endif

  let s:neospace_layers_status_line_activated = 1
endfunction

function! neospace#layers#status_line#activated()
  return s:neospace_layers_status_line_activated
endfunction

function! neospace#layers#status_line#set_theme(theme)
  let s:neospace_layers_status_line_theme = a:theme
endfunction
