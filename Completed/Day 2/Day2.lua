total_sqrft = 0
total_ribbon = 0
function surface_area(l,w,h)
	local extra = math.min(l*w,w*h,h*l)
	local sqrft = 2*l*w + 2*w*h + 2*h*l
	total_sqrft = total_sqrft + sqrft + extra
	--I know we could combine these two solutions but I want this to be
	--illustrative of two different processes
	perims = {l,w,h}
	table.sort(perims)
	total_ribbon = total_ribbon + 2*perims[1] + 2*perims[2] + l*w*h
end

for line in io.lines('InputDay2.txt') do
	-- better ways to do this but I want to use tables
	local measurements = {}
	local chars = ''
	for i=1, #line do
		local char = string.sub(line, i, i)
		if char ~= 'x' then chars = chars .. char
		else
			measurements[#measurements + 1] = tonumber(chars)
			chars = ''
		end
	end
	measurements[#measurements + 1] = tonumber(chars)
	surface_area(table.unpack(measurements))
end
print('Total square feet required: ', total_sqrft)
print('Total ribbon length required: ', total_ribbon)
