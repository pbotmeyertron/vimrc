" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Vundle Plugin Info
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Git plugin
Plugin 'tpope/vim-fugitive'
Plugin 'vim-utils/vim-man'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/badwolf'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim' 
Plugin 'morhetz/gruvbox'
Plugin 'davidhalter/jedi-vim'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'wesleyche/SrcExpl'
" Plugin 'yegappan/taglist'
" Plugin 'wesleyche/Trinity'
Plugin 'SirVer/ultisnips'
" Plugin 'w0rp/ale'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'racer-rust/vim-racer'
" Plugin 'kiteco/vim-plugin'
" Plugin 'maralla/completor.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'rust-lang/rust.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'
Plugin 'mg979/vim-visual-multi'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
" For plugins to load correctly
filetype plugin indent on    " required

" Turn on syntax highlighting
syntax on

" Leader key = spacebar 
let mapleader = " "
let maplocalleader = " "

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Show matching brace
set showmatch
" Don't jump the cursor back when closing a brace
set matchtime=0

" Remap ESC key to jk
imap jk <Esc>

" Encoding
set encoding=utf-8

" Set undo levels
set undolevels=1000

" Change directory to the current file being worked on
autocmd BufEnter * silent! lcd %:p:h 

" Folding Settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap<space> za
set foldmethod=indent

" Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent

" Redraw screen only when necessary
set lazyredraw

" Cursor motion
set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Paste outside of Vim
set clipboard=unnamedplus

" Font
set guifont=Fira\ Code\ Retina:h11

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap <leader><space> :nohlsearch<CR>
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set smartindent
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>e :set list!<CR> " Toggle tabs and EOL

" Colorscheme
set bg=dark
let g:gruvbox_italic = '1'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Vim Lightline Settings
if !has('gui_running')
set t_Co=256
endif
let g:lightline = {
\ 'colorscheme': 'darcula',
\ }

" NERDTree Options
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" AsyncRun Settings and  Remaps
" Keybindings for easy compilation of C files
" F4: update Makefile with cmake.
" F5: run the single file
" F6: run project test
" F7: build project
" F8: run project
" F9: compile the single file
" F10: toggle quickfix window
" Build with <F9>
noremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" Run with <F5>
noremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" Set quickfix window to 6 lines of height
let g:asyncrun_open = 16
" <F10> to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs']
noremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
noremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
noremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

" VimTex Settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" YCM Settings
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" Kite Autocomplete Settings
" let g:kite_supported_languages = ['*']

" Rust Autocomplete Settings (Racer)
" let g:racer_cmd = '/home/pbot/.cargo/bin/racer'
" let g:racer_experimental_completer = 0
" let g:completor_racer_binary = '/home/pbot/.cargo/bin/racer'

" augroup Racer
"    autocmd!
"    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
"    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
"    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
"    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
"    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
"    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
" augroup END

" C/C++ Autocomplete Settings
" let g:completor_clang_binary = '/bin/clang'

" Python Autocomplete Settings
" let g:completor_python_binary =  '/home/pbot/.local/lib/python3.8/site-packages'
" GutenTags Settings
set statusline+=%{gutentags#statusline()}
