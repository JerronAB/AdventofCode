function str_to_table(str)
--continue reading about metamethods; I want an efficient method by which we can iterate over strs
end

for line in io.lines('InputDay5.txt') do
start,finish = string.find(line, '[aeiou]')
local letters = {}
for i=1,#line do 
char = string.sub(line, i, i)
letters[char] = 1 or char + 1 --fancy operation that should count up only if it already exists (once I fix it)
end 
end

require = {"duplicates (2 in row), and 3 vowels"}
not = {"ab","cd","pq","xy"}