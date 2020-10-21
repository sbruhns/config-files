" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'bling/vim-airline'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails', {'tag': 'v5.4'}
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
" Plug 'Shougo/neocomplete.vim'
" Plugin 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'elzr/vim-json'
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go'
Plug 'ngmy/vim-rubocop'
Plug 'morhetz/gruvbox'
Plug 'ekalinin/Dockerfile.vim'
" Plin 'jodosha/vim-godebug'
Plug 'mattn/emmet-vim'
" Plin 'trevordmiller/nova-vim'
Plug 'iurifq/ctrlp-rails.vim'
Plug 'ElmCast/elm-vim'
" Plin 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
" Plin 'flazz/vim-colorschemes'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'c-brenn/phoenix.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            " required

set nocompatible
set encoding=utf-8
filetype plugin indent on
" set term=xterm-256color
" set term=screen-256color
" set t_ut=
" colorscheme gruvbox
set termguicolors
set number
syntax on
" highlight Normal ctermbg=white
" set t_Co=16                       " force vim to use 256 color
" let g:solarized_termcolors=16      " use solarized 256 fallback
set background=dark
colorscheme solarized8
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

let g:rspec_command = "bin/rspec {spec}"

" vimux
map <Leader>. :w<CR>:VimuxRunLastCommand<CR>
map <Leader>v :VimuxPromptCommand<CR>
" CtrlP
set wildignore+=*/elm-stuff/*,*/.git/*
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100
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
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 2

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
        " \ }

" Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
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
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType go setlocal omnifunc=go#complete#Complete
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
" autocmd FileType elm setlocal omnifunc=elmcomplete#Complete

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

" filetypes
au BufNewFile,BufRead *.elm set filetype=elm
au BufNewFile,BufRead *.elmx set filetype=elm
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir
au BufNewFile,BufRead *.eex set filetype=elixir
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.slim set filetype=slim

let g:elm_format_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1
let g:turbux_command_rspec  = 'bin/rspec'
" call neocomplete#util#set_default_dictionary(
  " \ 'g:neocomplete#sources#omni#input_patterns',
  " \ 'elm',
  " \ '\.')
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$ tags', 'file': '\v\.(so|swp|zip|tar)$'}

let g:ycm_semantic_triggers = { 'elm' : ['.'], }


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Ack using silversercher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
