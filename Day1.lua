input_text = '((((())))'

-- there are several ways to do this; not sure what's quickest
-- 1) have an integer that counts up or down while iterating through each character
-- 2) count all '(' and ')' characers, then find difference. 
-- 2 seems more advanced so let's try it. 

function count_char(character,input_text)
	local count = 0
	for i in string.len(input_text) do
 print('On iteration ' .. i)
	if input_text[i] == character then count = count + 1
 print(count)
 end
	end
	-- return count
end

count_char('(',input_text)
