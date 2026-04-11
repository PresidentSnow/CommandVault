" ============================================================================
" PLUGINS
" ============================================================================

" Vim plug manager: 'VimPlug'
" Install 'VimPlug': curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Install plugins: ':PlugInstall'
" INFO SOURCE: https://vimawesome.com/

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
Plug 'preservim/nerdtree'

call plug#end()
