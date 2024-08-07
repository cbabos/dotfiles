"execute pathogen#infect()

set nocompatible
let mapleader=';'
let g:mapleader=';'
let maplocalleader=';'
let g:maplocalleader=';'

" Install plugins with vundle
filetype off 
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" we'll handling vundle by itself
Plugin 'gmarik/vundle'
" Editorconfig
Plugin 'editorconfig/editorconfig-vim'
" Nerdtree
Plugin 'scrooloose/nerdtree'
" Airline
Plugin 'Bling/vim-airline'
" Goyo
Plugin 'junegunn/goyo.vim'
" Limelight 
Plugin 'junegunn/limelight.vim'
" ctrlp
Plugin 'kien/ctrlp.vim'
" Ayu theme 
Plugin 'ayu-theme/ayu-vim' " or other package manager
" LSP
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'


"...
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme


" Preferences
"   Presentation
" Maximum count of tabs
set tabpagemax=50
set smartindent expandtab shiftwidth=4 tabstop=4
filetype plugin on
set colorcolumn=80
set title
set showmode
set re=2
syntax enable
set number
set relativenumber
set encoding=utf8 nobomb  " Use UTF-8 without BOM
                          " Use Unix as the standard file type
set fileformats=unix,dos,mac

set list                  " Highlight problematic whitespace
set listchars=tab:\ \ ,trail:\ ,extends:#,nbsp:.

" Theme
colorscheme ayu
set background=dark

"   Behaviour
                          " Don't make a backup before overwriting a
                          " file
set nobackup nowritebackup
                          " Keep swap files in one location
set directory=~/.vim/swap

set hidden                " Handle multiple buffers better

set hlsearch!
set incsearch              " Highlight matches
set ignorecase            " Case-insensitive searching
set smartcase             " But case-sensitive if expression contains a
                          " capital letter
set gdefault              " Always use the g flag for replacing

                          " No annoying sound on errors
set noerrorbells visualbell t_vb= tm=500

set ttyfast               " Optimize for fast terminal connections
set mouse=a               " Use mouse
set backspace=indent,eol,start
"   KeyBindings
    " normal mode {{{
                                  " Tab navigation
        nnoremap H gT
        nnoremap L gt
        nnoremap <c-t> :tabnew<cr>
        nnoremap <c-q> :tabclose<cr>

                                  " Move around your splits
        nnoremap <c-h> <c-w>h
        nnoremap <c-j> <c-w>j
        nnoremap <c-k> <c-w>k
        nnoremap <c-l> <c-w>l

                                  " Open todo.md
        nnoremap <leader>et :tabnew ~/Documents/todo.md<cr>

                                  " Open .vimrc
        nnoremap <leader>ev :tabnew $MYVIMRC<cr>
                                  " Reload the config file
        nnoremap <leader>sv :source $MYVIMRC<cr>

                                  " Yank text to the OS X clipboard
        map <leader>y "+y
        map <leader>Y "+Y
        map <leader>g :Goyo<cr>

                                  " Preserve indentation while pasting text " from the OS X clipboard noremap <leader>p :set paste<cr>:put *<cr>:set nopaste<cr>
        map <leader>P :set paste<cr>:put! +<cr>:set nopaste<cr>
        map <leader>p :set paste<cr>:put! +<cr>:set nopaste<cr>
        map <leader>nt :NERDTree<cr>

        map gca :LspCodeAction<cr>

    " }}}

    " visual mode {{{
                                  " (s)quare brackets []
        vnoremap is i[
        vnoremap as a[
                                  " (c)urly braces {}
        vnoremap ic i{
        vnoremap ac a{
                                  " (r)ound brackets ()
        vnoremap ir i(
        vnoremap ar a(
                                  " (p)ointy brackets <>
        vnoremap ip i<
        vnoremap ap a<

    " }}}

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:ctrlp_user_command = ['*.meta', '.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

