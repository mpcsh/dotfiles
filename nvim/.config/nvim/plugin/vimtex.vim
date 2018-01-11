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
  \   '-xelatex',
  \ ],
  \}

" skim support
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/skimpdf'
let g:vimtex_latexmk_progname = 'nvr'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
" let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']

" function! UpdateSkim(status)
"   if !a:status | return | endif

"   let l:out = b:vimtex.out()
"   let l:tex = expand('%:p')
"   let l:cmd = [g:vimtex_view_general_viewer, '-r']
"   if !empty(system('pgrep Skim'))
"     call extend(l:cmd, ['-g'])
"   endif
"   if has('nvim')
"     call jobstart(l:cmd + [line('.'), l:out, l:tex])
"   elseif has('job')
"     call job_start(l:cmd + [line('.'), l:out, l:tex])
"   else
"     call system(join(l:cmd + [line('.'),
"           \ shellescape(l:out), shellescape(l:tex)], ' '))
"   endif
" endfunction
