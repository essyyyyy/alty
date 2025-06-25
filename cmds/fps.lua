return function(...)
    local data = ProccessArgs(...)
    local fps = tonumber(data[2]) or 3
    
    pcall(function() setfpscap(fps) end)
    saymsg("fps set to " .. fps)
end
