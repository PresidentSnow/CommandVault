" ============================================================================
" MAPPINGS
" ============================================================================

" Show lines with Ctrl + s/S
nnoremap <C-s> :echo line('$') . " lines"<CR>
" Execute the script F5
nnoremap <F5> :w<CR>:!chmod +x % && ./%<CR>
" Open and terminal F8
nnoremap <F8> :terminal<CR>
" Close terminal Ctrl + F8
tnoremap <C-F8> <C-\><C-n>:bd!<CR>
" Show spaces and tabs with Ctrl  + l/L
" nnoremap <C-l> :set list!<CR>

" ============================================================================
" NERDTREE
" ============================================================================

nnoremap <C-b> :NERDTreeToggle<CR>
