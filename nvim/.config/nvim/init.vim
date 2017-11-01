" load plugins
call plug#begin()

" colorscheme
Plug 'morhetz/gruvbox'                                   " gruvbox
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' } " nord
Plug 'icymind/neosolarized'                              " solarized

" environment
Plug 'tpope/vim-abolish'               " crazy text manipulation
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
Plug 'dag/vim-fish',              {'for': 'fish'}     " fish
Plug 'fatih/vim-go',              {'for': 'go'}       " go
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}  " haskell
Plug 'lervag/vimtex',             {'for': 'tex'}      " latex
Plug 'godlygeek/tabular',         {'for': 'markdown'} " necessary for markdown
Plug 'plasticboy/vim-markdown',   {'for': 'markdown'} " markdown
Plug 'rust-lang/rust.vim',        {'for': 'rust'}     " rust
Plug 'cespare/vim-toml',          {'for': 'toml'}     " toml

call plug#end()

let g:plug_window = 'new'
