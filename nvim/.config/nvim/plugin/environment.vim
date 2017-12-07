" disable the bell
set vb t_vb=

" enable line numbering
set number

" disable startup message
set shortmess+=I

" statusline
set laststatus=2

" auto reload changed files
set autoread

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard=unnamed

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase

" store all swap files centrally
set directory=$HOME/.config/nvim/tmp/swap/
if !isdirectory(expand(&directory))
	call mkdir(expand(&directory), 'p')
endif

" store all backup files centrally
set backupdir=$HOME/.config/nvim/tmp/backup/
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), 'p')
endif

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/tmp/undo/
set undolevels=500
set undoreload=500
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), 'p')
endif

" allow switching between buffers without writing
set hidden

" don't keep commenting on enter or o/O
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
