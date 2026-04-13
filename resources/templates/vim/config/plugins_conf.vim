" ============================================================================
" PLUGINS CONFIGURATION
" ============================================================================

" Gruvbox config; https://github.com/morhetz/gruvbox
colorscheme gruvbox
set background=dark

" vim-cpp-enhanced-highlight config; https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

" vim-indent-guides; https://github.com/preservim/vim-indent-guides
" install 'vim-gtk3' or 'vim-gtk'.
let g:indent_guides_enable_on_vim_startup = 1

" rainbow_parentheses; https://github.com/kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
