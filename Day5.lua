goodLines = 0
vowels = {['a']=true;['e']=true;['i']=true;['o']=true;['u']=true;}

for line in io.lines('InputDay5.txt') do
	--print(line)
	local i = 0
	local goodString = false
	local duplicate	= false
	local vowelCount = 0
	local dupChar = ''
	local hasBadSubstring = false
	hasBadSubstring = string.find(line,'ab') or string.find(line,'cd') or string.find(line,'pq') or string.find(line,'xy')
	if not hasBadSubstring then 
	repeat
		i = i + 1
		char = string.sub(line, i, i)
		if dupChar == char then duplicate = true end
		dupChar = char
		if vowels[char] then vowelCount = vowelCount + 1 end
		goodString = duplicate and vowelCount > 2
	until goodString or i == #line
	--if duplicate then db = 'true' else db = 'false' end
	--if hasBadSubstring then bad = 'true' else bad = 'false' end
	--print('Duplicate matched: ' .. db)
	--print('Vowelcount: ' .. vowelCount)
	--print('BadStrings: ' .. bad)
	if goodString and not hasBadSubstring then goodLines = goodLines + 1 end
	end
end
print('1) Number of \'good\' lines: ' .. goodLines)

-- PART 2:
defaultIndex0Metatable = {__index = 
	function(table, key) -- rawget bypasses metatables to get 'real value'
	if rawget(table,key) == nil then return 0 else return table[key] end 
	end}

function tablizeString(str)
	local stringTable = {}
	setmetatable(stringTable, defaultIndex0Metatable)
	for i=1,#str do
		char = string.sub(str, i, i)
		stringTable[i] = char
		stringTable[char] = stringTable[char] + 1
	end
	return stringTable
end

goodLines = 0
for line in io.lines('InputDay5.txt') do
	local strTable = tablizeString(line)
	--this next portion tests for duplicate letters
	local duplicateExists = false
	local iter = 0
	repeat --see if a letter is dup'd separated by 1 letter
		iter = iter + 1
		local currentChar = strTable[iter]
		local prevChar = strTable[iter - 2] --duplicates in this case are supposed to have 1 letter b/t them
		duplicateExists = (currentChar == prevChar) or duplicateExists
	until duplicateExists == true or iter == #line

	-- the following portion sees if any 2-character string is duplicated:
	local charPairDup = false
	local _2charTable = {}
	if duplicateExists then
	for j=2,#line,1 do -- for each set of 2 chars, if that set already exists and isn't overlapping (j-1)
			local _2characterString = string.sub(line, j - 1, j) --then we have a duplicate; otherwise, put that string & index in the table
			prevStrIndex = _2charTable[_2characterString]
			if prevStrIndex ~= nil and j - 1 ~= prevStrIndex then charPairDup = true; break
			else _2charTable[_2characterString] = j end
	end
	end
	if duplicateExists and charPairDup then print('This is a good line: ' .. line .. '\n');goodLines = goodLines + 1 end
end
print('2) Number of \'good\' lines: ' .. goodLines)