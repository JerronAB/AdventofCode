file = io.open('InputDay3.txt', 'r'); file_content = file:read "*all"; file:close()

xcoord, ycoord = 0, 0
visited = {}; visited[0] = {}; visited[0][0] = 0
-- visited = {0 = {0 = true}} --indexes are the coordinates
function move(input)
	if     input == '>' then xcoord = xcoord + 1
	elseif input == '^' then ycoord = ycoord + 1
	elseif input == '<' then xcoord = xcoord - 1
	elseif input == 'v' then ycoord = ycoord - 1
	end
	if not visited[xcoord] then visited[xcoord] = {} end
	visited[xcoord][ycoord] = true
end

for i=1, #file_content do move(string.sub(file_content, i, i)) end--#file_content is equivalent to string.len(file_content)

houses = 0
for _x,_ycoords in pairs(visited) do
	for _ycoord,_ in pairs(_ycoords) do
	houses = houses + 1 end end

print('Santa has visited ' .. houses .. ' houses.') --represents number of houses (coords) hit. 