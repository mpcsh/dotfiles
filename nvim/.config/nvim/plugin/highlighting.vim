" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme nord

" italic comments
hi Comment gui=italic

" closure highlighting
hi link MatchParen LinkDelimiter

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" easymotion highlighting
hi EasyMotionTarget gui=none guibg=none guifg=#bf616a
hi EasyMotionTargetDefault gui=none guibg=none guifg=#bf616a
hi EasyMotionTarget2First gui=none guibg=none guifg=#bf616a
hi EasyMotionTarget2FirstDefault gui=none guibg=none guifg=#bf616a
hi EasyMotionTarget2Second gui=none guibg=none guifg=#bf616a
hi EasyMotionTarget2SecondDefault gui=none guibg=none guifg=#bf616a

" search highlighting
set hlsearch
