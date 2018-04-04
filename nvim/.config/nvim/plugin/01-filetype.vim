" c
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()
function SetCOptions()
  setlocal filetype=c
  setlocal colorcolumn=81
  setlocal textwidth=80
  setlocal commentstring=//\ %s " prefer // over /*...*/ for single-line comments
  setlocal tabstop=4
  setlocal shiftwidth=4
endfunction

" java
autocmd BufNewFile,BufRead *.java call SetJavaOptions()
function SetJavaOptions()
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
  setlocal textwidth=80
endfunction

" rust
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
function SetRustOptions()
  setlocal filetype=rust
  setlocal commentstring=//\ %s
endfunction

" SML
autocmd BufNewFile,BufRead *.sml call SetSMLOptions()
function SetSMLOptions()
  setlocal filetype=sml
  setlocal commentstring=(*\ %s\ *)
  setlocal textwidth&
endfunction

" typescript
autocmd BufNewFile,BufRead *.ts call SetTSOptions()
function SetTSOptions()
  setlocal filetype=typescript
endfunction

" yaml
autocmd FileType yaml call SetYamlOptions()
function SetYamlOptions()
  setlocal indentkeys-=<:>
endfunction
