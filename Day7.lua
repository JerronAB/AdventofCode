BinaryOnly = {
	__index = function(table, key) -- rawget bypasses metatables to get 'real value'
		if rawget(table,key) == nil then print('Table indexed at a nil index! returning 0 instead'); return 0 else return table[key] end
	end;
	__newindex = function(table, key) --ensures these lists are just 1/0's
		assert(key == 1 or key == 0, "Non-binary key inserted into list.")
		return table[key]
	end
	}


function ConvBinaryList(int)
	assert(type(int) == "number",'A number must be passed to the convertToBinaryList function. ')
	local digitList = {}
	--setmetatable(digitList, BinaryOnly)
	local result = int
	local remainder
	--print('Starting with integer: ' .. int)
	while result ~= 0 do
		if result == 1 then remainder = 1; result = 0
		else 
		remainder = result % 2
		result = (result / 2) - (result / 2) % 1
		end
		--print('Dividing previous result by 2, and rounding: ' .. result)
		--print('Remainder of that operation: ' .. remainder)
		table.insert(digitList,remainder) --left to right: LSB to MSB
	end
	--local prntStr = ''
	--for index,_1_or_0_ in ipairs(digitList) do prntStr = prntStr .. _1_or_0_ .. ' ' end
	--print(prntStr)
	return digitList
end

function Compare(operator,list1,list2)
	assert(string.upper(operator) == 'OR' or operator == 'AND', "Compare must have parameter 'AND' or 'OR'; got " .. operator)
	local operation
	if string.upper(operator) == 'AND' then operation = function (_l1,_l2) 
		if _l1 == 1 and _l2 == 1 then return 1 else return 0 end end 
	else operation = function (_l1,_l2) 
		if _l1 == 1  or _l2 == 1 then return 1 else return 0 end end
	end
	local newBinaryList = {}
	setmetatable(newBinaryList,BinaryOnly)
	print('Larger of the two lists is size: ' .. math.max(#list1,#list2)) 
	for i=1,math.max(#list1,#list2) do print('got to new list gen');table.insert(newBinaryList, operation(list1[i],list2[i])) end
	local prntStr = ''
	for index,_1_or_0_ in ipairs(newBinaryList) do prntStr = prntStr .. _1_or_0_ .. ' ' end
	print(prntStr)
	return newBinaryList
end

function LSHIFT(list)
end

function RSHIFT(list)
end

function makeNOT(list)
end

ConvBinaryList(3)
ConvBinaryList(8)
Compare('AND',ConvBinaryList(3),ConvBinaryList(8)) --> should be 1101
