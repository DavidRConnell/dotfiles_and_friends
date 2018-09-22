% Test latex table generation.
d.data = rand(3,4);
d.cheader = {'vars', 'c1', 'c2', 'c3', 'c4'};
d.rheader = {'r1', 'r2', 'r3'};
savePath = 'test.tex';

%% Option Test: No optionals given
saveTableForLatex(d, savePath);
firstLine = getFirstLineOfTable(savePath);
assert(contains(firstLine, '{X X X X X}'))

%% Option Test: Single fmt and align descriptor given
saveTableForLatex(d, savePath, 'fmt', '%0.2f', 'align', 'l');
firstLine = getFirstLineOfTable(savePath);
assert(contains(firstLine, '{l l l l l}'));

%% Option Test: Multiple fmt and align descriptors given
saveTableForLatex(d, savePath, 'fmt', '%0.2f %0.3f %1.3f %s', 'align', 'l X X X X');
firstLine = getFirstLineOfTable(savePath);
assert(contains(firstLine, '{l X X X X}'));

%% Option Test: Wrong number of fmt descriptors given
didRun = false;
try
	saveTableForLatex(d, savePath, 'fmt', '%0.2f %0.4f');
	didRun = true;
end
assert(~didRun, 'Shouldn''t have ran with this many fmt descriptors')

%% Option Test: Wrong number of align descriptors given
didRun = false;
try
	saveTableForLatex(d, savePath, 'align', 'X l l l');
	didRun = true;
end
assert(~didRun, 'Shouldn''t have ran  with this many align descriptors')

%% Data Test: Using matrix data type
saveTableForLatex(d, savePath);
numLines = getNumLines(savePath);
assert(numLines == 9)

%% Data Test: Using cell data type
shape = size(d.data);
rows = ones(1, shape(1));
cols = ones(1, shape(2));
d2 = d;
d2.data = mat2cell(d.data, rows, cols);

fmt = '%0.2f %0.3f %0.0f %0.4f';
saveTableForLatex(d2, savePath, 'fmt', fmt);

numLines = getNumLines(savePath);
assert(numLines == 9)

function line = getFirstLineOfTable(path)
	fid = fopen(path, 'r');
	line = fgetl(fid);
	fclose(fid);
end

function count = getNumLines(path)
	fid = fopen(path, 'r');
	count = 0;
	while ~feof(fid)
		count = count + 1;
		fgetl(fid);
	end
end
