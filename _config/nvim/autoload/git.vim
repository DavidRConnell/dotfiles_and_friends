function! GetBranch()
	let branch = system('git branch | grep \* | cut -d" " -f2')
	if branch =~ 'HEAD'
		return -1
	endif
	return branch
endfunction

let g:branch=GetBranch()

function! git#CheckoutCommit(direction, count)
	let current_commit = GetSha1()
	let commit_list = GetCommitList()
	let idx = index(commit_list, current_commit)
	let num_commits = len(commit_list)

	if a:direction == "next"
		if idx == 0
			echo("At Earlist Commit")
		elseif idx - a:count <= 0
			let branch = GetBranch()
			if g:branch == -1 && branch == -1
				let _ = system('git reset ' . commit_list[0] . ' &>/dev/null')
				echo("Reset to earlist commit " . commit_list[0])
			else
				if branch == -1
					let branch = g:branch
				endif

				let _ = system('git checkout ' . branch . ' &>/dev/null')
				echo("Checked out branch " . branch)
			endif
		else
			let _ = system('git checkout ' . commit_list[idx - a:count] . ' &>/dev/null')
			echo("Checked out commit " . commit_list[idx - a:count])
		endif
	endif

	if a:direction == "previous"
		if idx + a:count == num_commits
			echo("At Last Commit")
		else
			let _ = system('git checkout '. commit_list[idx + a:count] . ' &>/dev/null')
			echo("Checked out commit " . commit_list[idx + a:count])
		endif
	endif
endfunction

function! GetSha1()
	return system('echo ${"$(git show HEAD | head -n1)":7:7}')[:-2]
endfunction

function! GetCommitList()
	return systemlist('git log --all --oneline | cut -d" " -f1')
endfunction
