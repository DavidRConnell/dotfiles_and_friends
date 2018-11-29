function fullPath = appendToPresentationPath()
	% Gets the path to the file or directory specified by pathToAppend
	% within the presentation folder (~/Google_Drive/Rush/Presentations).

	baseDir = '$work/presentations/';
	fullPath = strcat(baseDir, pathToAppend);
end
