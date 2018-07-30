" c
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()
function SetCOptions()
  setlocal filetype=c
  setlocal colorcolumn=81
  setlocal tabstop=4
  setlocal shiftwidth=4
endfunction

" latex - fix "plaintex" filetype detection shit
autocmd BufNewFile,BufRead *.tex call SetLatexOptions()
function SetLatexOptions()
  setlocal filetype=tex
endfunction

" markdown
autocmd BufNewFile,BufRead *.md call SetMarkdownOptions()
function SetMarkdownOptions()
  setlocal colorcolumn=81
  setlocal textwidth=80
endfunction

" rust
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
function SetRustOptions()
  setlocal filetype=rust
endfunction

" SML
autocmd BufNewFile,BufRead *.sml call SetSMLOptions()
function SetSMLOptions()
  setlocal filetype=sml
  setlocal textwidth&
  setlocal commentstring=(*\ %s\ *)
endfunction

" yaml
autocmd FileType yaml call SetYamlOptions()
function SetYamlOptions()
  setlocal indentkeys-=<:>
endfunction
