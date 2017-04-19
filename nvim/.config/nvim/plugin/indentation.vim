" 2 spaces for tabs
set tabstop=2
set shiftwidth=2
set expandtab

" whitespace highlighting
if !(&filetype == "txt")
	set list " show special characters
	set listchars=trail:!
endif

" c
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()
function SetCOptions()
	setlocal ft=c
	setlocal colorcolumn=81
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
	setlocal noexpandtab
endfunction

" ics
autocmd BufNewFile,BufRead *.iced call SetICSOptions()
function SetICSOptions()
	setlocal filetype=coffee
	setlocal commentstring=#\ %s
endfunction

" assembly
autocmd BufNewFile,BufRead *.s call SetAsmOptions()
autocmd BufNewFile,BufRead *.as call SetAsmOptions()
autocmd BufNewFile,BufRead *.asm call SetAsmOptions()
function SetAsmOptions()
	setlocal tabstop=8
	setlocal noexpandtab
endfunction

" latex
autocmd BufNewFile,BufRead *.tex call SetLatexOptions()
function SetLatexOptions()
	setlocal textwidth=80
endfunction
