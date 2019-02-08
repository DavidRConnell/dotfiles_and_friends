function! matlab#InsertFunctionStub()
	let filename = expand("%:t:r")
	exe "normal!ggifunction " . filename
	normal!oend
	normal!gg
endfunction

function! matlab#GotoDefinition()
	let func = expand("<cword>")

	if DoesFileContain('function .* ' . func, expand('%'))
		return "[\<C-d>"
	endif

	let search_paths = join(b:custom_path, ',')
	let func_path = system('find {' . search_paths . '} -name ' . func . '.m | head -n1')

	if !empty(func_path)
		return ":tab drop " . func_path . "\<CR>"
	endif

	echom "Function not found"
endfunction

function! DoesFileContain(func, file)
	let numinstances = system('grep -c "' . a:func . '" ' . a:file)
	return numinstances > 0
endfunction

function! GetWordsIn(file)
	return system("grep -o '[[:alpha:]][[:alnum:]]*' " . a:file)
endfunction

function! GetFunctionsIn(path)
	let pattern = "/**/*.m' -not -path 'private' -exec basename {} \;"
	return systemlist("find " . a:path . pattern)
endfunction
