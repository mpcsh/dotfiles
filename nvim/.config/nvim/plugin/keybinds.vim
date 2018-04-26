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

" new buffer
noremap <leader>t :enew<CR>:Files<CR>

" next buffer
noremap <silent> <leader><Tab> :bnext<CR>

" previous buffer
noremap <silent> <leader><S-Tab> :bprevious<CR>

" close current buffer
function CloseBuffer()
  " count up buffers
  let bufferCount = 0
  for i in range(0, bufnr("$"))
    if buflisted(i)
      let bufferCount += 1
    endif
  endfor

  " if we're on the last buffer, quit
  if bufferCount <= 1
    quit

  " otherwise just write and bdelete
  else
    write
    bdelete
  endif

endfunction
nnoremap <silent> <leader>w :silent! call CloseBuffer()<CR>

" EasyAlign
map <Leader>a <Plug>(EasyAlign)
