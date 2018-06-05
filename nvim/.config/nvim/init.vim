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
Plug 'lervag/vimtex'

" new features
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'

call plug#end()

" override vim-sensible settings by default
runtime! plugin/sensible.vim

" don't open vim-plug output weird split buffers and shit
let g:plug_window = 'new'

" c
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()
function SetCOptions()
  setlocal filetype=c
  setlocal colorcolumn=81
  setlocal tabstop=4
  setlocal shiftwidth=4
endfunction

" latex - fix "plaintex" filetype detection shit
autocmd BufNewFile,BufRead *.tex call SetLatexOptions()
function SetLatexOptions()
  setlocal filetype=tex
endfunction

" markdown
autocmd BufNewFile,BufRead *.md call SetMarkdownOptions()
function SetMarkdownOptions()
  setlocal colorcolumn=81
  setlocal textwidth=80
endfunction

" rust
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
function SetRustOptions()
  setlocal filetype=rust
endfunction

" SML
autocmd BufNewFile,BufRead *.sml call SetSMLOptions()
function SetSMLOptions()
  setlocal filetype=sml
  setlocal textwidth&
  setlocal commentstring=(*\ %s\ *)
endfunction

" yaml
autocmd FileType yaml call SetYamlOptions()
function SetYamlOptions()
  setlocal indentkeys-=<:>
endfunction

" colorscheme
set termguicolors
syntax enable
set background=dark
colorscheme gruvbox

" sign column
hi clear SignColumn
hi GruvboxAquaSign guibg=bg
hi GruvboxBlueSign guibg=bg
hi GruvboxGreenSign guibg=bg
hi GruvboxPurpleSign guibg=bg
hi GruvboxRedSign guibg=bg
hi GruvboxYellowSign guibg=bg

" remove tildes for blank lines
hi EndOfBuffer guifg=bg

" closure highlighting
hi LinkDelimiter gui=bold guibg=none guifg=none
hi MatchParen gui=bold guibg=none guifg=none

" visual selection
hi Visual gui=none guibg=fg guifg=bg

" search highlighting
set hlsearch

" disable the bell
set vb t_vb=

" enable line numbering
set number

" no startup message
set shortmess+=I

" no statusline
set laststatus=0

" no ruler
set noruler

" no mode
set noshowmode

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard+=unnamedplus

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase

" store all swap files centrally
set directory=$HOME/.config/nvim/tmp/swap/
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), 'p')
endif

" store all backup files centrally
set backupdir=$HOME/.config/nvim/tmp/backup/
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), 'p')
endif

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/tmp/undo/
set undolevels=500
set undoreload=500
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

" don't keep commenting on enter or o/O
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" 2-space width tabs
set tabstop=2
set shiftwidth=2
set expandtab

" display whitespace
set list

" set leader key
let mapleader=","
let maplocalleader=","

" move inside of softwrapped lines
noremap <silent> j gj
noremap <silent> k gk

" make HJKL jump to the extreme of their lowercase counterparts
noremap <silent> H ^
noremap <silent> J G
noremap <silent> K gg
noremap <silent> L $

" disable "ex mode"
nnoremap <silent> Q <Nop>

" set <Tab>, <S-tab> to indent/unindent lines
vnoremap <silent> <Tab> >gv
vnoremap <silent> <S-Tab> <gv

" normal mode equivalents
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<

" nohlsearch
noremap <silent> <C-l> :nohlsearch<CR>

" vimtex
let g:vimtex_compiler_latexmk = {
  \ 'background' : 1,
  \ 'build_dir' : 'build',
  \ 'callback' : 1,
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'options' : [
  \   '-pdf',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \}

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

" signify
let g:signify_update_on_focusgained = 1

" whitespace trimming
function StripWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
command! StripWhitespace call StripWhitespace()
