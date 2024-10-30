" Vim color file
" Maintainer:   Thorsten Maerz <info@netztorte.de>
" Last Change:  2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "myTorte"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal      guifg=White     guibg=Black
highlight Search      guifg=Black     guibg=Red      gui=bold
highlight Visual      guifg=#404040                  gui=bold
highlight Cursor      guifg=Black     guibg=Green    gui=bold
highlight CursorLine  guibg=#1c1c1c                  gui=none
highlight Special     guifg=Orange
highlight Comment     guifg=#80a0ff
highlight StatusLine  guifg=blue      guibg=white
highlight Statement   guifg=Yellow                   gui=NONE
highlight Type                                       gui=NONE
highlight ColorColumn guibg=#1c1c1c                  gui=NONE

" Console
highlight Normal      ctermfg=White   ctermbg=Black
highlight Search      ctermfg=Black   ctermbg=Red    cterm=bold
highlight Visual      ctermfg=238                    cterm=bold
highlight Cursor      ctermfg=Black   ctermbg=Green  cterm=bold
highlight CursorLine  ctermbg=234     cterm=none
highlight Special     ctermfg=214
highlight Comment     ctermfg=111
highlight StatusLine  ctermfg=blue    ctermbg=white
highlight Statement   ctermfg=Yellow  cterm=NONE
highlight Type                        cterm=NONE
highlight ColorColumn ctermbg=234     cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey    ctermbg=Black  cterm=NONE    guifg=Grey80      guibg=Black  gui=NONE
    highlight Search  ctermfg=Black   ctermbg=Red    cterm=bold    guifg=Black       guibg=Red    gui=bold
    highlight Visual  ctermfg=Black   ctermbg=yellow cterm=bold    guifg=#404040                  gui=bold
    highlight Special ctermfg=LightBlue              cterm=NONE    guifg=LightBlue                gui=NONE
    highlight Comment ctermfg=Cyan                   cterm=NONE    guifg=LightBlue                gui=NONE
  endif
endif

