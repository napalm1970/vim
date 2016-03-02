set number
set cursorline
set nocompatible
"set cursorcolumn
set autochdir
syntax on
filetype plugin on
set hlsearch
set incsearch
set ignorecase
set smartcase
set t_Co=256
"colorscheme molokai
colorscheme solarized

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
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
set wildmode=list:longest " , list:full

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
"Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/vimproc'
Plugin 'osyo-manga/vim-marching'
Plugin 'thinca/vim-quickrun'
Plugin 'osyo-manga/vim-snowdrop'
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/buftabs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'garyburd/go-explorer'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/syntastic'
Plugin 'justinmk/vim-sneak'
Plugin 'losingkeys/vim-niji'
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
Plugin 'vim-scripts/Conque-Shell'




call vundle#end()
filetype plugin indent on

" Backups
set nobackup

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"Marching
"
" clang コマンドの設定
let g:marching_clang_command = "/usr/bin/clang"
"
" " オプションを追加する
" " filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
            \   "cpp" : "-std=gnu++1y"
            \}

" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
            \   "/usr/include/c++/5.3.0",
            \   "/usr/include"
            \]
"
" " neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

"       " 処理のタイミングを制御する
"       " 短いほうがより早く補完ウィンドウが表示される
"       " ただし、marching.vim 以外の処理にも影響するので注意する
set updatetime=200

"       " オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムに補完を行う
"       imap <buffer> <C-x><C-x><C-o>
"       <Plug>(marching_force_start_omni_complete)

" Snowdrop
" set libclang directory path
let g:snowdrop#libclang_directory = "/usr/bin/"
"
" " set include directory path.
let g:snowdrop#include_paths = {
            \   "cpp" : [
            \  "/usr/include/c++/5.3.0",
            \   "/usr/include"
            \
            \   ]
            \}

" set clang command options.
let g:snowdrop#command_options = {
            \   "cpp" : "-std=c++1y",
            \}

" Buftab
"
noremap <F3> :bprev<CR>
noremap <F2> :bnext<CR>

" Bufexplorer

nnoremap <silent> <F11> :BufExplorer<CR>
nnoremap <silent> <s-F11> :ToggleBufExplorer<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

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

" Vim-go
"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

let g:go_bin_path = expand("~/go/bin")
" let g:go_bin_path = "/home/fatih/.mypath"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command="goimports"
let g:go_auto_type_info=1
let g:go_metalinter_enabled=['vet', 'golint', 'errcheck']
let g:go_term_mode="vsplit"




" Tagbar

map <F8> :TagbarToggle<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:asyntasticcp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()



" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete basyntasticckword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:sysyntasticntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'

let g:sneak#streak = 1

nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

"let g:niji_match_all_filetypes = 2

"let g:niji_matching_characters = [['(', ')'],
            "\ ['\[', '\]'],
            "\ ['<', '>']]

let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions']
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, '~/.zshrc' ]


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

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
