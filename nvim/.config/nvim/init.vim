" load plugins
call plug#begin()

" colorscheme
Plug 'arcticicestudio/nord-vim'

" sensible defaults
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/replacewithregister'
Plug 'vim-scripts/visualrepeat'

" cosmetic enhancements
Plug 'junegunn/goyo.vim'      " distraction-free mode

" language support
Plug 'lervag/vimtex'             " LaTeX

call plug#end()

" don't open vim-plug output weird split buffers and shit
let g:plug_window = 'new'
