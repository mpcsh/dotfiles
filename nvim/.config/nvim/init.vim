" load plugins
call plug#begin()

" colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" sensible defaults
Plug 'ludovicchabant/vim-gutentags'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-repeat'
Plug 'wincent/terminus'

" language support
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" new features
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()


"""""""""""""
" colorscheme
"""""""""""""

set termguicolors
syntax enable
set background=dark
silent! colorscheme gruvbox

" remove tildes for blank lines
hi EndOfBuffer guifg=bg

" closure highlighting
hi LinkDelimiter gui=bold
hi MatchParen gui=bold

" italic comments
hi Comment gui=italic


""""""""""""""
" ide features
""""""""""""""

let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\}

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier'],
\}


"""""""""""""
" environment
"""""""""""""

" short updatetime https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100

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

" disable swap, backup files
set noswapfile
set nobackup
set nowritebackup

" persistent undo
set undofile
set undodir=$HOME/.cache/nvim/undo/
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

" tags
let g:gutentags_cache_dir = expand('~/.cache/nvim/tags/')

" spellchecking
set spellfile=$HOME/.cache/nvim/spellfile.utf-8.add
autocmd BufNewFile,BufRead *.md setlocal spell

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

" vsplit right, hsplit down
set splitright
set splitbelow

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_diff_args = '-w'


""""""""""
" keybinds
""""""""""

" reload vimrc
nnoremap <silent> <leader>r :source ~/.config/nvim/init.vim<CR>

" move inside of softwrapped lines
noremap <silent> j gj
noremap <silent> k gk

" make H/L jump to the extreme of their lowercase counterparts
noremap <silent> H g^
noremap <silent> L g$

" disable 'ex mode'
nnoremap <silent> Q <Nop>

" set <Tab>, <S-tab> to indent/unindent lines
vnoremap <silent> <Tab> >gv
vnoremap <silent> <S-Tab> <gv
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<

" nohlsearch
noremap <silent> <C-l> :nohlsearch<CR>

" search for visual selection
vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

" fzf
noremap <silent> <C-p> :Files<CR>
