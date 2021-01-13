source ~/.config/nvim/writingft.vim

autocmd CompleteDone *.tex inoremap <buffer> <expr> <silent> <tab> latex#TeXComplete()

setlocal tabstop=2
setlocal shiftwidth=2
setlocal iskeyword+=:,\
setlocal define=\newcommand{
setlocal include=\usepackage{

" Enable $ sign completion
inoremap <buffer> $ $$<left>

syntax enable
syntax spell toplevel

" Build and view pdf
let b:dir = fnamemodify(getcwd(), ':t')
nnoremap <buffer> <leader>b :w<CR>:execute('!buildtexpdf ' . b:dir)<CR>
nnoremap <buffer> <leader>v :execute('!viewpdf ' . b:dir)<CR>
nnoremap <buffer> <leader>e :execute('!printtexerrors ' . b:dir)<CR>

" Goto files
nnoremap <buffer> <leader>m :exec('tab drop ' . b:dir . '.tex')<CR>

" Better complete
inoremap <buffer> <expr> <silent> <tab> latex#TeXComplete()
