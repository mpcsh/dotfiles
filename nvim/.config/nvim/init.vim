" load plugins
call plug#begin()

" colorscheme
Plug 'arcticicestudio/nord-vim' " nord

" sensible defaults
Plug 'tpope/vim-sensible'              " sensible defaults
Plug 'tpope/vim-repeat'                " make . work for everything
Plug 'vim-scripts/replacewithregister' " replace with register
Plug 'wincent/terminus'                " auto read, bracketed paste
Plug 'vim-scripts/visualrepeat'        " make . work for in visual mode

" cosmetic enhancements
Plug 'ap/vim-buftabline'     " buffer bar
Plug 'mhinz/vim-signify'     " git status in gutter
Plug 'itchyny/lightline.vim' " lightline

" language support
Plug 'sheerun/vim-polyglot' " syntax plugins for most languages
Plug 'lervag/vimtex'        " LaTeX

" new features
Plug 'jiangmiao/auto-pairs'                                       " auto delimiter pairing
Plug 'tpope/vim-commentary'                                       " better commenting
Plug 'junegunn/vim-easy-align'                                    " easy alignment
Plug 'junegunn/fzf', {'dir' : '~/.fzf', 'do' : './install --all'} " fzf
Plug 'junegunn/fzf.vim'                                           " fzf
Plug 'tpope/vim-surround'                                         " delimiter manipulation

" completion
if has('python3')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'
endif

call plug#end()

let g:plug_window = 'new'
