autocmd BufNewFile,BufRead *.sh,*.command set filetype=zsh
autocmd BufNewFile,BufRead * if getline(1) =~ '#!/bin/zsh' | set filetype=zsh | endif
