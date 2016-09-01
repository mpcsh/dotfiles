" load plugins
execute pathogen#infect()
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
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" disable the bell
set vb t_vb=

" x clipboard access
set clipboard=unnamedplus

" enable line numbering
set number

" store all backup files centrally
set backupdir=$HOME/.config/nvim/tmp
set directory=$HOME/.config/nvim/tmp

" display tabs characters as 2 spaces
set tabstop=2
set shiftwidth=2

" use <Tab> to indent lines
vnoremap <Tab> >gv
" use <Shift-Tab> to unindent lines
noremap <S-Tab> <gv
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
	setlocal filetype=coffee
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

" easymotion settings
let mapleader=" "
noremap <Space> <Nop>
let g:EasyMotion_keys = "asdghklqwertyuiopzxcvbnmfj"	" get rid of ;
let g:EasyMotion_do_mapping = 0
map <Leader>w <Plug>(easymotion-bd-w)

" whitespace highlighting
if !(&filetype == "txt")
	set list " show special characters
	set listchars=tab:→\ ,trail:·
endif

" prefer // over /*...*/. Used by vim-commentary.
autocmd FileType c,java set commentstring=//\ %s
