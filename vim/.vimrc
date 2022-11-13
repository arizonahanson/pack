set nocompatible
let g:ale_completion_enabled=1
let g:ale_completion_delay=1000
let g:ale_cache_executable_check_failures=1
let g:ale_close_preview_on_insert=1
let g:ale_fixers={ 'nix': ['nixpkgs-fmt'], 'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint'] }
let g:ale_fix_on_save=1
let g:ale_hover_to_preview=1
let g:ale_lint_delay=2000
let g:ale_sign_error=' '
let g:ale_sign_warning=' '
let g:ale_sign_info=' '
let g:foldchar='╍'
let g:gitgutter_override_sign_column_highlight=0
let g:gitgutter_map_keys=0
let g:gitgutter_sign_priority=1
let g:gitgutter_sign_allow_clobber=0
let g:gitgutter_sign_added=' '
let g:gitgutter_sign_modified=' '
let g:gitgutter_sign_modified_removed=' '
let g:gitgutter_sign_removed=' '
let g:gitgutter_sign_removed_first_line=' '
let g:go_auto_type_info=1
let g:go_doc_popup_window=1
let g:go_fmt_autosave=1
let g:go_highlight_structs=1
let g:go_highlight_methods=1
let g:go_highlight_functions=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:vimcache='/tmp/.'.$USER.'/vim/'
let g:gutentags_cache_dir=g:vimcache.'ctags//'
let g:gutentags_exclude_filetypes=["gitcommit", "gitrebase", "markdown", "nix", ""]
let g:latex_to_unicode_file_types=".*"
let g:netrw_home=g:vimcache.'netrw'

silent! call plug#begin('~/.vim-plugged')
  Plug 'tpope/vim-sensible'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'benknoble/vim-auto-origami'
  Plug 'tpope/vim-fugitive'
  Plug 'dense-analysis/ale'
  Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

"--- important
set pastetoggle=<F2>
set clipboard=unnamed
"--- moving around, searching and patterns
set whichwrap+=<,>,h,l
set path=.,**
set ignorecase
set smartcase
"--- displaying text
set cmdheight=1
set scrolloff=6
set number
set numberwidth=1
set lazyredraw
let &fillchars='vert:║,diff:╌,fold:'.g:foldchar
let &showbreak=' '
autocmd FileType gitcommit setlocal nonumber
autocmd FileType markdown setlocal nonumber
"--- syntax, highlighting and spelling
set background=dark
set hlsearch
set cursorline
autocmd FileType gitcommit setlocal spell spelllang=en_us
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.peg set ft=pigeon
highlight Normal ctermbg=NONE ctermfg=0 ctermul=NONE cterm=NONE
highlight Noise ctermbg=NONE ctermfg=8 cterm=NONE
highlight Identifier ctermbg=NONE ctermfg=8 cterm=NONE
highlight Comment ctermbg=NONE ctermfg=7 cterm=NONE
highlight CursorLine ctermbg=NONE ctermfg=NONE cterm=NONE
highlight Visual ctermbg=7 cterm=NONE
highlight StatusLine ctermbg=7 ctermfg=fg cterm=NONE
highlight StatusLineNC ctermbg=7 ctermfg=8 cterm=NONE
highlight WildMenu ctermbg=7 ctermfg=11 cterm=NONE
highlight PmenuThumb ctermfg=8
highlight Underlined ctermbg=NONE ctermfg=4 cterm=underline
highlight IncSearch ctermbg=NONE ctermfg=9 cterm=underline
highlight Search ctermbg=NONE ctermfg=9 cterm=NONE
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
highlight User4 ctermbg=7 ctermfg=8 cterm=NONE
highlight User5 ctermbg=7 ctermfg=14 cterm=NONE
highlight User6 ctermbg=7 ctermfg=4 cterm=NONE
"--- multiple windows
set statusline=%<\ %f\ %6*%y\ %1*%(%r\ %)%*%2*%(%m\ %)%*%=%3*%{FugitiveHead()}%*\ %4*%l,%c%V%*\ %5*%B\ %*
highlight! link VisualNOS Visual
highlight! link helpHyperTextJump Tag
highlight! link MatchParen Search
highlight! link LineNr Comment
highlight! link CursorLineNr Noise
highlight! link SpecialComment Noise
highlight! link helpExample SpecialComment
highlight! link Folded Comment
highlight! link FoldColumn LineNr
highlight! link SignColumn CursorLine
highlight! link TabLine Comment
highlight! link TabLineSel StatusLine
highlight! link TabLineFill CursorLine
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
set hidden
set switchbuf=useopen,usetab,newtab
"--- multiple tab pages
set showtabline=1
function! Tabline()
  let s=''
  for i in range(tabpagenr('$'))
    let tab=i + 1
    let winnr=tabpagewinnr(tab)
    let buflist=tabpagebuflist(tab)
    let bufnr=buflist[winnr - 1]
    let bufname=bufname(bufnr)
    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= (bufname != '' ? ' '.fnamemodify(bufname, ':t').' ' : '[No Name] ')
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()
"--- terminal
let &t_VS="\e[1 q"
let &t_SI="\e[5 q"
let &t_SR="\e[3 q"
let &t_EI="\e[1 q"
"--- using the mouse
set mouse=a
"--- messages and info
set shortmess+=I
set shortmess+=c
"set noerrorbells
set novisualbell
set belloff=cursor,ctrlg,esc,wildmode
"--- editing text
set completeopt=menu,menuone,preview,noinsert,noselect
set omnifunc=ale#completion#OmniFunc
set showmatch
set undofile
let &undodir=g:vimcache.'undo//'
call mkdir(&undodir, 'p', 0700)
"--- folding
function AutoFold()
  if auto_origami#Foldcolumn() <= 0 && &foldenable
    setlocal foldmethod=indent
    silent! %foldopen!
    setlocal foldmethod=manual
    silent! %foldopen!
  endif
  AutoOrigamiFoldColumn
