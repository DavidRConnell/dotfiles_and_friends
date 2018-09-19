source ~/.config/nvim/writingft.vim

autocmd CompleteDone *.tex inoremap <buffer> <expr> <silent> <tab> latex#TeXComplete()

setlocal tabstop=2
setlocal shiftwidth=2
setlocal iskeyword+=:
setlocal define=\newcommand{
setlocal include=\usepackage{

" Make spell check work outside of document enviornment
syntax spell toplevel

" Enable $ sign completion
inoremap <buffer> $ $$<left>

" Build and view pdf
let b:dir = fnamemodify(getcwd(), ':t')
nnoremap <buffer> <leader>b :w<CR>:execute('!../buildpdf ' . b:dir)<CR>
nnoremap <buffer> <leader>v :execute('!../viewpdf ' . b:dir)<CR>
nnoremap <buffer> <leader>m :execute('!../printmessages ' . b:dir)<CR>

" Better complete
inoremap <buffer> <expr> <silent> <tab> latex#TeXComplete()
