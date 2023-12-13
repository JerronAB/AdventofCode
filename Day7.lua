function ConvertToBinaryList(int)
	assert(type(int) == "number",'A number must be passed to the convertToBinaryList function. ')
	local digitList = {}
	setmetatable(digitList, binaryOnly)
	local result = int
	local remainder
	print('Starting with integer: ' .. int)
	while result ~= 0 do
		if result == 1 then remainder = 1; result = 0
		else 
		remainder = result % 2
		result = (result / 2) - (result / 2) % 1
		end
		print('Dividing previous result by 2, and rounding: ' .. result)
		print('Remainder of that operation: ' .. remainder)
		table.insert(digitList,1,remainder) --should insert from MSB to LSB
	end
	local prntStr = ''
	for index,_1_or_0_ in ipairs(digitList) do prntStr = prntStr .. _1_or_0_ .. ' ' end
	print(prntStr)
	return digitList
end

BinaryOnly = {
	__index = function(table, key) -- rawget bypasses metatables to get 'real value'
		if rawget(table,key) == nil then return 0 else return table[key] end
	end;
	__newindex = function(table, key) --ensures these lists are just 1/0's
		assert(key == 1 or key == 0, "Non-binary key inserted into list.")
		return table[key]
	end
	}

function compareAnd(list1,list2)
	for i=1,#list1
end

function compareOr(list1,list2)
end

function LSHIFT(list)
end

function RSHIFT(list)
end

function makeNOT(list)
end

ConvertToBinaryList(3)
ConvertToBinaryList(8)
--ConvertToBinaryList(50)
--ConvertToBinaryList(101)
