function lines_from(file)
  local lines = ''
  for line in io.lines(file) do lines = lines .. line  end
  return lines
end

input_text = lines_from('InputDay1.txt')

-- count all '(' and ')' characers, then find difference. 

function count_char(character,input_text)
	local count = 0
	for i=1,string.len(input_text) do
	if string.sub(input_text,i,i) == character then count = count + 1 end
	end
	return count
end

opnprt = count_char('(',input_text)
clsprt = count_char(')',input_text)
print(opnprt - clsprt)

-- SOLUTION PART 2:
-- for the sake of practice, I will do this all without proper functions. Just line by line

local file_content = ''
local floor = 0
local position = 0
for line in io.lines('InputDay1.txt') do file_content = file_content .. line end 
repeat
	if string.sub(file_content,position,position) == '(' then floor = floor + 1
	elseif string.sub(file_content, position, position) == ')' then floor = floor - 1 end
	position = position + 1
until floor == -1
print('Santa arrived at the basement at position ' .. position - 1)

