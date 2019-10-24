% Remove pattern from string.
function str = strrm(str, pattern)
    str = join(regexp(str, pattern, 'split'), '');
	if length(str) == 1
		str = str{1};
	end
end
