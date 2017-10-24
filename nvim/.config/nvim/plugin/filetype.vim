" c
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()
function SetCOptions()
	setlocal filetype=c
	setlocal colorcolumn=81
	setlocal commentstring=//\ %s " prefer // over /*...*/ for single-line comments
endfunction

" git commit
autocmd FileType gitcommit call SetGitCommitOptions()
function SetGitCommitOptions()
	let b:deoplete_disable_auto_complete = 1
endfunction

" latex - fix "plaintex" filetype detection shit
autocmd BufNewFile,BufRead *.tex call SetLatexOptions()
function SetLatexOptions()
	setlocal filetype=tex
endfunction

" rust
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
function SetRustOptions()
	setlocal filetype=rust
	setlocal commentstring=//\ %s
endfunction

" yaml
autocmd FileType yaml call SetYamlOptions()
function SetYamlOptions()
	setlocal indentkeys-=<:>
endfunction
