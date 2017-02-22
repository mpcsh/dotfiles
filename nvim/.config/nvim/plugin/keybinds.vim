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

" vim-sensible maps Ctrl-L to nohlsearch; let insert mode do that too
imap <C-l> <Esc><C-l>a

" toggle relative line numbering
nnoremap <silent> <leader>r :set relativenumber!<CR>

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard=unnamedplus

" NERDTreeToggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
imap <silent> <C-n> <Esc><C-n>

" better split navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
