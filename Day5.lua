goodLines = 0
for line in io.lines('InputDay5.txt') do
	start,finish = string.find(line, '[aeiou]')
	local i = 0
	local letters = {}
	local goodString = false
	local duplicate	= false
	local vowelCount = 0
	local noBadStrings = true
	repeat 
		i = i + 1
		char = string.sub(line, i, i)
		if {['a']=true;['e']=true;['i']=true;['o']=true;['u']=true;}[char] then vowelCount = vowelCount + 1 end
		letters[char] = letters[char] + 1 or 1 --this SHOULD nil/error on the first try if that character is unused, and place 1 there when that happens
		duplicate = (char == duplicate) or duplicate --will always return true if it's already been true once
		goodString = duplicate and _3letters and noBadStrings
	until goodString
	if goodString then print(line); goodLines = goodLines + 1 end
end

-- duplicates (2 in row), and 3 vowels
not = {"ab","cd","pq","xy"}
