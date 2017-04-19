let g:lightline = {
	\ 'component': {
	\ 	'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	\ },
	\ 'active': {
	\ 	'left':  [ ['filename', 'readonly'], ['modified'], ['fugitive'] ],
	\ 	'right': [ ['lineinfo'], ['filetype'] ]
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'colorscheme': 'gruvbox_dark',
\ }
