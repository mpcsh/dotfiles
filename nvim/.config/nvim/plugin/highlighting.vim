" colorscheme
syntax enable
set background=dark
colorscheme gruvbox

" italic comments
hi Comment cterm=italic

" closure highlighting
hi MatchParen cterm=none ctermbg=none ctermfg=15
hi link MatchParen LinkDelimiter

" statusline
hi StatusLine cterm=none ctermbg=0 ctermfg=8

" visual selection
hi Visual cterm=none ctermbg=8 ctermfg=0

" show highlighting groups for current word
nmap <C-S-s> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" search highlighting
set hlsearch

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase
