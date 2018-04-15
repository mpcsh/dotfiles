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
