" set leader key
let mapleader=","
let maplocalleader=" "
set timeoutlen=500
noremap <,> <Nop>

" make j and k move inside of a split line
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" make HJKL jump to the extreme of their lowercase counterparts
noremap <silent> H ^
noremap <silent> L $
noremap <silent> J G
noremap <silent> K gg

" disable "ex mode"
nnoremap Q <Nop>

" set <Tab>, <S-tab> to indent/unindent lines
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" normal mode equivalents
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" since CTRL-I and <Tab> are the same key (*sigh*), we need to unclobber the original CTRL-I binding.
nnoremap <leader>CTRL-I CTRL-I

" map CTRL-L to nohlsearch
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
inoremap <C-l> <Esc><C-l>a

" toggle relative line numbering
nnoremap <silent> <leader>r :set relativenumber!<CR>

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard=unnamedplus

" disable arrow keys
inoremap <Up> <Nop>
noremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <Down> <Nop>
inoremap <Left> <Nop>
noremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Right> <Nop>
