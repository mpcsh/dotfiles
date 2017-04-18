" load plugins
runtime! bundle/sensible.vim

call plug#begin()

" sensible defaults
Plug 'tpope/vim-sensible'

" surround
Plug 'tpope/vim-surround'

" .c -> .h
Plug 'vim-scripts/a.vim'

" {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}
Plug 'tpope/vim-abolish'

" better commenting
Plug 'tpope/vim-commentary'

" easymotion!
Plug 'easymotion/vim-easymotion'

" vim-notes!
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" filesystem browser
Plug 'scrooloose/nerdtree'

" pass(1) helper
Plug 'mpcsh/vim-pass'

" make . work for everything
Plug 'tpope/vim-repeat'

" replace with register
Plug 'vim-scripts/replacewithregister'

""" syntax
" gruvbox
Plug 'morhetz/gruvbox'

" rust syntax
Plug 'rust-lang/rust.vim'

" coffeescript syntax
Plug 'kchmck/vim-coffee-script'

" golang syntax
Plug 'fatih/vim-go'

" haskell syntax
Plug 'neovimhaskell/haskell-vim'

" latex
Plug 'lervag/vimtex'

" toml syntax
Plug 'cespare/vim-toml'

call plug#end()

let g:plug_window = 'new'
