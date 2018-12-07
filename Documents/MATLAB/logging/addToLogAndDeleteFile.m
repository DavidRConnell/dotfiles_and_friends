function addToLogAndDeleteFile(path, file, ME)
	% Add error to the end of the log file at path then delete the file.
	% file should be in the form provided by the dir function (i.e. a
	% structure with fields name and folder).

	header = sprintf('Error reading %s:\n', file.name);
	footer = '\nFile Deleted\n\n';

	addToLog(path, ME, header, footer);
	moveToBadFiles(file)


	function moveToBadFiles(file)
		badFiles = strcat(file.folder, '/badfiles');
		filePath = strcat(file.folder, '/', file.name);
		if ~exist(badFiles)
			mkdir(badFiles);
		end

		delete(filePath);
	end
end
