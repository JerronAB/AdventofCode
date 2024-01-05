--NOTE: this is broken in part because (I believe) my metatable prevents iteration; it either needs an __iter method or another approach entirely

BinaryOnly = {
	__index = function(table, key) -- rawget bypasses metatables to get 'real value'
		if rawget(table,key) == nil then return 0
		else return table[key] end
	end;
	__newindex = function(table, key, value) --ensures these lists are just 1/0's
		assert(value == 1 or value == 0, "Non-binary key inserted into list.")
		rawset(table,key,value)
	end
	}


function ConvBinaryList(int)
	print('Running ConvBinaryList for integer ' .. int)
	assert(type(int) == "number",'A number must be passed to the convertToBinaryList function. ')
	local digitList = {}
	setmetatable(digitList, BinaryOnly)
	local result = int
	local remainder
	while result ~= 0 do
		if result == 1 then
			remainder = 1
			result = 0
		else
			remainder = result % 2
			result = (result / 2) - (result / 2) % 1
		end
		print('Dividing previous result by 2, and rounding down: ' .. result)
		print('Remainder of that operation: ' .. remainder)
		table.insert(digitList,remainder) --left to right: LSB to MSB
	end
	return digitList
end

function Compare(operator,list1,list2)
	print('Running ConvBinaryList for these lists:')
	local prntStr = '{'
	for index,_1_or_0_ in pairs(list1) do prntStr = prntStr .. _1_or_0_ .. ' ' end
	for index,_1_or_0_ in pairs(list2) do prntStr = prntStr .. _1_or_0_ .. ' ' end
	prntStr = prntStr .. '}'
	print(prntStr)
	assert(string.upper(operator) == 'OR' or operator == 'AND', "Compare must have parameter 'AND' or 'OR'; got " .. operator)
	local operation
	if string.upper(operator) == 'AND' then operation = function (_l1,_l2) 
		if _l1 == 1 and _l2 == 1 then return 1 else return 0 end end 
	else operation = function (_l1,_l2) 
		if _l1 == 1  or _l2 == 1 then return 1 else return 0 end end
	end
	local newBinaryList = {}
	setmetatable(newBinaryList,BinaryOnly)
	for i=1,math.max(#list1,#list2) do table.insert(newBinaryList, operation(list1[i],list2[i])) end
	return newBinaryList
end

function LSHIFT(list)
end

function RSHIFT(list)
end

function Complement(list)
end

ConvBinaryList(3) -- should be 0011
ConvBinaryList(8) -- should be 1000
print('---NOW COMPARING---')
Compare('AND',ConvBinaryList(3),ConvBinaryList(8)) --> should be 1011
