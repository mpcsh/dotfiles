set background=light
hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "pane"

"  █▓▒░ 256 colors 
hi Normal                 cterm=none             ctermbg=none  ctermfg=none
" hi CursorColumn           cterm=none             ctermbg=16    ctermfg=fg
" hi CursorLine             cterm=none             ctermbg=236   ctermfg=fg
" hi DiffAdd                cterm=none             ctermbg=71    ctermfg=16
" hi DiffDelete             cterm=none             ctermbg=124   ctermfg=16
" hi DiffChange             cterm=none             ctermbg=68    ctermfg=16
" hi DiffText               cterm=none             ctermbg=117   ctermfg=16
" hi Directory              cterm=none             ctermbg=234   ctermfg=33
" hi ErrorMsg               cterm=bold             ctermbg=none  ctermfg=203
" hi FoldColumn             cterm=bold             ctermbg=239   ctermfg=66
" hi Folded                 cterm=none             ctermbg=16    ctermfg=60
hi IncSearch              cterm=none             ctermbg=0   ctermfg=none
hi MatchParen             cterm=none             ctermbg=0  ctermfg=15
" hi ModeMsg                cterm=bold             ctermbg=none  ctermfg=145
" hi MoreMsg                cterm=bold             ctermbg=234   ctermfg=29
" hi NonText                cterm=none             ctermbg=none  ctermfg=59
" hi Pmenu                  cterm=none             ctermbg=238   ctermfg=231
" hi PmenuSbar              cterm=none             ctermbg=250   ctermfg=fg
" hi PmenuSel               cterm=none             ctermbg=149   ctermfg=16
" hi Question               cterm=bold             ctermbg=none  ctermfg=46
hi Search                 cterm=none             ctermbg=0   ctermfg=none
" hi SignColumn             cterm=none             ctermbg=none  ctermfg=231
hi SpecialKey             cterm=none             ctermbg=none  ctermfg=0
" hi SpellBad               cterm=undercurl        ctermbg=none  ctermfg=196
" hi SpellCap               cterm=undercurl        ctermbg=none  ctermfg=21
" hi SpellLocal             cterm=undercurl        ctermbg=none  ctermfg=30
" hi SpellRare              cterm=undercurl        ctermbg=none  ctermfg=201
" hi VertSplit              cterm=none             ctermbg=102   ctermfg=102
" hi TabLine                cterm=bold             ctermbg=102   ctermfg=16
" hi TabLineFill            cterm=none             ctermbg=102   ctermfg=16
" hi TabLineSel             cterm=bold             ctermbg=16    ctermfg=59
" hi Title                  cterm=bold             ctermbg=none  ctermfg=66
" hi WarningMsg             cterm=none             ctermbg=234   ctermfg=208
" hi WildMenu               cterm=none             ctermbg=116   ctermfg=16
" hi ExtraWhitespace        cterm=none             ctermbg=66    ctermfg=fg

hi Boolean                cterm=none             ctermbg=none  ctermfg=9
hi String                 cterm=none             ctermbg=none  ctermfg=2
hi Identifier             cterm=none             ctermbg=none  ctermfg=none
hi Function               cterm=none             ctermbg=none  ctermfg=5
hi Type                   cterm=none             ctermbg=none  ctermfg=1
hi Statement              cterm=none             ctermbg=none  ctermfg=6
hi Keyword                cterm=none             ctermbg=none  ctermfg=3
hi Constant               cterm=none             ctermbg=none  ctermfg=3
hi Number                 cterm=none             ctermbg=none  ctermfg=3
hi Special                cterm=none             ctermbg=none  ctermfg=3
hi PreProc                cterm=none             ctermbg=none  ctermfg=3

" hi diffOldFile            cterm=none             ctermbg=none  ctermfg=67
" hi diffNewFile            cterm=none             ctermbg=none  ctermfg=67
" hi diffFile               cterm=none             ctermbg=none  ctermfg=67
" hi diffLine               cterm=none             ctermbg=none  ctermfg=67
" hi diffAdded              cterm=none             ctermfg=none  ctermfg=71
" hi diffRemoved            cterm=none             ctermfg=none  ctermfg=124
" hi diffChanged            cterm=none             ctermfg=none  ctermfg=68
" hi link             diffSubname     diffLine
" hi link             diffOnly        Constant
" hi link             diffIdentical   Constant
" hi link             diffDiffer      Constant
" hi link             diffBDiffer     Constant
" hi link             diffIsA         Constant
" hi link             diffNoEOL       Constant
" hi link             diffCommon      Constant
" hi link             diffComment     Constant

" hi pythonClass            cterm=none             ctermbg=none  ctermfg=fg
" hi pythonDecorator        cterm=none             ctermbg=none  ctermfg=101
" hi pythonExClass          cterm=none             ctermbg=none  ctermfg=95
" hi pythonException        cterm=none             ctermbg=none  ctermfg=110
" hi pythonFunc             cterm=none             ctermbg=none  ctermfg=fg
" hi pythonFuncParams       cterm=none             ctermbg=none  ctermfg=fg
" hi pythonKeyword          cterm=none             ctermbg=none  ctermfg=fg
" hi pythonParam            cterm=none             ctermbg=none  ctermfg=fg
" hi pythonRawEscape        cterm=none             ctermbg=none  ctermfg=fg
" hi pythonSuperclasses     cterm=none             ctermbg=none  ctermfg=fg
" hi pythonSync             cterm=none             ctermbg=none  ctermfg=fg

" hi Conceal                cterm=none             ctermbg=248   ctermfg=252
" hi Error                  cterm=none             ctermbg=196   ctermfg=231
" hi Ignore                 cterm=none             ctermbg=none  ctermfg=234
" hi InsertModeCursorLine   cterm=none             ctermbg=16    ctermfg=fg
" hi NormalModeCursorLine   cterm=none             ctermbg=235   ctermfg=fg
" hi PmenuThumb             cterm=reverse          ctermbg=none  ctermfg=fg
" hi StatusLineAlert        cterm=none             ctermbg=160   ctermfg=231
" hi StatusLineUnalert      cterm=none             ctermbg=238   ctermfg=144
" hi Test                   cterm=none             ctermbg=none  ctermfg=fg
" hi Underlined             cterm=underline        ctermbg=none  ctermfg=111
" hi VisualNOS              cterm=bold,underline   ctermbg=none  ctermfg=fg
" hi cCursor                cterm=reverse          ctermbg=none  ctermfg=fg
" hi iCursor                cterm=none             ctermbg=210   ctermfg=16
" hi lCursor                cterm=none             ctermbg=145   ctermfg=234
" hi nCursor                cterm=none             ctermbg=none  ctermfg=145
" hi vCursor                cterm=none             ctermbg=201   ctermfg=16

" hi Pmenu                  cterm=none             ctermfg=248   ctermbg=237
" hi PmenuSel               cterm=none             ctermfg=16    ctermbg=66
" hi PmenuSbar              cterm=none             ctermfg=16    ctermbg=66
" hi PmenuThumb             cterm=none             ctermfg=16    ctermbg=66

"   gutter
hi  LineNr       cterm=none  ctermbg=236   ctermfg=8
"   comments
hi  Comment      cterm=none  ctermbg=none  ctermfg=0
"   todo
hi  Todo         cterm=bold  ctermbg=1     ctermfg=none
"   visual mode highlighting
hi  Visual       cterm=none  ctermbg=5     ctermfg=16
"   colorcolumn
hi  ColorColumn  cterm=none  ctermbg=0     ctermfg=none
"   statusline
hi  StatusLine   cterm=none  ctermbg=236   ctermfg=8
