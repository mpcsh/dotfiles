" load plugins
call plug#begin()

" colorscheme
Plug 'arcticicestudio/nord-vim'

" sensible defaults
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/replacewithregister'
Plug 'vim-scripts/visualrepeat'
Plug 'wincent/terminus'

" language support
Plug 'dag/vim-fish'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'

" new features
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()


"""""""""""""
" colorscheme
"""""""""""""
" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme nord

" remove tildes for blank lines
hi EndOfBuffer guifg=bg

" closure highlighting
hi LinkDelimiter gui=bold guibg=none guifg=none
hi MatchParen gui=bold guibg=none guifg=none

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" italic comments
hi Comment gui=italic


"""""""""""""
" environment
"""""""""""""

" override vim-sensible settings by default
runtime! plugin/sensible.vim

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


""""""""""
" keybinds
""""""""""

" set leader key
let mapleader=","
let maplocalleader=","

" move inside of softwrapped lines
noremap <silent> j gj
noremap <silent> k gk

" make H/L jump to the extreme of their lowercase counterparts
noremap <silent> H g^
noremap <silent> L g$

" disable "ex mode"
nnoremap <silent> Q <Nop>

" set <Tab>, <S-tab> to indent/unindent lines
vnoremap <silent> <Tab> >gv
vnoremap <silent> <S-Tab> <gv

" normal mode equivalents
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<

" nohlsearch
noremap <silent> <C-l> :nohlsearch<CR>

" fzf
noremap <silent> <C-p> :Files<CR>


"""""""""""""""""""
" filetype-specific
"""""""""""""""""""

" javascript
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" yaml
autocmd BufNewFile,BufRead *.yml,*.yaml call SetYamlOptions()
function SetYamlOptions()
  setlocal indentkeys-=<:>
endfunction
