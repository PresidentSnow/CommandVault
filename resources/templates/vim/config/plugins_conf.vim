" ============================================================================
" PLUGINS CONFIGURATION
" ============================================================================

" Gruvbox config; https://github.com/morhetz/gruvbox
colorscheme gruvbox
set background=dark

" ----------------------------------------------------------------------------
" vim-cpp-enhanced-highlight config; https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

" ----------------------------------------------------------------------------
" vim-indent-guides; https://github.com/preservim/vim-indent-guides
" install 'vim-gtk3' or 'vim-gtk'.
let g:indent_guides_enable_on_vim_startup = 1

" configure the colors

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#504955 ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#665c54 ctermbg=241

" ----------------------------------------------------------------------------
" rainbow_parentheses; https://github.com/kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle " Toggle
au Syntax * RainbowParenthesesLoadRound " ()
au Syntax * RainbowParenthesesLoadSquare " []
au Syntax * RainbowParenthesesLoadBraces " {}
"au Syntax * RainbowParenthesesLoadChevrons " <>

" options:
let g:rbpt_max = 10 " nesting level
let g:rbpt_loadcmd_toggle = 0

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" ----------------------------------------------------------------------------
" nerdtree; https://github.com/preservim/nerdtree
"autocmd VimEnter * NERDTree
let g:NERDTreeWinSize = 20
let g:NERDTreeShowHidden = 1 " 'I' to toggle it
