"mouse compatibility
set mouse=a

"no more arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"syntax highlighting
syntax on
au BufNewFile,BufRead *.iced set filetype=coffee

"x clipboard access
set clipboard=unnamedplus

"enable line numbering
set number

"disable backup files
set nobackup
set noswapfile

"display tabs characters as 2 spaces
set tabstop=2
set shiftwidth=2

"disable startup message
set shortmess+=I

"colorscheme
set t_Co=16
set background=light
colorscheme sourcerer

"statusline
set laststatus=2
set statusline=\ %t\ %m\ %y%=[%04l][%02c]\ 

"ics
execute pathogen#infect()
au BufNewFile,BufRead *.iced set expandtab
au BufNewFile,BufRead *.coffee set expandtab
au BufNewFile,BufRead *.js set expandtab
au BufNewFile,BufRead *.json set expandtab
