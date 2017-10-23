" load plugins
call plug#begin()

" colorscheme
Plug 'morhetz/gruvbox'                                   " gruvbox
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' } " nord
Plug 'icymind/neosolarized'                              " solarized

" environment
Plug 'ap/vim-buftabline'               " buffer bar
Plug 'tpope/vim-commentary'            " better commenting
Plug 'junegunn/vim-easy-align'         " easy alignment
Plug 'easymotion/vim-easymotion'       " easymotion!
Plug '/usr/local/opt/fzf'              " fzf
Plug 'junegunn/fzf.vim'                " fzf
Plug 'tpope/vim-fugitive'              " git integration
Plug 'airblade/vim-gitgutter'          " git status in gutter
Plug 'itchyny/lightline.vim'           " lightline
Plug 'tpope/vim-repeat'                " make . work for everything
Plug 'vim-scripts/replacewithregister' " replace with register
Plug 'tpope/vim-surround'              " delimiter manipulation
Plug 'vim-scripts/visualrepeat'        " make . work for in visual mode

" languages
Plug 'dag/vim-fish'              " fish
Plug 'neovimhaskell/haskell-vim' " haskell
Plug 'lervag/vimtex'             " latex
Plug 'godlygeek/tabular'         " necessary for markdown
Plug 'plasticboy/vim-markdown'   " markdown
Plug 'rust-lang/rust.vim'        " rust
Plug 'cespare/vim-toml'          " toml

call plug#end()

let g:plug_window = 'new'
