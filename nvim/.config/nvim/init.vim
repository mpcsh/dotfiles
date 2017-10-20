" load plugins
runtime! bundle/sensible.vim

call plug#begin()

" colorscheme
Plug 'arcticicestudio/nord-vim' " nord colors
Plug 'morhetz/gruvbox'          " nord colors

" environment
Plug 'ap/vim-buftabline'               " buffer bar
Plug 'tpope/vim-commentary'            " better commenting
Plug 'junegunn/vim-easy-align'         " easy alignment
Plug 'easymotion/vim-easymotion'       " easymotion!
Plug 'tpope/vim-fugitive'              " git integration
Plug 'itchyny/lightline.vim'           " lightline
Plug 'ctrlpvim/ctrlp.vim'              " fuzzy finder
Plug 'tpope/vim-repeat'                " make . work for everything
Plug 'vim-scripts/replacewithregister' " replace with register
Plug 'tpope/vim-sensible'              " sensible defaults
Plug 'tpope/vim-surround'              " delimiter manipulation
Plug 'vim-scripts/visualrepeat'        " make . work for *everything* (visual mode)

" languages
Plug 'kchmck/vim-coffee-script'  " coffeescript
Plug 'dag/vim-fish'              " fish
Plug 'fatih/vim-go'              " go
Plug 'neovimhaskell/haskell-vim' " haskell
Plug 'lervag/vimtex'             " latex
Plug 'godlygeek/tabular'         " necessary for markdown
Plug 'plasticboy/vim-markdown'   " markdown
Plug 'rust-lang/rust.vim'        " rust
Plug 'cespare/vim-toml'          " toml

call plug#end()

let g:plug_window = 'new'
