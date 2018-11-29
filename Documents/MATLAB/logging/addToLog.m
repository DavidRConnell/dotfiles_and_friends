function addToLog(path, ME, varargin)
	fid = fopen(path, 'a');

	errmsg = '';
	hasfooter = nargin > 3;
	if ~isempty(varargin)
		errmsg = varargin{1};
	end

	errmsg = sprintf('%s\tError: %s\n', errmsg, ME.message);

	for i = ME.stack'
		errmsg = strcat(errmsg, '\n\n');
		errmsg = sprintf('%s\tLine: %d\n', errmsg, i.line);
		errmsg = sprintf('%s\tFunction: %s\n', errmsg, i.name);
	end

	if hasfooter
		errmsg = strcat(errmsg, varargin{2});
	end

	fprintf(fid, errmsg);
	fclose(fid);
end
