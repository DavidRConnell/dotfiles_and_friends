function saveTableForDocumentation(data, name, project, varargin)
	projectPath = appendToDocumentationPath(project);
	saveTableForLatex(data, name, projectPath, varargin);
end
