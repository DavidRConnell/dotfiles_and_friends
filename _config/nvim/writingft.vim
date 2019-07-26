setlocal formatoptions+=t

" Remove quote completion
inoremap <buffer> ' '

" Ditionary and spelling
setlocal spell
setlocal complete=.,kspell
setlocal infercase

" Spell complete
nnoremap <buffer> <expr> <silent> <tab> spell#FixSpelling()

setlocal statusline+=\ \|\ wc\ %{StatusLineWordCount()}\ ""
