" ============================================================================
" STATUSLINE
" ============================================================================

" Clear the previous 'statusline' conf.
set statusline=
set laststatus=2

" Function to get UTC time
function! UTCOffset()
    " %z return +0200, -0430, etc.
    let r = strftime("%z")
    " Convert '+0200' into '+2'; '-0430' into '-4.5'.
    let h = str2nr(r[0:2])
    let m = str2nr(r[3:4])
    return m == 0
        \ ? printf("UTC%+d", h)
        \ : printf("UTC%+g", h + m / 60.0)
endfunction

" File information
set statusline+=%t\ %M\ %Y\ %R
"set statusline+=\ %{strftime('%H:%M')}
set statusline+=\[%{&fileencoding}:%{&fileformat}]\ %p%%
"set statusline+=\ mode:\ %{mode()}

" Separator, align to the right
set statusline+=%=

" Position system
set statusline+=ASCII:\ %b\ hex:\ 0x%B\ %L\|%l\/%c
set statusline+=\ %{UTCOffset()}\ %{strftime('%H:%M')}
