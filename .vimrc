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
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

"...
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

" Preferences
"   Presentation
" Maximum count of tabs
set tabpagemax=50
set smartindent expandtab shiftwidth=4 tabstop=4
filetype plugin on
set colorcolumn=81
set title
set showmode
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

set spelllang=hu          " Set spelling language
set hidden                " Handle multiple buffers better

set hlsearch              " Highlight matches
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

                                  " Clear the search buffer when hitting return
        nnoremap <cr> :nohlsearch<cr>
                                  " Toggle search results
                                  nnoremap <f3> :set hlsearch!<cr>

                                  " Resize vertical splits
        nnoremap <silent> <leader>+ :execute 'vertical resize ' . (winwidth(0) * 12/10)<cr>
        nnoremap <silent> <leader>- :execute 'vertical resize ' . (winwidth(0) * 8/10)<cr>

                                  " Don't move on *
        nnoremap * *<c-o>

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
        map <leader>b :Bookmark 

                                  " Get the path of the current file
        noremap <c-i> :echo expand("%:p")<cr>
    " }}}

    " insert mode {{{
        inoremap wq <esc>
        inoremap qw <esc>

                                  " Toggle search results
        inoremap <f3> <esc>:set hlsearch!<cr>a
                                  " Toggle spell checking
        inoremap <f4> <esc>:set spell!<cr>a
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

    " command-line mode {{{
                                  " Use :w!! to save with sudo
        cnoremap w!! w !sudo tee % >/dev/null
                                  " Commonly misspelled commands
        command! Q q
        command! W w
        command! WQ wq
        command! Wq wq
    " }}}

    " operator-pending mappings {{{
        onoremap is i[
        onoremap as a[
        onoremap ic i{
        onoremap ac a{
        onoremap ir i(
        onoremap ar a(
        onoremap ip i<
        onoremap ap a<
    " }}}

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
 let g:rbpt_loadcmd_toggle = 0

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:ctrlp_user_command = ['*.meta', '.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

