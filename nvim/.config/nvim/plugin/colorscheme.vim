" brighten comments
let g:nord_comment_brightness = 7

" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme nord

" italic comments
hi Comment gui=italic

" closure highlighting
hi LinkDelimiter gui=bold guibg=none guifg=none
hi MatchParen gui=bold guibg=none guifg=none

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" search highlighting
set hlsearch
