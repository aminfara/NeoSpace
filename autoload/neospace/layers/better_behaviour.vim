let s:neospace_layers_better_behaviour_activated = 0

function! neospace#layers#better_behaviour#plugins()
  return []
endfunction

function! neospace#layers#better_behaviour#configs()
  ""
  " Files and directories (vim related)
  "
  set nobackup
  set noswapfile
  set undofile
  set undolevels=2000
  set autowriteall

  ""
  " Indentation
  "
  set expandtab
  set shiftwidth=2
  set tabstop=2

  ""
  " Input timeout
  "
  set ttimeout
  set ttimeoutlen=100

  ""
  " Search
  "
  set ignorecase
  set smartcase

  ""
  " Wild menu
  "
  " wildmenu is set by sensible
  set wildmode=longest,full
  set wildignore=build,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

  ""
  " Miscellaneous
  "
  set completeopt+=noinsert             " causes completion to select first choice
  set hidden                            " enable multiple modified buffer
  set omnifunc=syntaxcomplete#Complete  " turn on builtin auto-completion
  set switchbuf=useopen,usetab,newtab   " switching buffers behaviour

  " remove trailing whitespace on save
  augroup neospace_layers_better_behaviour
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END

  let s:neospace_layers_better_behaviour_activated = 1
endfunction

function! neospace#layers#better_behaviour#activated()
  return s:neospace_layers_better_behaviour_activated
endfunction
