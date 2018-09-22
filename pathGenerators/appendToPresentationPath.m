function fullPath = appendToPresentationPath()
	% Gets the path to the file or directory specified by pathToAppend
	% within the presentation folder (~/Google_Drive/Rush/Presentations).

	baseDir = '~/Google_Drive/Rush/Presentations/';
	fullPath = strcat(baseDir, pathToAppend);
end
