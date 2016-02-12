"let mapleader=","
set nocompatible
syntax on
" execute pathogen#infect()
filetype plugin on
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
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/neocomplcache'
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


call vundle#end()
filetype plugin indent on

" Backups
set nobackup

" Neocomplche

" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
 let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
 let g:neocomplcache_min_syntax_length = 3
 let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
 let g:neocomplcache_dictionary_filetype_lists = {
     \ 'default' : '',
         \ 'vimshell' : $HOME.'/.vimshell_hist',
             \ 'scheme' : $HOME.'/.gosh_completions'
                     \ }

" Define keyword.
 if !exists('g:neocomplcache_keyword_patterns')
     let g:neocomplcache_keyword_patterns = {}
     endif
     let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
    " Plugin key-mappings.
     inoremap <expr><C-g>     neocomplcache#undo_completion()
     inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
     " Recommended key-mappings.
     " <CR>: close popup and save indent.
     inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
     function! s:my_cr_function()
       return neocomplcache#smart_close_popup() . "\<CR>"
         " For no inserting <CR> key.
           "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
           endfunction
"           " <TAB>: completion.
           inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"           " <C-h>, <BS>: close popup and delete backword char.
           inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
           inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
           inoremap <expr><C-y>  neocomplcache#close_popup()
           inoremap <expr><C-e>  neocomplcache#cancel_popup()
"           " Close popup by <Space>.
"           "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
"
           " Enable omni completion.
           autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
           autocmd FileType html,markdown setlocalomnifunc=htmlcomplete#CompleteTags
           autocmd FileType javascript setlocalomnifunc=javascriptcomplete#CompleteJS
           autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
           autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
           " Enable heavy omni completion.
           if !exists('g:neocomplcache_force_omni_patterns')
             let g:neocomplcache_force_omni_patterns = {}
             endif
             let g:neocomplcache_force_omni_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
             let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
             let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

             " For perlomni.vim setting.
             " https://github.com/c9s/perlomni.vim
             let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Snippets
"
" Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

 " SuperTab like snippets behavior.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

" Syntatic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
