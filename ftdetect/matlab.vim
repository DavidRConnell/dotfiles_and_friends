autocmd BufNewFile *.m call InsertFunctionSnippit()

function InsertFunctionSnippit()
	let filename = expand("%:t:r")
	exe "normal!ggifunction ".filename
	normal!A()
	normal!oend
	normal!gg
endfunction
