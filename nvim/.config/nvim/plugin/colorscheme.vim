" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme nord

" remove tildes for blank lines
hi EndOfBuffer guifg=bg

" closure highlighting
hi LinkDelimiter gui=bold guibg=none guifg=none
hi MatchParen gui=bold guibg=none guifg=none

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" search highlighting
set hlsearch
