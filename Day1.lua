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
