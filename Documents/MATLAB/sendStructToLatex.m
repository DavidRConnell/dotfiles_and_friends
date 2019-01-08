function sendStructToLatex(name, projectPath, structure)
	savePath = [projectPath, '/', name, '.sty'];
	fid = fopen(savePath, 'w');
	preamble = ['\\ProvidesPackage{', name, '}\n\n'];
	fprintf(fid, preamble);
	for field = fieldnames(structure)'
		value = num2str(structure.(field{1}));
		commandStr = ['\\newcommand{\\', field{1}, '}{', value, '}\n'];
		fprintf(fid, commandStr);
	end
	fclose(fid);
end
