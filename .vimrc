set number
set cursorline
set nocompatible
set autochdir
syntax on
filetype plugin on
set hlsearch
set incsearch
set ignorecase
set smartcase
set t_Co=256
" colorscheme solarized

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set cindent

nnoremap <leader><space> :noh<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Trailing Whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


set wrap
set linebreak

set scrolloff=3
set cursorline

set wildmenu
" set wildmode=longest, list

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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
" Plugin 'Shougo/vimproc'
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'garyburd/go-explorer'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'lightxue/SwissCalc'
Plugin 'mileszs/ack.vim'
Plugin 'vim-utils/vim-man'
Plugin 'kien/tabman.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'joonty/vim-do.git'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
Plugin 'Shougo/neocomplete'

call vundle#end()
filetype plugin indent on

" Backups
set nobackup

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Buftab
noremap <F3> :bprev<CR>
noremap <F2> :bnext<CR>

" Bufexplorer

nnoremap <silent> <F10> :BufExplorer<CR>
nnoremap <silent> <s-F10> :ToggleBufExplorer<CR>
nnoremap <silent> <m-F10> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F10> :BufExplorerVerticalSplit<CR>

let g:bufExplorerShowDirectories=1
let g:bufExplorerSortBy='number'
let g:bufExplorerShowUnlisted=1
" let g:bufExplorerShowTabBuffer=1
let g:bufExplorerSplitBelow=1

" NerdTree
"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-e> :NERDTreeToggle<CR>

" Tagbar

map <F8> :TagbarToggle<CR>

" "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" "" Disable AutoComplPop.
" let g:asyntasticcp_enableAtStartup = 0
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Syntatic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_c_checkers=['clang']

nnoremap <F5> :GundoToggle<CR>

let g:tabman_toogle='<leader>mt'
let g:tabman_focus='<leader>mf'


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


" С/C++ файлы
" Расставлять отступы в стиле С
autocmd filetype c,cpp set cin

" make-файлы
" В make-файлах нам не нужно заменять табуляцию пробелами
autocmd filetype make set noexpandtab
autocmd filetype make set nocin

" html-файлы
" Не расставлять отступы в стиле С в html файлах
autocmd filetype html set noexpandtab
autocmd filetype html set nocin
autocmd filetype html set textwidth=160

" css-файлы
" Не расставлять отступы в стиле C и не заменять табуляцию пробелами
autocmd filetype css set nocin
autocmd filetype css set noexpandtab

" python-файлы
" Не расставлять отступы в стиле С
autocmd filetype python set nocin



if ("gui_running")
   colorscheme molokai
else
    colorscheme wombat256
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '> '
let g:airline#extensions#tabline#left_alt_sep = '>'

let g:airline_theme='wombat'

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

let g:lua_complete_dynamic = 0
let g:lua_complete_omni = 1

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
