"------------------------------------appearance---------------------------------------
if has("gui_running")   " GUI color a font settings
set guifont=Osaka-Mono:h16
set background=dark 
set t_Co=256          " 256 color mode
set cursorline        " highlight current line
colorscheme vividchalk
endif

highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
"syntax highlight
syntax on
"auto indent according to file type
filetype indent on
filetype plugin on
"#raw#col
set ruler
"show cmd
set showcmd
"show #raw
set number
"share public clipboard
"set paste  "cause <C-> not work in insert mode!
set showmode
set tabstop=4
set shiftwidth=4
set autoindent
set softtabstop=4
set expandtab
set nu
set ruler
set hlsearch

autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
"------------------------------------function/plugin---------------------------------------
"vundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"let Vundle manage Vundle
Bundle 'gmarik/vundle'
"bundles
Bundle 'Tagbar'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'klen/python-mode'

filetype plugin indent on     " required!
"pythonMode"
" Map keys for autocompletion
let g:pymode_lint_ignore = "E702"
let g:pymode_lint_jump = 1
" Minimal height of pylint error window
let g:pymode_lint_minheight = 1
" Maximal height of pylint error window
let g:pymode_lint_maxheight = 10
let g:pymode_folding = 0
let g:pymode_rope = 1
let g:pymode_rope_guess_project = 0
let g:pymode_rope_autocomplete_map = '<C-n>'

inoremap <C-@> <C-Space>

"tagbar
nmap <F1> : TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
set tags=tags;/
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'

"powerline setup
"set guifont= Menlo
set laststatus=2

"nerdTree
map <F2> : NERDTreeToggle<CR>

"------------------------------------adjustment--------------------------------------------
" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif

hi Comment ctermfg=6
