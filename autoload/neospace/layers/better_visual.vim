let s:neospace_layers_better_visual_activated = 0

function! neospace#layers#better_visual#plugins()
  return []
endfunction

function! neospace#layers#better_visual#configs()
  ""
  " Folding
  "
  set foldlevelstart=10
  set foldnestmax=10
  set foldmethod=syntax
  set foldenable

  ""
  " Invisible characters
  "
  set listchars=tab:⇥\ ,trail:·
  set list  " Show invisible characters

  ""
  " Scroll offsets
  "
  set scrolloff=5
  set sidescrolloff=10

  ""
  " Splitting windows
  "
  set splitbelow
  set splitright

  ""
  " Wrapping
  "
  set colorcolumn=80
  set textwidth=0
  set wrapmargin=0
  set wrap
  set linebreak
  set breakindent

  ""
  " Miscellaneous
  "
  set cursorline                        " draws a line to show the current line
  set noshowmode                        " don't show mode, status bar plugin will show it
  set number                            " show line numbers
  set ruler                             " show cursor position
  set showcmd                           " show partial command
  set visualbell                        " beep visually

  let s:neospace_layers_better_visual_activated = 1
endfunction

function! neospace#layers#better_visual#activated()
  return s:neospace_layers_better_visual_activated
endfunction
