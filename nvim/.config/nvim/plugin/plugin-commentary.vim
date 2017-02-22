" prefer // over /*...*/. Used by vim-commentary.
autocmd FileType c set commentstring=//\ %s

" only do the auto-insertion for multiline comments
autocmd FileType c setlocal comments-=:// comments+=f://
autocmd FileType vim setlocal comments-=:\" comments+=f:\"
