function! neospace#helpers#download_file(url, destination, ...)
  if empty(glob(a:destination))
    let DownloadCallback= get(a:, 1, 0)
    try
      echomsg a:destination . " does not exists!"
      echomsg "Downloading " . a:url . " to " . a:destination
      silent execute '!curl -fLo ' . a:destination . ' --create-dirs ' . a:url
      if DownloadCallback != 0
        call DownloadCallback()
      endif
    catch
      echoerr 'Could not download ' . a:url
    endtry
  endif
endfunction

function! neospace#helpers#get_active_layers()
  return get(g:, 'neospace_active_layers', [])
endfunction
