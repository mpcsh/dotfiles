" colorscheme
syntax enable
set background=dark
colorscheme solarized

" italic comments
hi Comment cterm=italic

" closure highlighting
hi MatchParen cterm=none ctermbg=none ctermfg=15
hi link MatchParen LinkDelimiter

" indentation highlighting
hi SpecialKey cterm=none ctermbg=none ctermfg=11

" show highlighting groups for current word
nmap <C-S-s> :call <SID>SynStack()<CR>
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
