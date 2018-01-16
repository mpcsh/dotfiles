let g:lightline = {
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'active': {
  \   'left':  [ ['filename'], ['modified', 'readonly'], ['fugitive'] ],
  \   'right': [ ['lineinfo'], ['filetype'] ]
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'colorscheme': 'nord',
\ }
