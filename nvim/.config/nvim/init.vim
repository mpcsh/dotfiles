" load plugins
runtime! bundle/sensible.vim

call plug#begin()
" environment
Plug 'ap/vim-buftabline'               " buffer bar
Plug 'tpope/vim-commentary'            " better commenting
Plug 'junegunn/vim-easy-align'         " easy alignment
Plug 'easymotion/vim-easymotion'       " easymotion!
Plug 'tpope/vim-fugitive'              " git integration
Plug 'itchyny/lightline.vim'           " lightline
Plug 'scrooloose/nerdtree'             " filesystem browser
Plug 'mpcsh/vim-pass'                  " pass(1) helper
Plug 'tpope/vim-repeat'                " make . work for everything
Plug 'vim-scripts/replacewithregister' " replace with register
Plug 'tpope/vim-sensible'              " sensible defaults
Plug 'tpope/vim-surround'              " delimiter manipulation
Plug 'vim-scripts/visualrepeat'        " make . work for *everything* (visual mode)

" colorscheme
Plug 'morhetz/gruvbox'               " gruvbox colors
Plug 'deens/lightline_gruvbox_theme' " lightline gruvbox theme

" languages
Plug 'kchmck/vim-coffee-script',  { 'for': 'coffee'}   " coffeescript
Plug 'fatih/vim-go',              { 'for': 'go'}       " go
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell'}  " haskell
Plug 'lervag/vimtex',             { 'for': 'tex'}      " latex
Plug 'godlygeek/tabular',         { 'for': 'markdown'} " necessary for markdown
Plug 'plasticboy/vim-markdown',   { 'for': 'markdown'} " markdown
Plug 'rust-lang/rust.vim',        { 'for': 'rust'}     " rust
Plug 'cespare/vim-toml',          { 'for': 'toml'}     " toml

call plug#end()

let g:plug_window = 'new'
