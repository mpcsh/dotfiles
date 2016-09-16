" configure goyo dimensions
let g:goyo_width='100'
let g:goyo_height='75%'

" set line wrapping stuff, as well as quit-on-exit-goyo
function! s:goyo_enter()
	set wrap
	set linebreak
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

" quit vim when goyo exits as long as there are no other buffers open
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
