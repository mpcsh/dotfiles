let g:lightline = {
	\ 'component': {
	\ 	'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	\ },
	\ 'active': {
	\ 	'left':  [ ['filename', 'modified'], ['readonly'], ['fugitive'] ],
	\ 	'right': [ ['filetype'], ['lineinfo'] ]
	\ },
	\ 'colorscheme': 'gruvbox_dark',
	\ }
