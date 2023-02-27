highlight Normal ctermbg=NONE ctermfg=NONE ctermul=NONE cterm=NONE
highlight Noise ctermbg=NONE ctermfg=7 cterm=NONE
highlight Identifier ctermbg=NONE ctermfg=NONE cterm=NONE
highlight Comment ctermbg=NONE ctermfg=8 cterm=NONE
highlight Cursor ctermbg=NONE ctermfg=NONE cterm=NONE
highlight CursorLine ctermbg=NONE ctermfg=NONE cterm=NONE
highlight CursorLineNr ctermbg=15 ctermfg=8 cterm=NONE
highlight Visual ctermbg=7 cterm=NONE
highlight StatusLine ctermbg=7 ctermfg=15 cterm=NONE
highlight StatusLineNC ctermbg=8 ctermfg=7 cterm=NONE
highlight WildMenu ctermbg=7 ctermfg=NONE cterm=NONE
highlight PmenuThumb ctermfg=8
highlight Underlined ctermbg=NONE ctermfg=4 cterm=underline
highlight IncSearch ctermbg=8 ctermfg=7 cterm=NONE
highlight Search ctermbg=7 ctermfg=NONE cterm=NONE
highlight String ctermfg=3
highlight Character ctermfg=11
highlight Number ctermfg=14
highlight Boolean ctermfg=5
highlight Constant ctermfg=13
highlight Function ctermfg=6
highlight Type ctermfg=4
highlight Statement ctermfg=12
highlight Keyword ctermfg=10
highlight Error ctermbg=7 ctermfg=1
highlight Warning ctermbg=7 ctermfg=9
highlight Todo ctermbg=7 ctermfg=11
highlight ErrorMsg ctermbg=NONE ctermfg=1
highlight WarningMsg ctermbg=NONE ctermfg=9
highlight InfoMsg ctermbg=NONE ctermfg=11
highlight DiffAdd ctermbg=NONE ctermfg=2
highlight DiffChange ctermbg=NONE ctermfg=9
highlight DiffDelete ctermbg=NONE ctermfg=1
highlight DiffText ctermbg=7 ctermfg=9 cterm=NONE
highlight gitcommitSelectedType ctermbg=NONE ctermfg=11 cterm=NONE
highlight gitcommitBranch ctermbg=NONE ctermfg=12
highlight User1 ctermbg=7 ctermfg=11 cterm=NONE
highlight User2 ctermbg=7 ctermfg=9 cterm=NONE
highlight User3 ctermbg=7 ctermfg=12 cterm=NONE
highlight User4 ctermbg=7 ctermfg=15 cterm=NONE
highlight User5 ctermbg=7 ctermfg=14 cterm=NONE
highlight User6 ctermbg=7 ctermfg=4 cterm=NONE
"--- multiple windows
set statusline=%<\ %f\ %6*%y\ %1*%(%r\ %)%*%2*%(%m\ %)%*%=%3*%{FugitiveHead()}%*\ %4*%l,%c%V%*\ %5*%B\ %*
highlight! link VisualNOS Visual
highlight! link helpHyperTextJump Tag
highlight! link MatchParen Search
highlight! link LineNr Noise
highlight! link SpecialComment Noise
highlight! link helpExample SpecialComment
highlight! link Folded Comment
highlight! link FoldColumn LineNr
highlight! link SignColumn LineNr
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
highlight! link TabLine LineNr
highlight! link TabLineSel StatusLine
highlight! link TabLineFill LineNr
highlight! link Pmenu StatusLineNC
highlight! link PmenuSbar StatusLineNC
highlight! link PmenuSel WildMenu
highlight! link Debug SpecialComment
highlight! link Ignore Comment
highlight! link VertSplit LineNr
highlight! link NonText Comment
highlight! link Special Character
highlight! link Integer Number
highlight! link Question Function
highlight! link PreProc Type
highlight! link Include PreProc
highlight! link Exception Keyword
highlight! link Operator Keyword
highlight! link Repeat Statement
highlight! link StorageClass Statement
highlight! link Structure Statement
highlight! link Typedef Statement
highlight! link Label Statement
highlight! link ModeMsg InfoMsg
highlight! link MoreMsg InfoMsg
highlight! link SpellCap Todo
highlight! link SpellRare Warning
highlight! link SpellBad Error
highlight! link diffLine CursorLineNr
highlight! link diffFile LineNr
highlight! link diffIndexLine diffFile
highlight! link diffSubname Normal
highlight! link diffAdded DiffAdd
highlight! link diffRemoved DiffDelete
highlight! link diffChanged DiffChange
highlight! link gitcommitHeader Comment
highlight! link gitcommitSummary Normal
highlight! link gitcommitDiscardedType DiffChange
highlight! link gitcommitUntrackedType DiffDelete
highlight! link gitcommitSelectedFile gitcommitSelectedType
highlight! link gitcommitDiscardedFile gitcommitDiscardedType
highlight! link gitcommitUntrackedFile gitcommitUntrackedType
highlight! link AleErrorSign ErrorMsg
highlight! link AleWarningSign WarningMsg
highlight! link AleInfoSign InfoMsg
highlight! link GitGutterAdd DiffAdd
highlight! link GitGutterChange DiffChange
highlight! link GitGutterAddDelete DiffDelete
highlight! link GitGutterChangeDelete DiffDelete
highlight! link GitGutterDelete DiffDelete
highlight! link shOption Constant
highlight! link shShellVariables Identifier
highlight! link zshTypes Statement
highlight! link zshDereferencing Identifier
highlight! link jsNull Constant
highlight! link jsThis Constant
highlight! link goBuiltins Function
highlight! link csBraces Noise
highlight! link csLogicSymbols Operator
syntax keyword schemeSyntax contained define-stream lambda-stream
