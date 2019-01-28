setlocal commentstring=%\ %s
setlocal define=function\\(.*=\\)\\{0,1}

" Tags
setlocal complete+=t
setlocal complete+=k~/.config/nvim/dicts/matlabcustom.txt
setlocal complete+=k~/.config/nvim/dicts/matlabbuiltins.txt
setlocal tags=$PWD/.tags

nnoremap <buffer> <expr> <silent> <leader>g matlab#GenerateTags()
nnoremap <buffer> <expr> <silent> <leader>d matlab#GotoDefinition()
nnoremap <buffer> <leader>? :!matman <cword><CR>g
