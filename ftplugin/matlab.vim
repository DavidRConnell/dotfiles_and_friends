setlocal commentstring=%\ %s
setlocal define=function\\(.*=\\)\\{0,1}

" Tags
setlocal complete+=t
setlocal tags=$PWD/.tags

nnoremap <buffer> <expr> <silent> <leader>g matlab#GenerateTags()
nnoremap <buffer> <leader>v :tab split<CR>:exec("tag " . expand("<cword>"))<CR>