endfunction
augroup autofold
  au!
  au BufReadPost * silent! loadview
  au BufReadPost * if auto_origami#Foldcolumn() <= 0 | setlocal foldmethod=indent | endif
  au CursorHold,BufWinEnter,WinEnter * call AutoFold()
  au BufWinEnter * if &foldmethod == "indent" | setlocal foldmethod=manual | silent! :%foldopen! | endif
  au BufUnload * silent! mkview!
augroup END
autocmd FileType gitcommit setlocal foldmethod=syntax
function FoldLine()
  let pre=''.(v:foldend - v:foldstart + 1)
  let line=substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let txt=substitute(line, '^\s\+', '', 'g')
  let padlen=strchars(line)-strchars(txt)-strchars(pre)
  let pad=padlen > 1 ? ' '.repeat(g:foldchar, padlen-2).' ' : ' '
  return pre.pad.txt.' '
endfunction
set foldtext=FoldLine()
set nofoldenable
"--- diff mode
set diffopt=filler,vertical
"--- mapping
set notimeout
set ttimeout
"--- reading and writing files
set fileformats=unix,dos,mac
set nobackup
set writebackup
set backupcopy=auto
let &backupdir=g:vimcache.'backup//'
call mkdir(&backupdir, 'p', 0700)
"--- the swap file
set swapfile
set updatetime=1000
let &directory=g:vimcache.'swap//'
call mkdir(&directory, 'p', 0700)
"--- command line editing
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.so,*.class,.DS_Store
"--- multi-byte characters
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
"--- various
let &viminfo="%,!,'1000,s1024,n".g:vimcache.'viminfo'
set viewoptions=folds,cursor
let &viewdir=g:vimcache.'view'
call mkdir(&viewdir, 'p', 0700)
"--- mappings
function! GitGutterPrevHunkWrap(count)
  for i in range(1, a:count)
    let line=line('.')
    silent GitGutterPrevHunk
    if line('.') == line && len(GitGutterGetHunks())>1
      normal G
      silent GitGutterPrevHunk
    endif
  endfor
endfunction
function! GitGutterNextHunkWrap(count)
  for i in range(1, a:count)
    let line=line('.')
    silent GitGutterNextHunk
    if line('.') == line && len(GitGutterGetHunks())>1
      normal 1G
      silent GitGutterNextHunk
    endif
  endfor
endfunction
nnoremap <silent> [g :<C-u>call GitGutterPrevHunkWrap(v:count1)<CR>
nnoremap <silent> ]g :<C-u>call GitGutterNextHunkWrap(v:count1)<CR>
nnoremap <silent> [r :ALEPreviousWrap<CR>
nnoremap <silent> ]r :ALENextWrap<CR>
nnoremap <silent> <F3> :set number!<CR>
nnoremap <silent> <F4> :set foldenable!<CR>
nnoremap <silent> <F5> :GitGutterToggle<CR>
nnoremap <silent> <F6> :ALEToggle<CR>
nnoremap <silent> <F7> :ALEHover<CR>
nnoremap <silent> <F8> :ALEDetail<CR>
nnoremap <silent> <F9> :ALEGoToDefinition<CR>
nnoremap <silent> gG :GitGutterUndoHunk<CR>

