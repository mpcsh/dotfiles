" load plugins
execute pathogen#infect()

" mouse compatibility
set mouse=a

" make j and k move inside of a split line
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" disable "ex mode"
nnoremap Q <Nop>

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" disable the bell
set vb t_vb=

" x clipboard access
set clipboard=unnamedplus

" enable line numbering
set number

" store all backup files centrally
set backupdir=$HOME/.config/nvim/tmp
set directory=$HOME/.config/nvim/tmp

" 2-space width tabs
set tabstop=2
set shiftwidth=2

" se <Tab> to indent lines
vnoremap <Tab> >gv
" use <Shift-Tab> to unindent lines
noremap <S-Tab> <gv
" since CTRL-I and <Tab> are the same key (*sigh*), we need to unclobber the original CTRL-I binding.
nnoremap <leader>CTRL-I CTRL-I

" map CTRL-L to nohlsearch
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
inoremap <C-l> <Esc><C-l>a

" disable startup message
set shortmess+=I

" colorscheme
syntax enable
set background=dark
colorscheme solarized

" statusline
set laststatus=2
set statusline=\ %t\ %m\ %y%=[%04l]\ [%03c]\ 

" ics
autocmd BufNewFile,BufRead *.iced call SetICSOptions()
function SetICSOptions()
	setlocal filetype=coffee
	setlocal commentstring=#\ %s
	setlocal expandtab
endfunction

" js indentation
autocmd BufNewFile,BufRead *.coffee set expandtab
autocmd BufNewFile,BufRead *.js set expandtab
autocmd BufNewFile,BufRead *.json set expandtab

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase
set hlsearch

" easymotion settings
let mapleader=","
noremap <,> <Nop>
let g:EasyMotion_keys = "asdghklqwertyuiopzxcvbnmfj"	" get rid of ;
let g:EasyMotion_do_mapping = 0
map <Leader>w <Plug>(easymotion-bd-w)
hi EasyMotionTarget ctermbg=none ctermfg=1
hi EasyMotionTarget2First ctermbg=none ctermfg=1
hi EasyMotionTarget2Second ctermbg=none ctermfg=1

" prefer // over /*...*/. Used by vim-commentary.
autocmd FileType c,java set commentstring=//\ %s

" show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" whitespace highlighting
if !(&filetype == "txt")
	set list " show special characters
	set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:‥
endif

" auto reload changed files
set autoread

" goyo mode (distraction-free writing)
let g:goyo_width='100'
let g:goyo_height='75%'
function! s:goyo_enter()
	set wrap
	set linebreak
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
	set nowrap
	set nolinebreak
	" Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
