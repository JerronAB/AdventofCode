lightMatrix = {}

lightMatrix.init = function(start,finish) --I'd love to make this a metatable instead; but metatable in metatable sounds complicated
    for i=start,finish do
        lightMatrix[i] = {}
        for j=start,finish do
            lightMatrix[i][j] = 0
        end    
    end
end
lightMatrix.init(0,999)

lightMatrix.on = function(startX,startY,finishX,finishY)
    for i=startX,finishX do
    for j=startY,finishY do lightMatrix[i][j] = lightMatrix[i][j] + 1 end
    end
end

lightMatrix.off = function(startX,startY,finishX,finishY)
    for i=startX,finishX do
        for j=startY,finishY do 
            if lightMatrix[i][j] ~= 0 then lightMatrix[i][j] = lightMatrix[i][j] - 1 end
        end
    end
end

lightMatrix.toggle = function(startX,startY,finishX,finishY)
    for i=startX,finishX do
    for j=startY,finishY do lightMatrix[i][j] = lightMatrix[i][j] + 2 end
    end
end

lightMatrix.countLights = function()
    local on = 0
    for i=0,999 do --this is lazy but the quickest development time
        for j=0,999 do
            on = on + lightMatrix[i][j] end
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
