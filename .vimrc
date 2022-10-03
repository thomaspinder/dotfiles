set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Julia support
Plugin 'JuliaEditorSupport/julia-vim'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'Shougo/deoplete-lsp'

" Rainbow coloured bracket matching
Plugin 'frazrepo/vim-rainbow'

" Lightline bar at the bottom of Vim. Lighter and easier to customise than
" Powerline
Plugin 'itchyny/lightline.vim'

" Dark colour scheme
Plugin 'drewtempelmeyer/palenight.vim'

" Vertical line to denote indentation levels
Plugin 'Yggdroot/indentLine'

" FZF
" Allows different files to be opened with :Files <path/to/file>
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" Smooth scrolling
Plugin 'psliwka/vim-smoothie'

" Better startscreen
Plugin 'mhinz/vim-startify'

" Comment multiple lines
Plugin 'preservim/nerdcommenter'

" Jump to signature marks in code
" Place mark with <mx> where x can be any character
" Jump to next line containing a mark with <]'>
" Jump to previous line containing a mark with <['>
" Remove mark with <dmx> where x can be any character
Plugin 'kshenoy/vim-signature'

" NerdTree
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons' " Icons in NerdTree

" Tmux tab navigator
Plugin 'christoomey/vim-tmux-navigator'

" Julia LanguageServer
Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plugin 'roxma/nvim-completion-manager'  " optional

" Markdown support
Plugin 'gabrielelana/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" R support
Plugin 'jalvesaq/Nvim-R', {'branch': 'stable'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""""""""""""""""""""""""""""""""""""
" Nerdtree settings
""""""""""""""""""""""""""""""""""""
" Ignore certain extensions in NerdTree
let NERDTreeIgnore = ['\.pyc$','\.o$','\.obj$']
" Exit NerdTree once a file has been opened
let NERDTreeQuitOnOpen = 1
" Set NerdTree UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Close tab if only nerdtree remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Map C-n to open NerdTree
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E226'
let g:syntastic_always_populate_loc_list = 1

""""""""""""""""""""""""""""""""""""""
" General code settings
""""""""""""""""""""""""""""""""""""""
" Enable rainbow coloured bracket matching globally
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""""""""""
" Lifeline Config
""""""""""""""""""""""""""""""""""""""""
" Set colorschmes
if !has('gui_running')
  set t_Co=256
endif
" Remove INSERT as it's shown in Lifeline
set noshowmode
" Configure colour scheme and show Git branch in Lifeline bar
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified' ],
      \             ['gitbranch']
      \           ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""
" LSP Settings
""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""
" Markdown Settings
""""""""""""""""""""""""""""""
let g:markdown_enable_spell_checking = 1
let g:mkdp_browser = 'firefox'

""""""""""""""""""""""""""""""
" Remaining options
""""""""""""""""""""""""""""""
" Set indentation marker colour
let g:indentLine_setColors = 116
" Set indentation character
let g:indentLine_char = '┆'

" Indentation settings
set ai " Turn on autoindenting
set expandtab " Expand tabs to spaces
set tabstop=4 " Make a tab 4 spaces
set shiftwidth=4 " Use 4 spaces for autodindenting
set smarttab " Insert tabs at the start of the line according to shiftwidth
set autoindent " Automaticcaly do indnetations
set copyindent " Preserve indentations when copying

" Highlighting settings
syntax on "Highlight syntax
filetype plugin on " Use file type plugins
set hlsearch " Highlight search terms
set incsearch " Show search matches as you type

" Deletion settings
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

" Cursor settings
set ruler               " show the cursor position

" Scrolling settings
set scrolloff=4 " keep 4 lines off the edges of the screen when scrolling
set lazyredraw
set ttyfast
set nocuc nocul
set cursorline " Highling cursor's entire line
:hi CursorLine   cterm=None ctermbg=darkgray ctermfg=white guibg=turquoise4 guifg=white

" History settings
set noswapfile " Don't bother with swap files
set nobackup " Don't bother with cluttering backup files
set wildmenu " make tab completion for files/buffers act like bash
set wildmode=list:full " show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class

" Visual effect
set title " change the terminal's title

" Keymappings
set backspace=2 " Make backspace actually work

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Relative line numbers
:set number relativenumber
:set nu rnu

" Automatically work from current directory
:set autochdir

" Roll onto next line
set whichwrap+=<,>,[,]
" Comment multiple lines
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
