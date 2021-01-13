function! comments#CommentLines(...)
	let comment_symbol = substitute(&commentstring, '\s*%s\s*', '', '')

	if a:1 == 'char' || a:1 == 'line'
		let line_start = line("'[")
		let line_end = line("']")
	else
		let line_start = line(".")
		let line_end = line(".")
	endif

	for lnum in range(line_start, line_end)
		if getline(lnum) =~ '^$'
			continue
		elseif getline(lnum) =~ '^\s*' . comment_symbol
			exe lnum . 's/^\(\s*\)' . comment_symbol . '\(\s\{-}\) \?/\1\2/'
		else
			exe lnum . 's/^\(\s*\)/\1' . comment_symbol . ' /'
		endif
	endfor

	exe 'nohl'
endfunction
