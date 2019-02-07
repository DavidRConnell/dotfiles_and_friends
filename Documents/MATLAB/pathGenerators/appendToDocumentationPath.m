function newPath = appendToDocumentationPath(addendum)
	% Gets the path to the file or directory specified by pathToAppend
	% within the documention folder (~/Google_Drive/Rush/Documentation).
	
	newPath = appendToWorkPath(strcat('docs/', addendum));
end
