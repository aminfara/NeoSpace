let g:neospace_config_home = fnamemodify(resolve(expand("<sfile>:p")), ":p:h")
let g:neospace_data_home = resolve(expand("~/.local/share/nvim"))
let g:neospace_user_config = expand("~/.neospace.vim")

let mapleader = "\<Space>"

if empty(glob(g:neospace_user_config))
  silent execute "!cp " . g:neospace_config_home . "/default_user_config.vim "
          \ . g:neospace_user_config
endif

execute "source " . g:neospace_user_config

let g:neospace_active_layers = get(g:, 'neospace_active_layers', [])
for layer in g:neospace_active_layers
  execute "call neospace#layers#" . layer . "#configs()"
endfor
