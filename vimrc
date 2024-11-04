"-------------------------------------------------------------------------------
" Filename      : .vimrc
" Author        : Ernesuma
" Creation Date : 28.08.2017
"-------------------------------------------------------------------------------

let s:vimfilespath = "~/.vim/"
let s:vimrcPath = s:vimfilespath . '/vimrc'

"-------------------------------------------------------------------------------
" startup settings
" ----------------
" no compatibility for VI
set nocompatible

" load vimrc_example.vim
if !has('nvim')
    source $VIMRUNTIME/vimrc_example.vim
endif

" append user dir to runtimepath on windows
"if has('win32') || has('win64')
"    let &runtimepath.=',$HOME/.vim'
"endif

" activate the file type detection plug-in
"filetype plugin on
"filetype indent on

" encoding settings
set enc=utf-8 "terminal encoding
set fencs=utf-8,latin-1,ucs-bom "Try this file encodings

" Sets how many lines of history VIM has to remember
set history=999

" flash screen instead of annoying beeping on error
set visualbell

" Set to auto read when a file is changed from the outside
"set autoread

" workaround on new hp notebook: otherwise gvim is not able to rename
" viminfo file to H:\_viminfo (E866) during offline-mode
"set viminfo+=nE:\_viminfo

" disable viminfo
set viminfo=""
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" => Files, backups and undo
" --------------------------
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim/undodir
    endif

    set undofile
catch
endtry
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" Spell-check settings
" --------------------
"set spelllang=de_de    "spell-check language to German
set spelllang=en        "spell-check language to English
set spell               "Activate spell-checking
"set nospell            "Deactivate spell-checking

"
" some spell-related key bondings

" toggle spellchecking
let g:spellchecking = 0
function! ToggleSpellchecking()
    if 1 == g:spellchecking
        let g:spellchecking = 0
        return ":silent setlocal spell\<CR>"
    endif
    let g:spellchecking = 1
    return ":silent setlocal nospell\<CR>"
endfunction
nnoremap <silent> <expr> <F2> ToggleSpellchecking()

" set spell language
nnoremap <F3> :se spelllang=en<CR>
nnoremap <F4> :se spelllang=de<CR>
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" 'Fuzzy' File-Search
" -------------------

" Search down into subfolders (e.g. for :find command)
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab-complete
set wildmenu

" Now we can:
" - hit tab to :find by partial match
" - use * make it 'fuzzy' (e.g.: :find *_test.py<tab>)
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" Color Scheme
" ------------

" choose color scheme depending on environment
if (stridx(&shell, 'bash')!=-1) || has("gui_running") || has('nvim')
    " set console to 256 color mode and choose color scheme
    set t_Co=256
    colorscheme myXoria256
else
    colorscheme myTorte
    "colorscheme delek
endif
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" Autocomplete
" ------------
" documentet in |ins-completion|

" highlights
" - ^n   : anything specified in 'complete' option
" - ^X^N : just this file (don't need that, 'cause they are firs of ^N)
" - ^X^] : tags only
" - ^X^F : filenames (works with the above defined 'set path+=**')
" - ^X^D : definition or macro
" - ^X^K : dictionary
" - ^XS  : spelling
" - ^X^T : thesaurus
" - ^X^L : hole line matching

" ^p und ^n to go back and forth in the suggestions
" ^y accept current suggestions
" ^e abort completion

" some remaps for convenience
":inoremap <C-]> <C-X><C-]>
:inoremap <C-F> <C-X><C-F>
:inoremap <C-D> <C-X><C-D>
:inoremap <C-K> <C-X><C-K>
:inoremap <C-L> <C-X><C-L>
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" Snippets
" --------
" python class snippet
nnoremap ,pyclass :-1read $HOME/.vim/skeletons/pythonclass.skl<CR>
"nmap ,pcl ,pyclass
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" Search Highlighting
" -------------------

" highlight search results
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" comment in corresponding highlighting function depending on whether you like
" to toggle highlighting or not

" toggle highlighting of current word
"let g:highlighting = 0
"function! Highlighting()
"  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
"    let g:highlighting = 0
"    return ":silent nohlsearch\<CR>"
"  endif
"  let @/ = '\<'.expand('<cword>').'\>'
"  let g:highlighting = 1
"  return ":silent set hlsearch\<CR>"
"endfunction

" highlighting of current word
function! Highlighting()
  let @/ = '\<'.expand('<cword>').'\>'
  return ":silent set hlsearch\<CR>"
endfunction

" map Highlighting function to Return-key
" nnoremap <silent> <expr> <CR> Highlighting()
"-------------------------------------------------------------------------------

" change cursor depending on mode in tmux
if exists('$TMUX')
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" new key bondings
" ----------------

" set leader-key
let mapleader=","
let g:mapleader=","

"timeoutlen for second key in double key bindings in milliseconds
set tm=900

