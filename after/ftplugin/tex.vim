
" Map auto complete of (, ", ', [, {, <
imap ( ()<++><Esc>F)i
imap [ []<++><Esc>F]i
imap { {}<++><Esc>F}i
inoremap < <><++><esc>2F>i


" add some fancy shortcuts for often needed text-snippets
noremap <F6> <Esc>a\foreignlanguage{english}{}<++><Esc>F}i

" Here follow the settings for the latex-suite
" --------------------------------------------

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"In addition, the following settings could go in your ~/.vim/ftplugin/tex.vim file:

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
"set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
