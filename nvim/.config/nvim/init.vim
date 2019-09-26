" load plugins
call plug#begin()

" colorscheme
Plug 'morhetz/gruvbox'
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

" override vim-sensible settings by default
runtime! plugin/sensible.vim
