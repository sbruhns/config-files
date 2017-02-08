" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'jpo/vim-railscasts-theme'
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
" Plugin 'garbas/vim-snipmate'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json'
Plugin 'joshdick/onedark.vim'
Plugin 'fatih/vim-go'
Plugin 'ngmy/vim-rubocop'
Plugin 'morhetz/gruvbox'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'jodosha/vim-godebug'
Plugin 'mattn/emmet-vim'
Plugin 'trevordmiller/nova-vim'
call vundle#end()            " required

set nocompatible
set encoding=utf-8
filetype plugin indent on
set term=xterm-256color
set t_ut=
" set t_Co=256
" let g:rehash256 = 1
colorscheme nova
set number
syntax on
" highlight Normal ctermbg=white
" set background=dark
" highlight Normal  ctermbg=none

let mapleader=","

" disable arrow keys to force using of hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


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

let g:rspec_command = "!spring rspec --drb {spec}"

" vimux
map <Leader>. :w<CR>:VimuxRunLastCommand<CR>
map <Leader>v :VimuxPromptCommand<CR>
map .t :CtrlP .<CR>
nnoremap .y :CtrlPTag<cr>

" rails vim Mappings
map <Leader>e :Rextract
map <Leader><Leader>r :RV<CR>
map <Leader><Leader>a :AV<CR>
au FileType rb map <Leader>r :R<CR>
map <Leader>a :A<CR>

let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["sass", "scss"] }

if has("mac") || has("macunix")
  let g:syntastic_ruby_mri_exec = '~/.rbenv/shims/ruby'
endif

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

nmap <Leader>b :TagbarToggle<CR>

nmap <space> viw
nmap ts :ts<CR>

function! GenerateCtags()
  :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
endfunction

command! GenerateCtags call GenerateCtags()

function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

nnoremap <leader>] :call FollowTag()<CR>

let g:go_fmt_command='goimports'
let g:go_alternate_mode = "vsplit"
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

autocmd Filetype go nmap <leader>a :GoAlternate<CR>
autocmd Filetype go nmap <leader>t :GoTest<CR>
autocmd Filetype go nmap <leader>T :GoTestFunc<CR>
autocmd Filetype go nmap <leader>I :GoInfo<CR>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

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

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')

endif
nmap <space> viw
nmap ts :ts<CR>

function! GenerateCtags()
  :!ctags -R --languages=ruby --exclude=.git --exclude=tmp --exclude=log . $(bundle list --paths)
endfunction

command! GenerateCtags call GenerateCtags()

function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

nnoremap <leader>] :call FollowTag()<CR>

let g:go_term_mode = "vsplit"
let g:go_fmt_command='goimports'
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType map <leader>n :cnext<CR>
autocmd FileType noremap <leader>a :cclose<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
