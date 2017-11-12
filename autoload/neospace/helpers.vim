function! neospace#helpers#download_file(url, destination, ...)
  if empty(glob(a:destination))
    let s:neospace_helpers_download_callback = get(a:, 1, 0)
    try
      echomsg a:destination . " does not exists!"
      echomsg "Downloading " . a:url . " to " . a:destination
      silent execute '!curl -fLo ' . a:destination . ' --create-dirs ' . a:url
      if s:neospace_helpers_download_callback != 0
        call s:neospace_helpers_download_callback()
      endif
    catch
      echoerr 'Could not download ' . a:url
    endtry
  endif
endfunction
