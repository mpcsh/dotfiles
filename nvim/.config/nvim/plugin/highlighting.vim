" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme gruvbox

" italic comments
hi Comment gui=italic

" closure highlighting
hi link MatchParen LinkDelimiter

" statusline
hi StatusLine gui=italic guibg=bg guifg=#928374

" visual selection
hi Visual gui=none guibg=#928374 guifg=bg

" indentation
hi SpecialKey guibg=bg guifg=#928374

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
