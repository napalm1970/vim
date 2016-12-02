set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-lua-inspect'
Plugin 'xolox/vim-misc'
Plugin 'luochen1990/rainbow'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'rosenfeld/conque-term'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Rip-Rip/clang_complete'
Plugin 'vim-syntastic/syntastic'
Plugin 'flomotlik/vim-livereload'
Plugin 'lordm/vim-browser-reload-linux'
Plugin 'easymotion/vim-easymotion'


call vundle#end()

filetype plugin indent on

syntax on

autocmd! bufwritepost .vimrc source %
" set omnifunc=syntaxcomplete#Complete
set number
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set hlsearch
set incsearch
set ignorecase
set smartcase
set t_Co=256
set smarttab
set smartindent
let mapleader = ","

nnoremap j gj
nnoremap k gk

" Trailing Whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

set wrap
set linebreak

set scrolloff=3
set cursorline

set wildmenu
set wildmode=list:longest ",list:full

set showcmd
set hidden
set history=1000

set laststatus=2
set cursorline

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

colorscheme wombat256i

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-s>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



let g:ycm_global_ycm_extra_conf = "/home/napalm/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let g:AutoPairsFlyMode = 1

let g:rainbow_active = 1

" Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1"

" let g:airline#extensions#tabline#enabled = 1

if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif


let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '~_'

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110,E211,E303,E251"
let g:pymode_lint_write = 1
let g_pymode_virtualenv = 1
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_syntax = 1
let g:pymode_doc = 0
let g_pymode_doc_ley = 'K'
let g:pymode_folding = 0


let g:user_emmet_install_global = 0
autocmd FileType htmll,css EmmetInstall

let g:clang_library_path='/usr/lib/libclang.so.3.9'

let g:syntastic_always_populate_lock_list = 1
let g:syntastic_auto_lock_list = 1
let g:syntastic_check_on_open = 1
let g:syntastik_check_on_wq = 0

map <F6> :NERDTreeToggle<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n <esc>:tabprevious<cr>
map <Leader>m <esc>:tabnext<cr>
map <Leader>o <esc>:tabnew<cr>
map <Leader>e <esc>:tabclose<cr>

map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <eader>s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-overwin-line)
nmap <Leader>L <Plug>(easymotion-bd-jk)
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)



