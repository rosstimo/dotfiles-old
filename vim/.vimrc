
" Don't worry about vi compatability
set nocompatible

" "Editor Stuff"
"
" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the filename in the window titlebar
set title

" Disable error bells
set noerrorbells

" Always show status line
set laststatus=2

" Show the cursor position
set ruler

" Show the current mode
set showmode

" Enable syntax highlighting
syntax on

" Enable line numbers
set number
set relativenumber

" Enhance command-line completion
set wildmenu

" Show the (partial) command as it’s being typed
set showcmd

" Make tabs as wide as two spaces
set tabstop=2

" "Navigation"

" Create 'tags' file
" - ^] jump to tag under curser
" - g^] ambiguous tag
" - ^t jump back up the tag stack
command! MakeTags !ctags -R .



" "System"

" Display matching files on Tab Complete
" fuzzy file finder 
set path+=**

" Use the OS clipboard by default (on versions compiled with `+clipboard`) there are keybindings anyway
set clipboard=unnamed

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Enable mouse in all modes
set mouse=a

" Don’t add empty newlines at the end of files
set binary
set noeol

" "vim files"

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" "searching" 

" Add the g flag to search/replace by default
set gdefault

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" "Parking Lot"
" Respect modeline in files. See Help Detect mode in first line of file
"set modeline
"set modelines=4

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list

" Change mapleader
let mapleader=","

" Don’t reset cursor to start of line when moving around.
set nostartofline

" built in 
filetype plugin on

