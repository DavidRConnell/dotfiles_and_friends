autocmd BufNewFile,BufRead *.sh,*.command set filetype=zsh
autocmd BufNewFile,BufRead * if strlen(expand('%:e')) == 0 | set filetype=zsh | endif
