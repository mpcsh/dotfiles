" set leader key
let mapleader=","
let maplocalleader=","

" move inside of softwrapped lines
noremap <silent> j gj
noremap <silent> k gk

" make HJKL jump to the extreme of their lowercase counterparts
noremap <silent> H ^
noremap <silent> L $
noremap <silent> J G
noremap <silent> K gg

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

" fzf is the new ctrlp
noremap <C-p> :Files<CR>

" new tab
noremap <leader>t :tabnew<CR>:Files<CR>

" next tab
noremap <silent> <leader><Tab> :tabnext<CR>

" previous tab
noremap <silent> <leader><S-Tab> :tabprevious<CR>

" close current tab
nnoremap <silent> <leader>w :q<CR>

" EasyAlign
map <Leader>a <Plug>(EasyAlign)
