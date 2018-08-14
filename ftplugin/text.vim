" Don't highlight end of line spaces
autocmd InsertLeave *.txt match 

" Remove quote completion
inoremap <buffer> " "
inoremap <buffer> ' '

" Ditionary and spelling
setlocal spell
setlocal complete+=k/usr/share/dict/words
setlocal infercase
