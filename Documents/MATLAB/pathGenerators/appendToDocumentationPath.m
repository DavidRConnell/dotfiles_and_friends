function fullPath = appendToDocumentationPath(pathToAppend)
	% Gets the path to the file or directory specified by pathToAppend
	% within the documention folder (~/Google_Drive/Rush/Documentation).

	baseDir = '$work/docs/';
	fullPath = strcat(baseDir, pathToAppend);
end
