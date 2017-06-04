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

" C-l = nohlsearch, even in insert mode
imap <silent> <C-l> <Esc><C-l>a

" NERDTreeToggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
imap <silent> <C-n> <Esc><C-n>

" new buffer
noremap <leader>t :enew<CR>:edit 

" next buffer
noremap <silent> <leader><Tab> :bnext<CR>

" previous buffer
noremap <silent> <leader><S-Tab> :bprevious<CR>

" close current buffer and move to previous one
nnoremap <silent> <leader>w :bprevious <BAR> bdelete #<CR>

" EasyAlign
map ga <Plug>(EasyAlign)

" EasyMotion
map <Leader>e <Plug>(easymotion-bd-w)
