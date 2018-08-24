let s:neospace_layers_indent_guides_activated = 0

function! neospace#layers#indent_guides#plugins()
  return [
    \ ['nathanaelkane/vim-indent-guides', {}]
    \ ]
endfunction

function! neospace#layers#indent_guides#configs()
  if neospace#plugins#plugin_exists('nathanaelkane/vim-indent-guides')
    let g:indent_guides_start_level = 2
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_color_change_percent = 5
    let g:indent_guides_auto_colors = 0

    augroup neospace_layers_indent_guides
      autocmd!
      autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=18
      autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=18
    augroup END
  endif

  let s:neospace_layers_indent_guides_activated = 1
endfunction

function! neospace#layers#indent_guides#activated()
  return s:neospace_layers_indent_guides_activated
endfunction
