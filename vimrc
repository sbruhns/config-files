" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'tpope/vim-abolish'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
call vundle#end()            " required

set nocompatible
set encoding=utf-8
filetype plugin indent on

set number
syntax on
set t_Co=256
color railscasts

let mapleader=","

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" tab definitions
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set list                        " show invisible characters

if has("autocmd")
  " use real tabs for certain file types
  autocmd Filetype {gitconfig,objc,java} setlocal noexpandtab
endif

"" List characters

set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\

if has("autocmd")
  " avoid showing trailing whitespace when in insert mode
  au InsertEnter * :set listchars-=trail:•
  au InsertLeave * :set listchars+=trail:•
endif

"" Searching

set hlsearch                    " highlight matches
set incsearch                   " incremental search
set ignorecase                  " searches are case insensitive...
set smartcase                   " ...unless a capital letter is used

"" Wildmenu completion

" ignore Rubinius, Sass cache files
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc
" ignore Bundler standalone/vendor installs, gems & node modules
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**
set wildignore+=node_modules/**

"" Mappings and convenience settings

" Easier split window navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Time out on key codes but not mappings
" Basically this makes terminal Vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=100

" Hitting return clears the search screen buffer
nnoremap <CR> :nohlsearch<cr>

" Typing :KillWhitespace strips trailing whitespace
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" Typing :w!! saves the file as sudo
cmap w!! %!sudo tee > /dev/null %


" previous opened buffer
nnoremap <leader>m <c-^>


" set NERDTreeToggle toggel to crtl+t
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" vimux
map <Leader>. :w<CR>:VimuxRunLastCommand<CR>
map <Leader>v :VimuxPromptCommand<CR>
map .t :CtrlP .<CR>
nnoremap .y :CtrlPTag<cr>

" rails vim Mappings
map <Leader>e :Rextract
map <Leader><Leader>r :RV<CR>
map <Leader><Leader>a :AV<CR>
map <Leader>r :R<CR>
map <Leader>a :A<CR>

let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
