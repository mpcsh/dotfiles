" load plugins
call plug#begin()

" colorscheme
Plug 'arcticicestudio/nord-vim' " nord

" sensible defaults
Plug 'tpope/vim-repeat'                " make . work for everything
Plug 'tpope/vim-sensible'              " sensible defaults
Plug 'vim-scripts/replacewithregister' " replace with register
Plug 'vim-scripts/visualrepeat'        " make . work for in visual mode
Plug 'wincent/terminus'                " auto read, bracketed paste

" cosmetic enhancements
Plug 'ap/vim-buftabline'     " buffer bar
Plug 'itchyny/lightline.vim' " lightline
Plug 'mhinz/vim-signify'     " git status in gutter

" language support
Plug 'fatih/vim-go'            " go
Plug 'godlygeek/tabular'       " markdown
Plug 'jez/vim-better-sml'      " standard ML
Plug 'lervag/vimtex'           " LaTeX
Plug 'LnL7/vim-nix'            " nix
Plug 'plasticboy/vim-markdown' " markdown
Plug 'wlangstroth/vim-racket'  " racket

" new features
Plug 'junegunn/fzf', {'dir' : '~/.fzf', 'do' : './install --all'} " fzf
Plug 'junegunn/fzf.vim'                                           " fzf
Plug 'junegunn/vim-easy-align'                                    " easy alignment
Plug 'tpope/vim-commentary'                                       " better commenting
Plug 'tpope/vim-surround'                                         " delimiter manipulation

" completion
if has('python3')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'
endif

call plug#end()

let g:plug_window = 'new'
