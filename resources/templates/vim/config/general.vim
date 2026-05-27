" ============================================================================
" GENERAL OPTIONS
" ============================================================================

" Encoding
set encoding=utf8

" History
set viminfo=

" Line number
set number
set norelativenumber

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Visual
set wrap
set cursorline
set cursorcolumn
set termguicolors

" Search
set ignorecase
set hlsearch
set incsearch
set smartcase
set showmatch

" Activate 'CursorHold' after 300 ms of activity
set updatetime=280

" Highlighted words that match
autocmd CursorHold * silent! exe 'match Search /\V\<'.escape(expand('<cword>'), '\').'\>/'
autocmd CursorMoved * silent! match non

" General
set mouse=
set clipboard=unnamedplus
set confirm
set nospell
" set spell spelllang=en,es
set history=20

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Show spaces and tabs
"set list
"set listchars=tab:>-,space:·

" FOLDING

set foldenable
set foldmethod=manual
" The smaller the number, the more folded the file will be
set foldlevel=1
set foldnestmax=10

" TEMPORARY FILES

set noswapfile
set nobackup
set nowritebackup
set noundofile
