" markdown
autocmd BufNewFile,BufRead *.md call SetMarkdownOptions()
function SetMarkdownOptions()
  setlocal colorcolumn=81
  setlocal textwidth=80
endfunction

" yaml
autocmd BufNewFile,BufRead *.yml,*.yaml call SetYamlOptions()
function SetYamlOptions()
  setlocal indentkeys-=<:>
endfunction
