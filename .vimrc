set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
" plugin on GitHub repo
Plug 'tpope/vim-fugitive' " Git support within vim
Plug 'tpope/vim-endwise' " Automatically adds end to ruby files 
Plug 'tpope/vim-surround' " Edit tags or punctuations surrounding text units
Plug 'tpope/vim-repeat' " Allow . repeating for vim-surround
Plug 'tpope/vim-rails' " Vim plugin for everything rails
Plug 'scrooloose/nerdtree' " File navigator for vim
Plug 'scrooloose/syntastic' " Syntax checker
Plug 'scrooloose/nerdcommenter' " Easier comment manipulation
Plug 'altercation/vim-colors-solarized' " solarized color scheme
Plug 'vim-airline/vim-airline' " status/tabline provider
Plug 'majutsushi/tagbar' " Class outline viewer
Plug 'ctrlpvim/ctrlp.vim' " Full path fuzzy file, ubffer, tag ... finder
Plug 'kana/vim-textobj-user' " Allow creation of custom text objects
Plug 'reedes/vim-pencil' " Writing tool for vim
Plug 'reedes/vim-textobj-sentence' " Improve sentence text object detection
Plug 'reedes/vim-lexical' " Build on Vim’s spell/thes/dict completion
Plug 'reedes/vim-wordy' " Uncover usage problems in your writing
Plug 'reedes/vim-litecorrect' " Lightweight auto-correction for Vim
Plug 'raimondi/delimitMate' " Autoclose parantheses
Plug 'mattn/emmet-vim' " Expanding HTML abbreviations support
Plug 'mattn/webapi-vim' " vim interface to Web API. Installed for custom emmet snippet supprt
Plug 'tpope/vim-ragtag' " Mapping for HTML,XML, ERB and more
Plug 'vim-ruby/vim-ruby' " Vim-ruby
Plug 'christoomey/vim-tmux-navigator' " Allow seamless transition between vim splits and tmux panes
Plug 'elixir-lang/vim-elixir' " Vim-elixir
Plug 'slashmili/alchemist.vim' " Vim tooling for Elixir
Plug 'pangloss/vim-javascript' " Vim-javascript
Plug 'eagletmt/neco-ghc' " Autocompletion for Haskell
Plug 'eagletmt/ghcmod-vim' " Vim support for GHC-mod
Plug 'Shougo/vimproc.vim', {'do': 'make'} " Vimproc for GHC-mod
Plug 'elmcast/elm-vim' " Elm support
Plug 'idris-hackers/idris-vim' " Idris support
Plug 'raichoo/purescript-vim' " Purescript support
Plug 'neoclide/coc.nvim' " Autocomplete

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

syntax on

" General settings
set history=700 " Lines of vim history
set autoread " auto read when a file is changed from outside
set encoding=utf-8 " default encoding
setglobal fileencoding=utf-8
set clipboard=unnamedplus,unnamed
set wildmenu
set laststatus=2
set pyxversion=3

" Text display
set textwidth=100
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

" vim-pencil setup
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'soft'})
augroup END

" vim-textobj-sentence setup
augroup textobj_sentence
  autocmd!
  autocmd FileType markdown,mkd,md call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
augroup END

" vim-lexical setup
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,md call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init()
augroup END

" vim-litecorrect setup
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
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
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Emmet setting
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom_emmet.json')), "\n"))

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd Filetype haskell setlocal shiftwidth=4 softtabstop=4 expandtab

" Use eslint for JS
let g:syntastic_javascript_checkers = ['eslint']

" elm-vim settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab
