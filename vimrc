set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ervandew/supertab'
Plugin 'groenewege/vim-less'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'FooSoft/vim-argwrap'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required
set number
filetype plugin on
autocmd FileType python,js autocmd BufWritePre <buffer> %s/\s\+$//e
set noswapfile



let mapleader = " "
" vim-argwrap settings
nnoremap <silent> <leader>a :ArgWrap<CR>
syntax on
set showcmd
set cursorline
set lazyredraw
set showmatch
set autoread
set autoindent
set showmode
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set splitright

set wildmenu
set wildmode=list:longest,full



set mouse=a
set ttymouse=xterm2


set background=dark
colorscheme solarized


set encoding=utf-8


let g:ag_working_path_mode="r"
let g:ag_prg="ag --column --follow --nogroup --path-to-agignore ~/.agignore --max-count 500 --all-text --stats"
