input_text = '((((())))'

-- count all '(' and ')' characers, then find difference. 

function count_char(character,input_text)
	local count = 0
	for i, string.len(input_text) do
	if input_text[i] == character then count = count + 1
 end
	end
	return count
end

opnprt = count_char('(',input_text)
clsprt = count_char(')',input_text)
print(opnprt - clsprt)
