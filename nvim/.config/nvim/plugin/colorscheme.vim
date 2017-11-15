" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme gruvbox

" italic comments
hi Comment gui=italic

" closure highlighting
hi LinkDelimiter gui=bold guibg=none guifg=none
hi MatchParen gui=bold guibg=none guifg=none

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" don't underline tabline
hi TabLine gui=none
hi TabLineFill gui=none
hi TabLineSel gui=none

" search highlighting
set hlsearch
