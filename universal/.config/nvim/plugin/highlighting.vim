" colorscheme
syntax enable
set background=dark
colorscheme solarized

" whitespace highlighting
hi SpecialKey cterm=none ctermbg=bg ctermfg=none

" visual selection
hi Visual cterm=none ctermbg=15 ctermfg=none

" closure highlighting
hi MatchParen cterm=none ctermbg=15 ctermfg=none

" show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase
set hlsearch
