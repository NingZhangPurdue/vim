"------------------------------------appearance---------------------------------------
"syntax highlight
syntax on
"auto indent according to file type
filetype indent plugin on
"#raw#col
set ruler
"show cmd
set showcmd
"show #raw
set number
"share public clipboard
set paste
set showmode
set tabstop=4
set shiftwidth=4
set autoindent
set softtabstop=4
set expandtab
set nu
set ruler
"------------------------------------function/plugin---------------------------------------
"tagbar
nmap <F4> : TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
set tags=tags;/
"pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
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
