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

" open new split panes to right and bottom
set splitbelow
set splitright

" no cursor styling
set guicursor=

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard=unnamedplus

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase

" store all backup files centrally
set backupdir=$HOME/.config/nvim/tmp
set directory=$HOME/.config/nvim/tmp

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" don't keep commenting on enter or o/O
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
