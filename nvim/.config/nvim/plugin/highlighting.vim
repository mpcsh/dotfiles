" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme NeoSolarized

" italic comments
hi Comment gui=italic

" closure highlighting
hi link MatchParen LinkDelimiter

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" don't underline tabline
hi TabLine gui=none
hi TabLineFill gui=none
hi TabLineSel gui=none

" search highlighting
set hlsearch
