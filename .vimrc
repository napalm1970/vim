set nocompatible
execute pathogen#infect()
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
call pathogen#helptags()
set hlsearch
set incsearch
set ignorecase
set smartcase
set t_Co=256
colorscheme molokai

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set wrap
set linebreak

set scrolloff=3
set cursorline

set wildmenu
set wildmode=list:longest,list:full

set showcmd
set hidden
set history=1000

set laststatus=2 

" Vundle plugin 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

