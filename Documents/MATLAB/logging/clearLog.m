function fid = clearLog(path)
	fid	= fopen(path, 'w');
	fprintf(fid, '');
	fclose(fid);
end
