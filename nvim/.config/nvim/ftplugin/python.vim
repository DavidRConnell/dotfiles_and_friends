setlocal define=def
setlocal iskeyword+=.

nnoremap <buffer> <leader>x :w<CR>:!python3 %<CR>
nnoremap <buffer> <leader>? :!echo "help(<cword>)" \| python3<CR>g
nnoremap <buffer> <leader>s :!grep -nh 'def' %<CR>
