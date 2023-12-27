lightMatrix = {}

--[[mt = {__index =
function(table, key)
if rawget(table,key) == nil then return 0 else return table[key] end end;
__newindex = function(table, key)
    if rawget(table,key) == nil then
        table[key] = {}
    end end;
__tostring = function(table) end
}]]
--setmetatable(lightMatrix,mt)

lightMatrix.on = function(startX,startY,finishX,finishY)
    for i=startX,finishX do
    if not lightMatrix[i] then lightMatrix[i] = {} end
    for j=startY,finishY do lightMatrix[i][j] = true end
    end
end

lightMatrix.off = function(startX,startY,finishX,finishY)
    for i=startX,finishX do
    if not lightMatrix[i] then lightMatrix[i] = {} end
    for j=startY,finishY do lightMatrix[i][j] = false end
    end
end

lightMatrix.toggle = function(startX,startY,finishX,finishY)
    for i=startX,finishX do
    if not lightMatrix[i] then lightMatrix[i] = {} end
    for j=startY,finishY do lightMatrix[i][j] = not lightMatrix[i][j] end
    end
end

lightMatrix.countLights = function()
    local on = 0
    for i=0,999 do --this is lazy but the quickest development time
        if not lightMatrix[i] then lightMatrix[i] = {} end
        for j=0,999 do
            if lightMatrix[i][j] then on = on + 1 end
        end
    end
    return on
end

function getNumbers(str)
    --cut up the string
    local parsedStr = string.gsub(str,' through ',';')
    parsedStr = string.gsub(parsedStr,'turn on ','')
    parsedStr = string.gsub(parsedStr,'turn off ','')
    parsedStr = string.gsub(parsedStr,'toggle ','')
    --splice/extract coordinates; did it the 'long way' so VSCode would shut up
    local semicolonPosition = assert(string.find(parsedStr,';'))
    local firstCoords = string.sub(parsedStr,1,semicolonPosition - 1)
    local separator = assert(string.find(firstCoords,','))
    local firstX = string.sub(firstCoords,1,separator - 1)
    local firstY = string.sub(firstCoords,separator + 1,#firstCoords)
    local secondCoords = string.sub(parsedStr,semicolonPosition + 1,#parsedStr)
    separator = assert(string.find(secondCoords,','))
    local secondX = string.sub(secondCoords,1,separator - 1)
    local secondY = string.sub(secondCoords,separator + 1,#secondCoords)
    return tonumber(firstX),tonumber(firstY),tonumber(secondX),tonumber(secondY)
end

for line in io.lines('InputDay6.txt') do
    local firstX,firstY,secondX,secondY = getNumbers(line)
    --print(firstX,firstY,secondX,secondY)
    if string.find(line,'on') then lightMatrix.on(firstX,firstY,secondX,secondY)
    elseif string.find(line,'off') then lightMatrix.off(firstX,firstY,secondX,secondY)
    elseif string.find(line,'toggle') then lightMatrix.toggle(firstX,firstY,secondX,secondY)
    end
end
print('Number of active lights: ' .. lightMatrix.countLights())