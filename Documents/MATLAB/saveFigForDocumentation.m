function saveFigForDocumentation(name, project)
	% Wrapper for saveFigForLatex to simplify saving to the documentation
	% directory.
	% 
	% USAGE: saveFigForDocumentation(figureName, project);

	projectPath = appendToDocumentationPath(project);
	saveFigForLatex(name, projectPath);
end
