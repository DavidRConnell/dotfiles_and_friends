function! matlab#GenerateTags()
	let tagspath = getcwd() . '/.tags'
	let files = systemlist('find *\.m')

	let _ = system("rm -f" . tagspath)
	for file in files
		let newline = fnamemodify(file, ':r') . '\t' . file . '\t1'
		let _ = system('echo "' . newline . '" >> ' . tagspath)
	endfor

endfunction
