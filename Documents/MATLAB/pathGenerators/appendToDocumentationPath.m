function fullPath = appendToDocumentationPath(addendum)
	% Gets the path to the file or directory specified by pathToAppend
	% within the documention folder (~/Google_Drive/Rush/Documentation).
	
	fullPath = appendToWorkPath(strcat('docs/', addendum));
end
