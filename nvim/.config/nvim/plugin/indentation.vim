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

" markdown
autocmd BufNewFile,BufRead *.md call SetMarkdownOptions()
function SetMarkdownOptions()
	setlocal textwidth=80
	setlocal colorcolumn=81
endfunction

" rust
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
function SetRustOptions()
	setlocal filetype=rust
	setlocal commentstring=//\ %s
endfunction

" ics
autocmd BufNewFile,BufRead *.iced call SetICSOptions()
function SetICSOptions()
	setlocal filetype=coffee
	setlocal commentstring=#\ %s
	setlocal expandtab
endfunction

" assembly
autocmd BufNewFile,BufRead *.s call SetAsmOptions()
autocmd BufNewFile,BufRead *.as call SetAsmOptions()
autocmd BufNewFile,BufRead *.asm call SetAsmOptions()
function SetAsmOptions()
	setlocal tabstop=8
endfunction

" latex
autocmd BufNewFile,BufRead *.tex call SetLatexOptions()
function SetLatexOptions()
	setlocal filetype=tex
	setlocal textwidth=80
	setlocal colorcolumn=81
endfunction
