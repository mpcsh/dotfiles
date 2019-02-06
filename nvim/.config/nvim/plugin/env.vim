" search highlighting
set hlsearch

" disable the bell
set vb t_vb=

" enable line numbering
set number

" no startup message
set shortmess+=I

" no statusline
set laststatus=0

" no ruler
set noruler

" no mode
set noshowmode

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard+=unnamedplus

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

" don't keep commenting on enter or o/O
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" 2-space width tabs
set tabstop=2
set shiftwidth=2
set expandtab

" set up line wrapping http://vimcasts.org/episodes/soft-wrapping-text/
set wrap
set linebreak
set nolist

" don't open vim-plug output weird split buffers and shit
let g:plug_window = 'new'

" signify
let g:signify_update_on_focusgained = 1

" hide tag files in .git directories
let g:gutentags_cache_dir = '.git'
