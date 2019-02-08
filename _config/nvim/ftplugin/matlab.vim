source $VIMRUNTIME/ftplugin/matlab.vim
setlocal commentstring=%\ %s
setlocal define=function\\(.*=\\)\\{0,1}


" Function complete
let b:custom_path = [
			\ '$PWD',
			\ '$HOME/Documents/MATLAB',
			\ '$rush/programs/readers',
			\ '$rush/programs/bin']


setlocal complete+=k~/.config/nvim/dicts/matlabbuiltins.txt


" Local key bindings
nnoremap <buffer> <expr> <silent> <leader>g matlab#GenerateTags()
nnoremap <buffer> <expr> <silent> <leader>d matlab#GotoDefinition()
nnoremap <buffer> <leader>? :!matman <cword><CR>g
nnoremap <buffer> <leader>l :grep -h 'function' %<CR>

" Better complete
" inoremap <buffer> <expr> <silent> <tab> matlab#Complete()


" Keyword matching
let b:match_words = '\<\%(if\|switch\|for\|while\|function\)\>:'
			\ . '\<\%(elseif\|else\|case\|otherwise\)\>:'
			\ .	'\<end\>$'
