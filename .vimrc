set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive' " Git support within vim
Plugin 'tpope/vim-endwise' " Automatically adds end to ruby files 
Plugin 'tpope/vim-surround' " Edit tags or punctuations surrounding text units
Plugin 'tpope/vim-repeat' " Allow . repeating for vim-surround
Plugin 'tpope/vim-rails' " Vim plugin for everything rails
Plugin 'scrooloose/nerdtree' " File navigator for vim
Plugin 'scrooloose/syntastic' " Syntax checker
Plugin 'scrooloose/nerdcommenter' " Easier comment manipulation
Plugin 'altercation/vim-colors-solarized' " solarized color scheme
Plugin 'vim-airline/vim-airline' " status/tabline provider
Plugin 'majutsushi/tagbar' " Class outline viewer
Plugin 'valloric/youcompleteme' " Fuzzy-search code completion engine
Plugin 'ctrlpvim/ctrlp.vim' " Full path fuzzy file, ubffer, tag ... finder
Plugin 'beloglazov/vim-online-thesaurus' " Online thesaurus!
Plugin 'kana/vim-textobj-user' " Allow creation of custom text objects
Plugin 'reedes/vim-pencil' " Writing tool for vim
Plugin 'reedes/vim-textobj-sentence' " Improve sentence text object detection
Plugin 'raimondi/delimitMate' " Autoclose parantheses
Plugin 'mattn/emmet-vim' " Expanding HTML abbreviations support
Plugin 'mattn/webapi-vim' " vim interface to Web API. Installed for custom emmet snippet supprt
Plugin 'tpope/vim-ragtag' " Mapping for HTML,XML, ERB and more
Plugin 'vim-ruby/vim-ruby' " Vim-ruby
Plugin 'christoomey/vim-tmux-navigator' " Allow seamless transition between vim splits and tmux panes
Plugin 'elixir-lang/vim-elixir' " Vim-elixir
Plugin 'slashmili/alchemist.vim' " Vim tooling for Elixir
Plugin 'pangloss/vim-javascript' " Vim-javascript

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

syntax on

" General settings
set history=700 " Lines of vim history
set autoread " auto read when a file is changed from outside
set encoding=utf-8 " default encoding
setglobal fileencoding=utf-8
set clipboard=unnamed " use system clipboard
set wildmenu
set laststatus=2

" Text display
set textwidth=79
set showmatch
set cursorline
set autoindent
set linebreak
set wrap

" No backup
set nobackup
set nowb
set noswapfile

" No sound on errors
set noerrorbells
set novisualbell " Use visual bell instead of beeping in case of error
set t_vb=
set tm=500

" Indentation
set softtabstop=2
set shiftwidth=2
set expandtab

" Navigation guidelines
set number
set relativenumber
set ruler

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Key rebinding for convenience
noremap ; :
noremap : ;
nnoremap j gj
nnoremap k gk

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" Coloring
colorscheme solarized
let g:solarized_termtrans = 1
set background=dark

function! BgToggleSol()
  if &background == "light"
    execute ":set background=dark"
  else
    execute ":set background=light"
  endif
endfunction

nnoremap <F6> :call BgToggleSol()<CR>

" vim-pencil setup
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
augroup END

" vim-textobj-sentence setup
augroup textobj_sentence
  autocmd!
  autocmd FileType markdown,mkd,md call textobj#sentence#init()
augroup END

" vim-ragtag setup
let g:ragtag_global_maps = 1

" NERDTree setup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <C-N> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1

" Ctrlp setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Emmet setting
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom_emmet.json')), "\n"))
