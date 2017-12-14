syntax enable
syntax on
colorscheme desert
set nu
set encoding=utf-8
""自动缩进
set autoindent
set cindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
""为C程序提供缩进
set smartindent
""不要用空格替换制表符
set noexpandtab

filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

call vundle#begin()
Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
call vundle#end()

filetype plugin indent on

let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=25

map <F8> :TagbarToggle<CR>
map <F2> :NERDTreeToggle<CR>

map <F3> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	echo &filetype
	if &filetype == 'c'
		exec "!gcc % -o %<.out"
		exec "! ./%<.out"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<.out -std=c++11"
		exec "! ./%<.out"
	elseif &filetype == 'sh'
		exec ":!sh ./%"
	elseif &filetype == 'python'
		exec ":!python3 ./%"
	endif
endfunc

""let NERDTreeIgnore=['\w*[^hcpy]$','[^\.]\(h\|[^\.]c\|..p\|.y\)$','\.[^c]c',  '\..[^p]p$', '\.[^c]pp$', '\.[^p]y'] 

set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
"TagHightlight
"

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/.ycm_extra_conf.py'
set completeopt=longest,menu
let g:ycm_collect_identifiers_from_tags_files=1

set incsearch
set nocompatible
set magic
set nobackup
set noswapfile
set ignorecase
set hlsearch

let mapleader=","
let g:mapleader=","
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
nnoremap <leader>ny :let g:ycm_auto_trigger=0<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>":"\<CR>"
set completeopt-=preview
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_auto_trigger=0
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_show_diagnostice_ui=0
let g:ycm_open_loclist_on_ycm_diags=0
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_warning_symbol='>*'
:set pastetoggle=<F10>
