source $VIMRUNTIME/ftplugin/matlab.vim
setlocal commentstring=%\ %s
setlocal define=function\\(.*=\\)\\{0,1}


" Function complete
let b:custom_path = [
			\ '$PWD',
			\ '$HOME/Documents/MATLAB',
			\ '$work/programs/readers']


setlocal complete+=k~/.config/nvim/dicts/matlabbuiltins.txt


" Local key bindings
nnoremap <buffer> <expr> <silent> <leader>g matlab#GenerateTags()
nnoremap <buffer> <localleader>.. :Open ~/.config/nvim/ftplugin/matlab.vim<CR>
nnoremap <buffer> <localleader>.s :so ~/.config/nvim/ftplugin/matlab.vim<CR>

nnoremap <buffer> <expr> <silent> <leader>d matlab#GotoDefinition()
nnoremap <buffer> <leader>? :!matman <cword><CR>g
nnoremap <buffer> <leader>l :!grep -nh function %<CR>

" Better complete
" inoremap <buffer> <expr> <silent> <tab> matlab#Complete()


" Keyword matching
let b:match_words = '\<\%(if\|switch\|for\|while\|function\)\>:'
			\ . '\<\%(elseif\|else\|case\|otherwise\)\>:'
			\ .	'\<end\>$'
