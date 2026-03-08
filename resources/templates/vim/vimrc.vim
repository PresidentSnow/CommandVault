"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ============================================================================
" GENERAL OPTIONS
" ============================================================================

" Encoding
set encoding=utf8

" Line number
set number
set norelativenumber

" Identation
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

" General
set mouse=
set clipboard=unnamedplus
set confirm
set spell
set history=20

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Syntax highlighting
syntax on

" ============================================================================
" SHORTCUTS
" ============================================================================

" Show lines with Ctrl+s
nnoremap <C-s> :echo line('$') . " lines"<CR>

" ============================================================================
" STATUSLINE
" ============================================================================
set statusline=

" File information
set statusline+=%F
set statusline+=\ %M
set statusline+=\ %Y
set statusline+=\ %R

" Separator
set statusline+=%=

" Position system
set statusline+=ascii:\ %b " ASCII
set statusline+=\ hex:\ 0x%B " hexadecimal
set statusline+=\ row:\ %l " line number
set statusline+=\ col:\ %c " line column
set statusline+=\ percent:\ %p%% " porcentage
set laststatus=2
