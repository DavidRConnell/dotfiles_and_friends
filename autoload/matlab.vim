function! matlab#GenerateTags()
	let tagspath = getcwd() . '/.tags'
	let files = systemlist('find **/*\.m')

	let _ = system("rm -f " . tagspath)
	for file in files
		let newline = fnamemodify(file, ':t:r') . '\t' . file . '\t1'
		let _ = system('echo "' . newline . '" >> ' . tagspath)
	endfor

endfunction

function! matlab#AppendToTags()
	let tagspath = getcwd() . '/.tags'
	let doestagsexists = !empty(glob(tagspath))

	if doestagsexists
		let newline = expand('%:r') . '\t'. expand('%:t') . '\t1'
		let _  = system('echo "' . newline . '" >> ' . tagspath)
	endif
endfunction

function matlab#InsertFunctionSnippit()
	let filename = expand("%:t:r")
	exe "normal!ggifunction ".filename
	normal!A()
	normal!oend
	normal!gg
endfunction
