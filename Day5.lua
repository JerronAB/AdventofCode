goodLines = 0
function add(item) return item + 1 end

for line in io.lines('InputDay5.txt') do
	print(line)
	local i = 0
	local letters = {}
	local goodString = false
	local duplicate	= false
	local vowelCount = 0
	if not string.find(line,'ab') or string.find(line,'cd')  or string.find(line,'pq') or string.find(line,'xy') then 
	vs = {['a']=true;['e']=true;['i']=true;['o']=true;['u']=true;}
	repeat 
		i = i + 1
		char = string.sub(line, i, i)
		if vs[char] then vowelCount = vowelCount + 1 end
		_,value = pcall(add, letters[char])
		letters[char] = (_ and value) or 1 --this will test if add was successful; if so, return value
		duplicate = duplicate or (char == duplicate)  --will always return true if it's already been true once
		goodString = duplicate and vowelCount > 2
	until goodString or i == #line
	end
	if duplicate then local db = 'true' else db = 'false' end
	print('Duplicate matched: ' .. db)
	print('Vowelcount: ' .. vowelCount)
	print('BadStrings: ')
	if string.find(line,'ab') or string.find(line,'cd')  or string.find(line,'pq') or string.find(line,'xy') then print('true') else print('false') end
	if goodString then print('This string is good: ' .. line); goodLines = goodLines + 1 
	else print('This string is bad: ' .. line)
	end
end
print('Number of \'good lines\': ' .. goodLines)
