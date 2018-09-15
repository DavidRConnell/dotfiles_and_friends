function saveFigForLatex(name, project)
	pathToDocumentation = '~/Google_Drive/Rush/Documentation/';
	pathToFigures = strcat(pathToDocumentation, project, '/figures');
	if ~exist(pathToFigures, 'dir')
		mkdir(pathToFigures)
	end

	fullPath = strcat(pathToFigures, '/', name);
	cleanfigure;
	matlab2tikz(fullPath, 'showInfo', false);
end
