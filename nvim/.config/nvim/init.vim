" load plugins
call plug#begin()

" colorscheme
Plug 'morhetz/gruvbox'

" sensible defaults
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/replacewithregister'
Plug 'vim-scripts/visualrepeat'
Plug 'wincent/terminus'

" cosmetic enhancements
Plug 'junegunn/goyo.vim' " distraction-free mode

" language support
Plug 'baskerville/vim-sxhkdrc'
Plug 'cespare/vim-toml'
Plug 'lervag/vimtex'
Plug 'wlangstroth/vim-racket'

" new features
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

call plug#end()

" override vim-sensible settings by default
runtime! plugin/sensible.vim
