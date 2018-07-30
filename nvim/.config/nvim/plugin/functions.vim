" whitespace trimming
function StripWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
command! StripWhitespace call StripWhitespace()
