goodLines = 0
for line in io.lines('InputDay5.txt') do
	if not string.find(line, '[ab][cd][pq][xy]') then 
	local i = 0
	local letters = {}
	local goodString = false
	local duplicate	= false
	local vowelCount = 0
	vs = {['a']=true;['e']=true;['i']=true;['o']=true;['u']=true;}
	repeat 
		i = i + 1
		char = string.sub(line, i, i)
		if vs[char] then vowelCount = vowelCount + 1 end
		if letters[char] then letters[char] = letters[char] + 1 else letters[char] = 1 end --is there a slightly better way here?
		duplicate = (char == duplicate) or duplicate --will always return true if it's already been true once
		goodString = duplicate and vowelCount > 2
	until goodString
	if goodString then print(line); goodLines = goodLines + 1 end
	end
end

