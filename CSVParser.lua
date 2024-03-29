--function: parse a CSV file and create output as matrix of cells
--LIMITATIONS: this is for illustrative purposes, so there are only certain functions available:
  --variables can be string, int, float, or array
  --no defining functions
  --"do until" loops and for loops are allowed
  --complex if/else statements and switch cases
  --string substitution allowed; "nth index of string" allowed

--instead of general split
-- find index of all instances of commas
-- If index is between double quotes (odd on left, even on right) do nothing
-- else, add to array
-- split based on character index in array

function nthIndexofString(search_str, within_str, str_number)
    local current_StrNumber = 0
    for i = 1, #within_str do
        local width_of_substr = #search_str
        local substr = within_str:sub(i,i+width_of_substr)
        if substr == search_str then current_StrNumber = current_StrNumber + 1 end
        if current_StrNumber == str_number then return i end
    end
end

function splitString(substring,within_str)
    --find analagous Power Automate function
end

csvFile = io.open('csvFile.csv','r')
for line in io.lines('csvFile.csv') do

    

end