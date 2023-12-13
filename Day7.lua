function ConvertToBinaryList(int)
	assert(type(int) == "number",'A number must be passed to the convertToBinaryList function. ')
	local digitList = {}
	local result = int
	local remainder
	while result ~= 0 do
		result = (result / 2) - (result / 2) % 1
		--print('Dividing previous result by 2, and rounding: ' .. result)
		remainder = result % 2
		--print('Remainder of that operation: ' .. remainder)
		table.insert(digitList,remainder) --should insert from MSB to LSB
	end
	local prntStr = ''
	for index,_1_or_0_ in ipairs(digitList) do prntStr = prntStr .. _1_or_0_ .. ' ' end
	print(prntStr)
	return digitList
end

ConvertToBinaryList(3)
ConvertToBinaryList(8)
ConvertToBinaryList(50)
ConvertToBinaryList(101)