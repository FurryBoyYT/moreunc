function misc.hookfunction(func)
    if type(func) ~= "function" then
        error("Argument is not a function")
    end

    local oldfunc = func
    local hookedfunc = function(...)
        print("Calling function: " .. tostring(oldfunc))
        local args = {...}
        for i, arg in ipairs(args) do
            print("Argument " .. i .. ": " .. tostring(arg))
        end
        local results = table.pack(oldfunc(...))
        for i = 1, results.n do
            print("Return value " .. i .. ": " .. tostring(results[i]))
        end
        return table.unpack(results, 1, results.n)
    end

    return hookedfunc
end

misc.hookfunction(print, warn)