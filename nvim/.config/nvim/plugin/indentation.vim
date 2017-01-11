" 4-space width tabs
set tabstop=4
set shiftwidth=4

" whitespace highlighting
if !(&filetype == "txt")
	set list " show special characters
	set listchars=tab:⇢\ ,trail:·,extends:>,precedes:<,nbsp:‥
endif

" c
autocmd BufNewFile,BufRead *.c call SetCOptions()
autocmd BufNewFile,BufRead *.h call SetCOptions()
function SetCOptions()
	setlocal colorcolumn=81
	setlocal expandtab
endfunction

" markdown
autocmd BufNewFile,BufRead *.md call SetMarkdownOptions()
function SetMarkdownOptions()
	setlocal textwidth=80
endfunction

" haskell
autocmd BufNewFile,BufRead *.hs call SetHaskellOptions()
function SetHaskellOptions()
	setlocal expandtab
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
	setlocal expandtab
endfunction

" js indentation
autocmd BufNewFile,BufRead *.coffee set expandtab
autocmd BufNewFile,BufRead *.js set expandtab
autocmd BufNewFile,BufRead *.json set expandtab

" assembly indentation
autocmd BufNewFile,BufRead *.s call SetAsmOptions()
autocmd BufNewFile,BufRead *.as call SetAsmOptions()
autocmd BufNewFile,BufRead *.asm call SetAsmOptions()
function SetAsmOptions()
	setlocal tabstop=8
	setlocal nolist
endfunction
