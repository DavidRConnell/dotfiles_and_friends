" Don't highlight trailing spaces
autocmd InsertLeave *.tex match

setlocal tabstop=2
setlocal shiftwidth=2
setlocal iskeyword+=:

" Ditionary and spelling
setlocal spell
setlocal complete+=k/usr/share/dict/words
setlocal infercase

let g:tex_concel=''

let g:vim_markdown_match=1

let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1
let g:vimtex_complete_recursive_bib=1
let g:vimtex_compiler_progname='nvr'

let g:livepreview_previewer='open -a Skim.app'
" let b:SuperTabContextTextMemberPatterns=['\cite{', '\ref{']

" Disable quote completation
inoremap <buffer> " " 
inoremap <buffer> ' '
