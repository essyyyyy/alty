local Adverting = false

return function(...)
    local data = ProccessArgs(...)
    
    if not data[2] then
        saymsg("Usage: -advert set/on/off [message]")
        return
    end
    
    if data[2]:lower() == "set" then
        if #data < 3 then
            saymsg("Usage: -advert set [message]")
            return
        end
        
        local NewMsg = ""
        for i = 3, #data do
            if i == 3 then
                NewMsg = tostring(data[i])
            else
                NewMsg = NewMsg .. " " .. tostring(data[i])
            end
        end
        
        if NewMsg == "" then
            saymsg("message cannot be empty.")
            return
        end
        
        Settings['admsg'] = NewMsg
        saymsg("ad message set: " .. NewMsg)
        
    elseif data[2]:lower() == "on" then
        if Adverting then
            saymsg("advertising already on.")
            return
        end
        
        if not Settings['admsg'] or Settings['admsg'] == "" then
            saymsg("no ad message set. use -advert set [message] first.")
            return
        end
        
        Adverting = true
        saymsg("advertising started.")
        
        while Adverting == true do
            wait(2.5)
            if Adverting then
            saymsg(Settings['admsg'])
            end
        end
        
    elseif data[2]:lower() == "off" then
        if not Adverting then
            saymsg("advertising already off.")
            return
        end
        Adverting = false
        saymsg("advertising stopped.")
    else
        saymsg("Usage: -advert set/on/off [message]")
    end
end
