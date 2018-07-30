" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme gruvbox

" sign column
hi clear SignColumn
hi GruvboxAquaSign guibg=bg
hi GruvboxBlueSign guibg=bg
hi GruvboxGreenSign guibg=bg
hi GruvboxPurpleSign guibg=bg
hi GruvboxRedSign guibg=bg
hi GruvboxYellowSign guibg=bg

" remove tildes for blank lines
hi EndOfBuffer guifg=bg

" closure highlighting
hi LinkDelimiter gui=bold guibg=none guifg=none
hi MatchParen gui=bold guibg=none guifg=none

" visual selection
hi Visual gui=none guibg=fg guifg=bg

