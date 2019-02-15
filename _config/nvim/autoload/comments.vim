function! comments#CommentLines(...)
	let comment_symbol = substitute(&commentstring, '%s', '', '')

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
		elseif getline(lnum) =~ '^' . comment_symbol
			exe lnum . "s/" . comment_symbol . "//"
		else
			exe lnum . "s/^/" . comment_symbol . "/"
		endif
	endfor

	exe 'nohl'
endfunction
