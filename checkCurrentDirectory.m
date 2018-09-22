function checkCurrentDirectory()
	% Runs checkcode interactively on all files in the current directory
	% include subdirectories.

	fileList = strsplit(ls('./**/*.m'));

	for file = fileList(1:(end-1))
		fprintf('\n\tFile: %s\n\n', file{1});
		checkcode(file{1})
		input('Press enter to continue')
	end
end
