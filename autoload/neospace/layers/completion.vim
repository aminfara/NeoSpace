let s:neospace_layers_completion_activated = 0

function! neospace#layers#completion#plugins()
  function! UpdateRemotePlugins(arg)
    UpdateRemotePlugins
  endfunction

  return [
        \ ['Shougo/context_filetype.vim', { 'on': [] }],
        \ ['Shougo/neoinclude.vim', { 'on': [] }],
        \ ['Shougo/deoplete.nvim', { 'do': function('UpdateRemotePlugins'), 'on': [] }],
        \ ['SirVer/ultisnips', { 'on': [] }],
        \ ['honza/vim-snippets', { 'on': [] }]
        \]
endfunction

function! neospace#layers#completion#configs()
  call s:neospace_layers_completion_lazy_load()

  if neospace#plugins#plugin_exists('Shougo/deoplete.nvim')
    " Use deoplete.
    let g:deoplete#enable_at_startup = 1
    " Use smartcase.
    let g:deoplete#enable_smart_case = 1

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
  endif

  if neospace#plugins#plugin_exists('SirVer/ultisnips')
    " Trigger configuration. Removed to mix it with deoplete.
    let g:UltiSnipsExpandTrigger = '<nop>'
    let g:UltiSnipsJumpForwardTrigger = '<nop>'
    let g:UltiSnipsJumpBackwardTrigger = '<nop>'

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit = 'vertical'

    inoremap <silent> <expr> <CR> pumvisible() ? "<C-y><C-R>=UltiSnips#ExpandSnippet()<CR>" : "\<CR>"

    inoremap <silent> <expr> <TAB> pumvisible() ? "\<C-n>" :
          \ "<C-R>=<SID>neospace_layers_completion_expand_snippet_or_key(\"\t\")<CR>"
    snoremap <silent> <TAB> <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
    inoremap <silent> <expr> <S-TAB> pumvisible() ? "\<C-p>" : "<C-R>=UltiSnips#JumpBackwards()<CR>"
    snoremap <silent> <S-TAB> <Esc>:call UltiSnips#JumpBackwards()<CR>
  endif

  let s:neospace_layers_completion_activated = 1
endfunction

function! neospace#layers#completion#activated()
  return s:neospace_layers_completion_activated
endfunction

function! s:neospace_layers_completion_expand_snippet_or_key(key) abort
  let g:ulti_expand_or_jump_res = 0
  let l:snippet = UltiSnips#ExpandSnippetOrJump()
  return (g:ulti_expand_or_jump_res > 0) ? l:snippet : a:key
endfunction

function! s:neospace_layers_completion_lazy_load()
  augroup neospace_layers_completion_lazy_load
    autocmd!
    if neospace#plugins#plugin_exists('Shougo/context_filetype')
      autocmd InsertEnter * call plug#load('context_filetype')
    endif

    if neospace#plugins#plugin_exists('Shougo/neoinclude')
      autocmd InsertEnter * call plug#load('neoinclude')
    endif

    if neospace#plugins#plugin_exists('SirVer/UltiSnips')
      autocmd InsertEnter * call plug#load('ultisnips')
    endif

    if neospace#plugins#plugin_exists('honza/vim-snippets')
      autocmd InsertEnter * call plug#load('vim-snippets')
    endif

    if neospace#plugins#plugin_exists('Shougo/deoplete.nvim')
      autocmd InsertEnter * call plug#load('deoplete.nvim') |
            \ autocmd! neospace_layers_completion_lazy_load
    endif
  augroup END
endfunction
