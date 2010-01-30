" ID:
" In Linux, save this file as ~/.vimrc 
" In Windows, save this file as ...\Documents and Settings\[User]\_vimrc

set nocompatible

"" inform vim of certain keycodes for terminal editing
"if !has("gui_running")
"    if &term == "win32"

"        set <BS>
"    elseif &term == "win32"
"       ...
"    else
"       ..
"    endif
"endif

" use Windows-style key mappings
source $VIMRUNTIME/mswin.vim

" no messsages at the start of vim
set shortmess=at

" prevent annoying behavior of some keys in selection mode
vunmap d
vunmap u

" make CTRL-Z and CTRL-Y work in visual/selection mode
vnoremap <C-Z> <C-C>u
vnoremap <C-Y> <C-C><C-R>

"inoremap <C-S-Left> <C-O>gh<C-O>b

" Make cursor keys ignore wrapping
nnoremap <Up> gk
inoremap <Up> <C-O>gk
nnoremap <Down> gj
inoremap <Down> <C-O>gj
nnoremap <Home> g0
inoremap <Home> <C-O>g0
nnoremap <End> g$
inoremap <End> <C-O>g$
nnoremap <S-Up> gh<C-O>gk
inoremap <S-Up> <C-O>gh<C-O>gk
vnoremap <S-Up> gk
nnoremap <S-Down> gh<C-O>gj
inoremap <S-Down> <C-O>gh<C-O>gj
vnoremap <S-Down> gj

" CTRL-T and CTRL-D indent and unindent blocks
inoremap <C-D> <C-O><LT><LT>
nnoremap <C-D> <LT><LT>
vnoremap <C-T> >
vnoremap <C-D> <LT>

" CTRL-TAB inserts a tab character (i.e., does not replace tab with spaces)
inoremap <C-Tab> <C-V><Tab>

" I don't like the following remapping below, I am a big Ctrl+B/F fan
" CTRL-F does Find dialog instead of page forward
" noremap <C-F> :promptfind<CR>
"vnoremap <C-F> y:promptfind <C-R>"<CR>
"onoremap <C-F> <C-C>:promptfind<CR>
"inoremap <C-F> <C-O>:promptfind<CR>
"cnoremap <C-F> <C-C>:promptfind<CR>

" CTRL-H does Replace dialog instead of character left
noremap <C-H> :promptrepl<CR>
vnoremap <C-H> y:promptrepl <C-R>"<CR>
onoremap <C-H> <C-C>:promptrepl<CR>
inoremap <C-H> <C-O>:promptrepl<CR>
cnoremap <C-H> <C-C>:promptrepl<CR>

" F7 runs 'make'
nnoremap <F7> :update<CR>:make<CR>
inoremap <F7> <C-O>:update<CR><C-O>:make<CR>
vnoremap <F7> <C-C>:update<CR><C-C>:make<CR>

" F5 runs 'make run'
nnoremap <F5> :update<CR>:!make run<CR><CR>
inoremap <F5> <C-O>:update<CR><C-O>:!make run<CR><CR>
vnoremap <F5> <C-C>:update<CR><C-C>:!make run<CR><CR>


" CTRL-R reloads the ~/.vimrc file
"nnoremap <C-R> :source ~/.vimrc
"inoremap <C-R> <C-O>:source ~/.vimrc
"vnoremap <C-R> <C-C>:source ~/.vimrc


set nobackup        " don't back up file before saving
set autowrite       " automatically save before making
" set backupdir=~/.vim/sessions
" set dir=~/.vim/sessions
set history=500

"set co=80
"set lines=25
 " turn on wild mode huge list"
set wildmode=list:longest

set wildmenu " turn on command line completion wild style

" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
               \*.jpg,*.gif,*.png

set tabpagemax=30   " maximum number of tabs
set number          " show line numbers
set ruler           " show ruler
set showcmd         " show command line


set expandtab       " turns tabs into spaces
set tabstop=4       " number of spaces per tab
set autoindent      
set nosmartindent
set shiftwidth=4    " number of spaces per shift

" Don't fucking out outdent hashes
" inoremap # X#

set showmatch       " brace matching
syntax on           " syntax highlighting

set incsearch       " incremental search
set ignorecase      " search ignores case
set hlsearch        " highlight search results (":nohlsearch" unhighlights)

set noerrorbells    " no error beep/flash
set visualbell
set t_vb=   
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif 

"don't start in insert mode, that's annoying
"start               " start vim in insert mode

"        set <S-Up>="        set <S-Down>=


" filetype plugins are now turned on
filetype plugin on
" filetype indent on

" adding omnifunc auto completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" autoloading of all omnifunc auto completion
setlocal omnifunc=syntaxcomplete#Complete

" remapping the code complete keybindings as well as falling back on a simple
" keyword search, the rebinding is mapped to ctrl+space
" to move up the dropdown menu, ctrl+p
" to move down teh drop down menu, ctrl+n
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" open a tag view split or in another vertical pane
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" colorscheme desert
" colorscheme ir_black
" use 256 colors if they're available, else default to 
" 16 for the sad people who still use non-256 terminals
colorscheme fruit
if &term == "xterm"
    set t_Co=256
    colorscheme lucius
endif

hi Normal guifg=White guibg=grey12
"set global font
"set gfn=Monaco\ 10
"set gfn=Inconsolata-dz\ Medium\ 9
"set gfn=Consolas\ 10
set gfn=Menlo\ 9

" don't have a toolbar, who the fuck uses those?
set guioptions-=T

" disable auto commenting..
au FileType * setl fo-=cro

" buffermovement for buflist
noremap bT :bprev<CR>
noremap bt :bnext<CR>

" show the tab number on the tabs followed by the basename
" set guitablabel=%m%N\ %f

" global settings for buff list, show only basename of the file
:let g:buftabs_only_basename=1

" match highlights
" ================= 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" match OverLength /\%81v.*/
" au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
" Only over match for 79 on python files
au BufWinEnter *.py let w:ol=matchadd('OverLength', '\%>79v.\+', -1)

" Switch off :match highlighting.
" python syntax highlighting
:let python_highlight_all = 1

" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"  Define this variable to make the plugin show the buftabs in the statusline
"  instead of the command line. It is a good idea to configure vim to show
"  the statusline as well when only one window is open. 
set laststatus=2
":let g:buftabs_in_statusline=1

" paste toggling
set pastetoggle=<F3>
nnoremap <F3> :set invpaste paste?<CR>
imap <F3> <C-O><F3>
set pastetoggle=<F3>

" C++ mappings to auto compile and auto-run 
" in the future, look at:
" http://vim.wikia.com/wiki/Run_make_from_command_line_and_open_Vim_on_errors
map <C-F5> : call CompileGcc()<CR>
func! CompileGcc()
  exec "w"
  exec "!g++ -Wall % -o %<"
endfunc

map <C-F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!g++ -Wall % -o %<"
  exec "! ./%<"
endfunc

" save as root if you accidentally opened a file to be saved as non-root
cmap w!! %!sudo tee > /dev/null %

" tags
"-----------------------------
" configuring tags -- add additional tags here or comment out not-used ones
set tags+=tags;/
" set tags+=$VIMRUNTIME/tags
" set tags+=/

" buiding a recursive ctag database from the current directory 
" mapping Control-F12 
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" generate the taglist toggle
map <C-F11> :TlistToggle<CR>
