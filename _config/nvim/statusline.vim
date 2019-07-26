function! GitBranch()
	let b:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatusLineGitBranch()
	return strlen(b:branchname) > 0? '  ' . b:branchname . ' | ':''
endfunction

function! StatusLinePWD()
	return fnamemodify(getcwd(), ":~:r")
endfunction

function! StatusLineWordCount()
	return len(split(join(getline(1, '$')), '\W\+'))
endfunction

hi User1 gui=None guifg=#282a36 guibg=#8986d1
hi User3 gui=None guibg=#282a36 guifg=#8986d1
function! HighlightIfModified()

	if &modified
		hi User2 gui=None guifg=#ffffff guibg=#8986d1
	else
		hi User2 gui=None guifg=#282a36 guibg=#8986d1
	endif
endfunction

au BufEnter * call HighlightIfModified()
au BufEnter * call GitBranch()
au TextChanged * call HighlightIfModified()
au TextChangedI * call HighlightIfModified()
au BufWritePost * call HighlightIfModified()

set statusline=%1*
set statusline+=%{StatusLineGitBranch()}
set statusline+=\ %<%{StatusLinePWD()}\ \.""
set statusline+=\%2*
set statusline+=\ %f
set statusline+=%=
set statusline+=%1*
set statusline+=\ %Y\ \|""
set statusline+=\ %l/%L
set statusline+=\ :\ %c
set statusline+=\ ""

set tabline=%!MyTabLine()
function! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
	" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%1*'
		else
			let s .= '%3*'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{MyTabLabel(' . (i + 1) . ')} %3*|'
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%3*%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%3*%999Xclose'
	endif

	return s
endfunction

function! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let name = bufname(buflist[winnr - 1])
	let label = fnamemodify(name, ':t')

	if getbufvar(a:n, "&mod")
		return '*' . label
	else
		return label
	endif
endfunction
