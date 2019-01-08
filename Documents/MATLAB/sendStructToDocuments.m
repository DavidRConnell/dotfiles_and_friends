function sendStructToDocuments(name, project, structure)
	projectPath = appendToDocumentationPath(project);
	sendStructToLatex(name, projectPath, structure);
end
