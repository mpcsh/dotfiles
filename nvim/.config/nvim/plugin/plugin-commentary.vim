" prefer // over /*...*/ for single-line C comments
autocmd FileType c set commentstring=//\ %s

" don't keep commenting on enter or o/O
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
