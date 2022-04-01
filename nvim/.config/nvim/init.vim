"""""""""
" plugins
"""""""""

call plug#begin()

" colorscheme
Plug 'ayu-theme/ayu-vim'
Plug 'sainnhe/gruvbox-material'

" sensible defaults
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" ide features
if !exists('g:vscode')
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'wincent/terminus'
endif

call plug#end()


"""""""""""""
" colorscheme
"""""""""""""

if !exists('g:vscode')

set termguicolors
syntax enable

" let g:gruvbox_material_palette = "material"
" let g:gruvbox_material_background = "medium"
" let g:gruvbox_material_sign_column_background = "none"
" silent! colorscheme gruvbox-material
let ayucolor="mirage"
silent! colorscheme ayu

" remove tildes for blank lines
hi EndOfBuffer guifg=bg

" italic comments
hi Comment gui=italic

" closure highlighting
hi LinkDelimiter gui=bold
hi MatchParen gui=bold

endif


"""""""""""""
" environment
"""""""""""""

if !exists('g:vscode')

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

" always show sign column to prevent shifting due to diagnostics when the sign
" column isn't already showing
set signcolumn=yes

endif


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