" some remappings of the Escape key
inoremap <Leader><Leader> <Esc>
noremap <Leader><Leader> <Esc>

" <Esc> over macro bahaves different then pure <Esc>, so <C-c> does what is
" intended here --> abort cmdline without execution
cnoremap <Leader><Leader> <C-c>

" navigating through tags
" make navigating in help files easier ("]" is hard to reach on my keyboard
" layout):
nnoremap <Leader>lh <C-]>
nnoremap <Leader>hl <C-t>

" switch left and right to avoid brainfuck with NEO2 keyboard layout
noremap l h
noremap h l

" insert newline
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" remaps to navigate through split screens
nnoremap <Leader>jj <C-W><C-J>
nnoremap <Leader>kk <C-W><C-K>
nnoremap <Leader>hh <C-W><C-L>
nnoremap <Leader>ll <C-W><C-H>

" move split windows
" ..to the most Bottom, Top, Right and Left position
nnoremap <Leader>wj <C-W>J
nnoremap <Leader>wk <C-W>K
nnoremap <Leader>wl <C-W>H
nnoremap <Leader>wh <C-W>L
" ..around: rotate them
nnoremap <Leader>wr <C-W>r

" move window to new tab
nnoremap <Leader>wt <C-W>T

" underline something
nnoremap <Leader>ul yypv$r-j
" underline something commented
nnoremap <Leader>cul yypwv$r-j

" Open/Close a NerdTree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>

" remove trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" easy window resize
" ------------------

" vertical smaller and bigger
nnoremap <C-s> 3<C-W>-
nnoremap <C-b> 3<C-W>+
nnoremap <S-down> 3<C-W>-
nnoremap <S-up> 3<C-W>+

" horizontal smaller and bigger
nnoremap <Leader>s 5<C-W><
nnoremap <Leader>b 5<C-W>>
nnoremap <S-left> 3<C-W><
nnoremap <S-right> 3<C-W>>
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" self defined commands
" ---------------------

" create tags file
command! MakeTags !ctags -R .

" reload the vimrc file
command! ReloadVimrc execute "source" s:vimrcPath

" open vimrc file
command! Vimrc execute "tabedit" s:vimrcPath

" open my useful commands list
command! MyUsefulCmds execute "tabedit" s:vimfilespath . "usefulCmds.txt"

" cd to dir of current buffer file
command! CdCurrentFilePath cd %:p:h/
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" make nice tree
" --------------
function! MakeNiceTree()
    normal ggVGy
    tabnew
    normal gPdd
    echom "replace |+\\"
    %s/|   /│   /g
    %s/+-- /├━━ /g
    %s/\\-- /└━━ /g
endfunction
nnoremap <Leader>mnt :call MakeNiceTree() <cr>
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" editor style
" ------------
set textwidth=0

" format options
set fo-=t   "deactivate automatic insertion of line breaks
set fo-=c   "deactivate automatic insertion of line breaks in comments

" activate number and relativenumber to get hybrid line numbers
set number
set relativenumber

set wrap	"visual line break on
set lbr		"toggle wrap at word (no line break IN a word)
set showbreak=:->>

set cursorline
"-------------------------------------------------------------------------------
" highlight line background in insert mode
":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

set colorcolumn=80,100,120

" mark all text after column 100 with brown background
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"  autocmd BufEnter * match OverLength /\%101v.*/
"augroup END
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" Tab behaviour
" -------------
" set tab-stop widths
set tabstop=4
set softtabstop=4
set shiftwidth=4

set smarttab

" spaces for tabs
set expandtab

set autoindent
"set smartindent
"-------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" GUI Settings
" ------------

if has("gui_running")

    set guioptions=gmLtT

    " type ':set guifont=*' to get a window to select and customise the font
    if has('gui_gtk')
        "set guifont=Ubuntu\ Mono\ 11
        set guifont=DejaVu\ Sans\ Mono\ 11
    else
        set guifont=Lucida_Console:h11:cANSI
    endif



    " maximize, restore and minimize mapped to F12, F11 and F10
    " the same as <ALT><SPACE> and x, w, n
    " (the 'w' stands for the german 'Wiederherstellen', in english windows pls use 'r')
    noremap <F12> <Esc>:simalt ~w<CR>
    noremap <F11> <Esc>:simalt ~x<CR>jk
    noremap <F10> <Esc>:simalt ~n<CR>
endif
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Autocommands
" ------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " cursor settings
    if &term =~ "xterm\\|rxvt"
        " use a | cursor in insert mode
        let &t_SI = "\<Esc>[5 q"

        " use a rectangle cursor otherwise
        let &t_EI = "\<Esc>[1 q"

        " reset cursor when vim exits
        autocmd VimLeave * silent !echo -ne "\<Esc>[5 q"
    endif
endif " has("autocmd")
" ------------------------------------------------------------------------------

