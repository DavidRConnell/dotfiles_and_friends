function saveTableForLatex(dataStruct, name, projectPath, varargin)
	% Save matlab data as a table in LaTeX format. Table is saved in it's
	% own file located in the tables folder of the project specified by the
	% projectPath argument, which can than be used with input to enter in a
	% LaTeX paper.
	%
	% dataStruct should be a structure with fields:
	%	data -- the data in the form of a matrix or cell.
	%	cheader -- a cell containing the column headers.
	%	rheader -- cell of row headers.
	%
	% Optionals:
	%	fmt -- the format used to display the data by column. Can be a
	%	single descriptor or a string containing one descriptor for each
	%	column of data.
	%
	%	align -- the alignment used for each column. Can be a single
	%	descriptor or a string with a descriptor for each column (including
	%	the row header.)
	%
	% ex:
	%	fmt = '%s 0.2%f %d %d';
	%	align = 'l';
	%	project = '~/Documents/sampleProject';
	%	saveTableForLatex(dataStruct, 'ex_table', project, 'fmt', fmt, 'align', align);

	[fmt, align] = processOptionals(varargin);
	pathToTables = strcat(projectPath, '/tables');
	if ~exist(projectPath, 'dir')
		error('No project at %s.', projectPath);
	elseif ~exist(pathToTables, 'dir')
		mkdir(pathToTables);
	end
	savePath = strcat(pathToTables, '/', name, '.tex');

	top = strcat('\\begin{tabularx}{\\tablewidth}{', align, ...
		'}\n\t\\toprule\n\t');

	middle = '\\midrule\n\t';
	bottom = '\\bottomrule\n\\end{tabularx}';

	rheader = dataStruct.rheader;
	cheader = dataStruct.cheader;
	data = dataStruct.data;

	if ~iscell(data)
		data = mat2StringCell(data, fmt);
	else
		data = cell2StringCell(data, fmt);
	end

	fid = fopen(savePath, 'w');
	fprintf(fid, top);
	fprintf(fid, strcat(strjoin(cheader, ' & '), ' \\\\\n\t'));
	fprintf(fid, middle);
	for row = 1:size(data, 1)
		newLine = sprintf(...
			'%s & %s \\\\\\\\\\n\\t', ...
			rheader{row}, ...
			strjoin(data(row, :), ' & '));

		fprintf(fid, newLine);
	end
	fprintf(fid, bottom);
	fclose(fid);

	function [fmt, align] = processOptionals(optionals)
		fmt = '%f';
		align = 'X';

		numOptionals = length(optionals);
		for argnum = 1:numOptionals
			argname = optionals{argnum};
			if strcmpi(argname, 'fmt')
				assertOptionalsEneteredCorrectly(argname);
				fmt = optionals{argnum + 1};
			elseif strcmpi(argname, 'align')
				assertOptionalsEneteredCorrectly(argname);
				align = optionals{argnum + 1};
			end
		end

		numRows = size(dataStruct.data, 2) + 1;
		fmt = makeOptionalsProgramReadable(fmt, numRows - 1);
		align = makeOptionalsProgramReadable(align, numRows);

		function assertOptionalsEneteredCorrectly(argname)
			errmsg = sprintf('Must include value after %s', argname);
			assert(argnum + 1 <= numOptionals, errmsg);
		end

		function readableOpt = makeOptionalsProgramReadable(...
			optional, ...
			expectedNumValues)

			seperated = strsplit(optional);

			if length(seperated) == expectedNumValues
				readableOpt = optional;
			elseif length(seperated) == 1
				readableOpt = repmat({optional}, [1 expectedNumValues]);
				readableOpt = strjoin(readableOpt, ' ');
			else
				errmsg = 'Incorrect number of values given for one or more optionals';
				error(errmsg);
			end
		end
	end

	function dataCell = mat2StringCell(data, fmt)
		assert(ismatrix(data), 'Data must be a matrix or cell.');

		shape = size(data);
		numRows = shape(1);
		dataCell = cell(shape);
		dataStr = num2str(data, fmt);
		for row = 1:numRows
			dataCell(row, :) = strsplit(dataStr(row, :));
		end
	end

	function data = cell2StringCell(data, fmt)
		fmt = strsplit(fmt, ' ');
		[numRows, numCols] = size(data);
		for row = 1:numRows
			for col = 1:numCols
				data{row, col} = num2str(data{row, col}, fmt{col});
			end
		end
	end
end
