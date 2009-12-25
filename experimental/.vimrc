set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
set nocp			  " for omnicppcomplete plugin
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-20.(%)\%h%m%r%=%-40(%n%Y%)\%P
set nocul			  " cursor line
set cf " Enable error files & error jumping
set clipboard+=unnamed " Yanks go on clipboard instead
set history=256 " number of things to remember in history.
set autowrite " writes on a make/shell
set ruler " Ruler on
set nu " Line numbers on
set timeoutlen=300 " Time to wait after ESC
set foldmethod=syntax " Allows folding of ruby syntax

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Colors
set t_Co=256 " 256 colors
colorscheme ir_black

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" Gist settings
let g:gist_clip_command = 'xclip -selection clipboard'

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Visual
set showmatch " Show matching brackets
set mat=5 " Bracket blinking

runtime! macros/matchit.vim " Load matchit (% to bounce from do to end, etc.)

" all tab stuff to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cinoptions=>4

" set line numbers
set number

" Backups & Files
set backup	" Enable creation of backup file
set backupdir=~/.vim/backups " Where backups will go
set directory=~/.vim/tmp " Where temporary files will go

augroup myfiletypes
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml, compiler ruby
	autocmd FileType ruby,eruby,yaml, set ai sw=2 sts=2 et omnifunc=rubycomplete#Complete
	autocmd FileType ruby,eruby,yaml, let g:rubycomplete_buffer_loading = 1
	autocmd FileType java, set makeprg=javac\ % errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%# omnifunc=javacomplete#Complete completefunc=javacomplete#CompleteParamsInfo 
	autocmd FileType cpp, set makeprg=rake ai
	autocmd FileType cs, set makeprg=gmcs\ % ai
	autocmd FileType javascript, set ai sw=2 sts=2

augroup END

augroup filetypedetect
	au! BufRead,BufNewFile *.rhtml      setfiletype eruby
	au! BufRead,BufNewFile *.aspx		setfiletype html
augroup END

" Diff Preview function
function! DiffPreview()
 diffthis | vsplit | enew | set buftype=nofile | read # | delete | diffthis
endfunction

" WinManager mappings
" map <C-w><C-f> :FirstExplorerWindow<CR>
" map <C-w><C-b> :BottomExplorerWindow<CR>
" map <C-w><C-t> :WMToggle<CR>
" TagList mappings
map <F10> :TlistToggle<CR>
" map  :TlistUpdate<CR>

let Tlist_inc_Winwidth = 0

" Enhanced Commentify
map <M-c> :call ToggleCommentify()<CR>j
imap <M-c> <ESC>:call ToggleCommentify()<CR>j 

" Make setup
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cnext<CR>
map <silent> <m-n> :cprev<CR>
map <F5> :make<CR>

" Java Complete
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

" OmniCppComplete update
map <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" map <F7> :!ruby ~/.vim/plugin/ctags_rakefile_parser.rb <CR>
let OmniCpp_ShowPrototypeInAbbr = 1

set pastetoggle=<F4>

" DiffPreview map
map <F9> :call DiffPreview()<CR>

" MinBufExpl
map <F2> :Project<CR>
map <F3> :TMiniBufExplorer<CR>
map <F8> :FuzzyFinderFile<CR>


" RailsScriptSearch
function! RailsScriptSearch(args)
  let l:savegrepprg = &grepprg  
  let l:savegrepformat = &grepformat

  try 
    set grepprg=script/find
    set grepformat=%f:%l:%m

    execute "grep " . a:args
  finally
    execute "set grepformat=" . l:savegrepformat
    execute "set grepprg=" . l:savegrepprg
  endtry
endfunction

" search with explicitly provided arguments
command! -n=? Rgrep :call RailsScriptSearch('<args>')

" search for the word under the cursor
map <leader>rg :silent call RailsScriptSearch(expand("<cword>"))<CR>:cc<CR>

" search for the method definition of the word under the cursor
map <leader>rd :silent call RailsScriptSearch(expand("'def .*<cword>'"))<CR>:cc<CR>

let g:rubytest_in_quickfix = 0
let g:rubytest_cmd_test = "screen -S oib -p test -X stuff 'ruby %p'"
let g:rubytest_cmd_testcase = "screen -S oib -p test -X stuff \"ruby %p -n '/%c/'\""
let g:rubytest_cmd_spec = "screen -S oib -p test -X stuff 'spec --drb -c -f n %p'"
let g:rubytest_cmd_example = "screen -S oib -p test -X stuff \"spec --drb -c -f n %p -e '%c'\""

" Clojure

let vimclojure#NailgunClient = "/home/user/clojure/vimclojure/ng"
let clj_want_gorilla = 1
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1