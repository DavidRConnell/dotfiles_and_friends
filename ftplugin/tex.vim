autocmd CompleteDone *.tex inoremap <buffer> <expr> <silent> <tab> TeXComplete()

setlocal tabstop=2
setlocal shiftwidth=2
setlocal iskeyword+=:
setlocal define=\newcommand{
setlocal include=\usepackage{

" Dictionary and spelling
setlocal spell
setlocal infercase

let g:tex_concel=''
let g:vim_markdown_match=1

let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1
let g:vimtex_complete_recursive_bib=1
let g:vimtex_compiler_progname='nvr'

" Disable quote	completion
inoremap <buffer> " "
inoremap <buffer> ' '

" Build and view pdf
nnoremap <buffer> <leader>b :w<CR>:!./buildpdf<CR>
nnoremap <buffer> <leader>v :!./viewpdf<CR>

" Better complete
nnoremap <buffer> <leader><tab> a<C-x>s
inoremap <buffer> <expr> <silent> <tab> TeXComplete()

function! TeXComplete()
	let line = getline('.')
	call cursor(line, col('.')-1)

	let charleftofcurser = strpart(line, col('.')-1, 1)
	let isempty = strlen(charleftofcurser) == 0

	if charleftofcurser =~ "\\s" || isempty
	  return "\<tab>"
	endif

	let word = expand("<cWORD>")

	let figpattern = '\\inputfigure\(\[.*\]\)\{0,1\}{.*}'
	let figpattern = figpattern . '\|\\inputsubfigure\(\[.*\]\)\{0,1\}{.*}'
	if word =~ figpattern
		set completefunc=ListFigures
		let out = "\<C-x>\<C-u>"
	elseif word =~ '\\inputtable\(\[.*\]\)\{0,1\}{.*}'
		set completefunc=ListTables
		let out = "\<C-x>\<C-u>"
	elseif word =~ '\\inputsection{.*}\|\\inputsubsection{.*}'
		set completefunc=ListSections
		let out = "\<C-x>\<C-u>"
	elseif word =~ '\\autoref{.*}\|\\ref{.*}'
		set completefunc=ListLabels
		let out = "\<C-x>\<C-u>"
	elseif word =~ '\cite{.*}'
		let out = "\<C-x>\<C-o>"
	else
		let out = "\<C-n>"
	endif

	if word =~ '^\\[0-9a-z]*'
		setlocal complete=.,k~/.config/nvim/dicts/latexmacros.txt
		setlocal completeopt=longest,menu,preview
		inoremap <buffer> <tab> <C-p>
	else
		setlocal complete=.,kspell
		setlocal completeopt=menu,preview
		inoremap <buffer> <tab> <C-n>
	endif

	return out
endfunction

function! ListFolder(findstart, base, folder)
	if a:findstart
		" locate the start of the word
		let line = getline('.')
		let start = col('.') - 1
		while start > 0 && line[start - 1] =~ '\a'
			let start -= 1
		endwhile
		return start
	else
		" find files matching with "a:base"
		let res = []
		let files = expand("./" . a:folder . "/**", 0, 1)
		for f in files
			let m = matchstr(f, '[^\(./' . a:folder . '/\)].*\.')
			let m = fnamemodify(m, ":r")
			if m =~ '^' . a:base
				call add(res, m)
			endif
		endfor
		return res
	endif
endfunction

function! ListFigures(findstart, base)
	return ListFolder(a:findstart, a:base, 'figures')
endfunction

function! ListTables(findstart, base)
	return ListFolder(a:findstart, a:base, 'tables')
endfunction

function! ListSections(findstart, base)
	return ListFolder(a:findstart, a:base, 'sections')
endfunction

function! ListLabels(findstart, base)
	if a:findstart
		" locate the start of the word
		let line = getline('.')
		let start = col('.') - 1
		while start > 0 && line[start - 1] =~ '\a'
			let start -= 1
		endwhile
		return start
	else
		" find labels matching with "a:base"
		let res = []
		let labels = systemlist("grep -o -h -e '\label{[^}]*}' **/*.tex")
		for l in labels
			let m = matchstr(l, "\[^}\]*", 6)
			if m =~ '^' . a:base
				call add(res, m)
			endif
		endfor
		return res
	endif
endfunction
