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
  " Line numbers
  "
  set number relativenumber
  augroup neospace_layers_better_visual_line_numbers
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

  ""
  " Miscellaneous
  "
  set cursorline                        " draws a line to show the current line
  set noshowmode                        " don't show mode, status bar plugin will show it
  set ruler                             " show cursor position
  set showcmd                           " show partial command
  set visualbell                        " beep visually

  call s:neospace_layers_better_visual_terminal()

  let s:neospace_layers_better_visual_activated = 1
endfunction

function! neospace#layers#better_visual#activated()
  return s:neospace_layers_better_visual_activated
endfunction

function! s:neospace_layers_better_visual_terminal()
  if $COLORTERM == 'gnome-terminal'
    set term='xterm-256color'
  endif

  " Setting color to 16 for xterm
  if $TERM == "xterm" || $TERM == 'screen'
    set t_Co=16
    " clearing using the current background color
    set t_ut=
  endif

  " Setting color to 256 for more sophisticated terminals
  if $TERM =~ '256color'
    set t_Co=256
    " clearing using the current background color
    set t_ut=
  endif
endfunction
