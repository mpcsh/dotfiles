" load plugins
runtime! bundle/sensible.vim

call plug#begin()

" sensible defaults
Plug 'tpope/vim-sensible'

" .c -> .h
Plug 'vim-scripts/a.vim'

" better commenting
Plug 'tpope/vim-commentary'

" easymotion!
Plug 'easymotion/vim-easymotion'

" filesystem browser
Plug 'scrooloose/nerdtree'

" pass(1) helper
Plug 'mpcsh/vim-pass'

" make . work for everything
Plug 'tpope/vim-repeat'

" replace with register
Plug 'vim-scripts/replacewithregister'

" lightline
Plug 'itchyny/lightline.vim'

" lightline gruvbox theme
Plug 'deens/lightline_gruvbox_theme'

" buffer bar
Plug 'ap/vim-buftabline'

" git integration
Plug 'tpope/vim-fugitive'


""" syntax
" gruvbox colors
Plug 'morhetz/gruvbox'

" rust
Plug 'rust-lang/rust.vim'

" coffeescript
Plug 'kchmck/vim-coffee-script'

" go
Plug 'fatih/vim-go'

" haskell
Plug 'neovimhaskell/haskell-vim'

" latex
Plug 'lervag/vimtex'

" toml
Plug 'cespare/vim-toml'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

let g:plug_window = 'new'
