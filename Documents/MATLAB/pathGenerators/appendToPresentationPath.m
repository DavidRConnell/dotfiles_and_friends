function fullPath = appendToPresentationPath(addendum)
	% Gets the path to the file or directory specified by pathToAppend
	% within the presentation folder (~/Google_Drive/Rush/Presentations).

	newPath = appendToWorkPath(strcat('presentations/', addendum));
end
