setlocal define=def
let b:path="~/Library/Python/2.7/lib/python/site-packages /usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7 ~/Google_Drive/Programs/MyModules"

" inoremap <buffer> <expr> <silent> <tab> PythonComplete()

function! PythonComplete()
	let line = getline('.')
	call cursor(line, col('.')-1)

	let charleftofcurser = strpart(line, col('.')-1, 1)
	let isempty = strlen(charleftofcurser) == 0

	if charleftofcurser =~ "\\s" || isempty
	  return "\<tab>"
	endif

	let word = expand("<cWORD>")
	let imported = FindImports()

	for import in imported
		let import = matchstr(import, '[^(import )].*')
		if word =~ import . '.'
			let b:last_import=import
			set completefunc=FindModuleDefs
			return "\<C-x>\<C-u>"
		endif
	endfor

endfunction

function! FindImports()
	let imports = systemlist('grep -o "import .*" ' . expand('%:p'))
	return imports
endfunction

function! FindModuleDefs(findstart, base)
	if a:findstart
		return FindStart()
	else
		res = []
		let files = systemlist('find ' . b:path . '-name ' . b:last_import)
		let defs = systemlist('grep -o "def *" ' . files[0])
		for def in defs
			return def
			let def = matchstr(def, '[^(def )].*')
			if def =~ '^' . a:base
				call add(res, def)
			endif
		endfor
		return res
	endif
endfunction

function! FindStart()
		" locate the start of the word
		let line = getline('.')
		let start = col('.') - 1
		while start > 0 && line[start - 1] =~ '\a'
			let start -= 1
		endwhile
		return start
endfunction
