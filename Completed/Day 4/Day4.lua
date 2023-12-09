puzzleBase = 'yzbqklnj' --harcoding this instead of leaving it in a file

function runCmd(command)
    testCmd = assert(io.popen(command, 'r'))
    return assert(testCmd:read('*a'))
end

i = 2000000 --I got to this point last time, approximately
repeat
    i = i + 1
    key = string.sub(runCmd('echo -n "' .. puzzleBase .. i .. '" | md5sum'), 1,5) --this is dense; it runs command, then gets first 5 characters
    print('Calculating MD5 for: ' .. puzzleBase .. i .. ' - MD5\'s first 5 digits: ' .. key)
until key == '000000'

print('Number producing desired hash: ' .. i)