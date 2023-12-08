for line in io.lines('InputDay5.txt') do --here's my overcomplicated plan:
				         --I want a metatable, with values for vowels and return nil for non-vowels (not in the table) 
start,finish = string.find(line, '[aeiou]')
end
