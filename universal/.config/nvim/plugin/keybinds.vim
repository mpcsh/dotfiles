" set leader key
let mapleader=","
let maplocalleader="\\"
set timeoutlen=100
noremap <,> <Nop>

" make j and k move inside of a split line
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" disable "ex mode"
nnoremap Q <Nop>

" set <Tab> to indent lines
vnoremap <Tab> >gv
" use <Shift-Tab> to unindent lines
noremap <S-Tab> <gv
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
