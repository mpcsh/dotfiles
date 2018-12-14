" load plugins
call plug#begin()

" colorscheme
Plug 'morhetz/gruvbox'

" sensible defaults
Plug 'ludovicchabant/vim-gutentags'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/replacewithregister'
Plug 'vim-scripts/visualrepeat'
Plug 'wincent/terminus'

" cosmetic enhancements
Plug 'junegunn/goyo.vim' " distraction-free mode

" language support
Plug 'ambv/black'
Plug 'baskerville/vim-sxhkdrc'
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
Plug 'lervag/vimtex'
Plug 'wlangstroth/vim-racket'

" new features
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

" override vim-sensible settings by default
runtime! plugin/sensible.vim
