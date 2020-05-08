set nocompatible
runtime macros/matchit.vim
    filetype indent plugin on
set is
set encoding=utf-8
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:ackprg = 'ag --nogroup --nocolor --column'
" ========== autocomplete
Plugin 'styled-components/vim-styled-components'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0
let mapleader = ","

" ========= snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-startify'
let g:indentLine_char = '.'

Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'easymotion/vim-easymotion'

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-Tab>"

" ========== ruby plugins
Plugin 'tpope/vim-dispatch'
Plugin 'jgdavey/tslime.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'

"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:rspec_command = "Dispatch rspec {spec}"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>

"====== Handling the Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \   'vue': ['eslint']
      \
      \}

let g:ale_fixers = {
      \    '*': ['remove_trailing_lines', 'trim_whitespace'],
      \    'javascript': ['eslint'],
      \    'vue': ['eslint'],
      \    'scss': ['prettier']
      \
      \}

" set up ascii for my startify

let g:ale_fix_on_save = 1
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:typescript_ignore_browserwords = 1
let g:typescript_ignore_typescriptdoc = 1
" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ========== colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'michaeljsmith/vim-indent-object'

" =========== git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jparise/vim-graphql'
Plugin 'vim-syntastic/syntastic'

" ==== enable matchit
" =========== markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'dyng/ctrlsf.vim' " for really nice search results like in sublime
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'itspriddle/vim-jquery'
Plugin 'tpope/vim-haml'
Plugin 'junegunn/goyo.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
"========= syntax helpers
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'Chiel92/vim-autoformat'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lambdalisue/vim-django-support'
Plugin 'alvan/vim-closetag'
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.php,*.phtml,*.js,*.jsx,*.coffee,*.erb'


"======= eslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_ruby_checkers = ['rubocop']

" ========= file tree
Plugin  'scrooloose/nerdtree'

  let NERDTreeIgnore = [ '__pycache__',  '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules/' ]
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=1
" ========= rails
Plugin 'kchmck/vim-coffee-script'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'ngmy/vim-rubocop'
" ========= navigation
Plugin 'christoomey/vim-tmux-navigator'
  " autostart nerd-tree
  autocmd StdinReadPre * let s:std_in=1
  " nerdtree toggle
  map <C-t> :NERDTreeToggle<CR>
Plugin 'zhaocai/GoldenView.Vim'
  let g:goldenview__enable_default_mapping = 0
Plugin 'benmills/vimux'
  " vimux binding
  map <Leader>vp :VimuxPromptCommand<CR>
  nmap <F8> :TagbarToggle<CR>

" ======= fuzzy find
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'

" ======= extras
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'majutsushi/tagbar'
Plugin 'wincent/command-t'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ============= extra settings
syntax on

" tabs to 2 spaces
" set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set hidden
:set guioptions-=m " remove menu bar
:set guioptions-=T " remove toolbar
:set guioptions-=r " remove right-hand scroll bar
:set guioptions-=L " remove left-hand scroll bar
":set lines=999 columns=999
set shortmess+=A " disable swap file warning

" hybrid line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" colorschemes
" Dark: monokai-chris, gruvbox
" Light: ChocolatePapaya
Plugin 'morhetz/gruvbox'
colorscheme gruvbox
  let g:gruvbox_contrast_dark='default'
  let g:gruvbox_contrast_light='default'
" split below and right feels more natural
set splitbelow
set background=dark
" no wrapping
set nowrap

" allow backspace immediately after insert
set bs=2

" useful aliases
cnoreabbrev W w
cnoreabbrev Q q

" save undo in a file
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000


" tmux will only forward escape sequences to the terminal if surrounded by a
" DCS sequence
" "
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Folding
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

map ; :Files<CR>

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

"html
"  isnowfy only compatible with python not python3
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'


"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

call vundle#end()            " required
filetype plugin indent on    " required

