function path = appendToWorkPath(addendum)
	[~, work] = system('echo $work');
	path = strcat(work, '/', addendum);
end
