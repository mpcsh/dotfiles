" load plugins
call pathogen#infect()
runtime! plugin/sensible.vim

" mouse compatibility
set mouse=a

" make j and k move inside of a split line
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" disable "ex mode"
nnoremap Q <Nop>

" persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" disable the bell
set vb t_vb=

" x clipboard access
set clipboard=unnamedplus

" enable line numbering
set number

" store all backup files centrally
set backupdir=$HOME/.vim/tmp
set directory=$HOME/.vim/tmp

" display tabs characters as 2 spaces
set tabstop=2
set shiftwidth=2

" use <Tab> to indent lines
noremap <Tab> <S-v>>
" use <Shift-Tab> to unindent lines
noremap <S-Tab> <S-v>>
" since CTRL-I and <Tab> are the same key (*sigh*), we need to unclobber the original CTRL-I binding.
nnoremap <leader>CTRL-I CTRL-I

" vim-sensible maps Ctrl-L to nohlsearch. let insert mode do that too.
imap <C-l> <Esc><C-l>a

" disable startup message
set shortmess+=I

" colorscheme
syntax enable
set background=dark
colorscheme sourcerer

" statusline
set laststatus=2
set statusline=\ %t\ %m\ %y%=[%04l][%02c]\ 

" ics
autocmd BufNewFile,BufRead *.iced call SetICSOptions()
function SetICSOptions()
	setlocal syntax=coffee
	setlocal commentstring=#\ %s
	setlocal expandtab
endfunction

" js indentation
autocmd BufNewFile,BufRead *.coffee set expandtab
autocmd BufNewFile,BufRead *.js set expandtab
autocmd BufNewFile,BufRead *.json set expandtab

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase
set hlsearch
