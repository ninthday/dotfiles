" :: VimPlug - VIM plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/plug/vim-plug/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.vim/autoload && cd ~/.vim/autoload && ln -s ../plug/vim-plug/plug.vim .
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
Plug 'jwalton512/vim-blade'

Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'

Plug 'pangloss/vim-javascript'

Plug 'junegunn/vim-easy-align'  "vim alignment plugin
Plug 'SirVer/ultisnips'         "the ultimate snippet solution for Vim
Plug 'honza/vim-snippets'       "snippets files for various programming languages
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/vimfiler.vim'
Plug 'sheerun/vim-polyglot'     "a solid language pack for Vim
"Plug 'tpope/vim-fugitive'      "the best Git wrapper of all time
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'       "The fancy start screen for Vim
"Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'   "shows a git diff in the gutter and stages/undoes hunks
Plug 'Chiel92/vim-autoformat'   "Provide easy code formatting in Vim
Plug 'ryanoasis/vim-devicons'   "Adds file type glyphs/icons to popular Vim plugins
Plug 'rking/ag.vim'             "Vim plugin for the_silver_searcher
"Plug 'rizzatti/dash.vim'        "Search Dash.app from Vim
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' }

call plug#end()

" ---
" Theme
" ---
"set t_Co=256
"use 256-color in both of vim and gvim
let g:neodark#use_256color = 1 " default: 0
"use default terminal background
let g:neodark#terminal_transparent = 1 "default: 0
colorscheme neodark

set fillchars+=vert:│

" =================
"  plugin settings
" =================

" ---
" Tagbar
" ---
let g:tagbar_compact = 1

" ---
" GitGutter Symbols
" ---
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '='

" ---
" php cs fixer
" ---
let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_enable_default_mapping = 0

" =================
" Settings
" =================
set hidden
set mouse=a

"set nowrap        " don't wrap lines
set backspace=indent,eol,start

" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
" shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

filetype plugin indent on

set listchars=tab:›\ ,eol:¬   " Use the same symbols as TextMate for tabstops and EOLs

syntax enable
set nocompatible

" Tab behavior
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2

" Other
set clipboard=unnamed
set term=screen-256color

" ========== Custom Settings ==========
if filereadable(expand("~/.dotfiles/vim/settings.vim"))
    source ~/.dotfiles/vim/settings.vim
endif

" ---
" Post Load Fixes
" ---
function CorrectColorScheme()
  " Annoying tilde should be hidden
  highlight EndOfBuffer ctermfg=0 guifg=#282828

  highlight VertSplit ctermbg=NONE guifg=#404040 guibg=NONE
endfunction
autocmd VimEnter * call CorrectColorScheme()

" ---
" Mappings
" ---
let mapleader=","
let g:mapleader=","

"Quicksave command
noremap <C-A> :update<CR>
vnoremap <C-A> <C-C>:update<CR>
inoremap <C-A> <C-O>:update<CR>
map <leader>l :set list!<CR>
map <leader>w :set wrap!<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>m :TagbarToggle<CR>

map <leader>, :bp!<CR>
map <leader>. :bn!<CR>
map <leader>x :bd<CR>

nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gs :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

nmap <silent> <leader>d <Plug>DashSearch

