" 2-space width tabs
set tabstop=2
set shiftwidth=2

" whitespace highlighting
set list listchars=tab:·\ ,trail:·

" c
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()
function SetCOptions()
	setlocal ft=c
	setlocal colorcolumn=81
	setlocal commentstring=//\ %s " prefer // over /*...*/ for single-line comments
endfunction

" rust
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
function SetRustOptions()
	setlocal filetype=rust
	setlocal commentstring=//\ %s
endfunction

" latex - fix "plaintex" filetype detection shit
autocmd BufNewFile,BufRead *.tex call SetLatexOptions()
function SetLatexOptions()
	setlocal filetype=tex
endfunction

" yaml
autocmd BufNewFile,BufRead *.yaml call SetYamlOptions()
autocmd BufNewFile,BufRead *.yml call SetYamlOptions()
function SetYamlOptions()
	setlocal indentkeys-=<:>
endfunction
