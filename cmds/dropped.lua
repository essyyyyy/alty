return function()
    local Money = 0
    for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
        if v:IsA("Part") and v.Name == "MoneyDrop" then
            local c = v.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
            Money = Money + tonumber(c)
        end
    end
    local Final = ""
    Money = tostring(Money)
    if Money:len() == 4 then
        Final = Money:sub(1,1)..'.'..Money:sub(2,2)..'K'
    elseif Money:len() == 5 then
        Final = Money:sub(1,2)..'.'..Money:sub(3,4)..'K'
    elseif Money:len() == 6 then
        Final = Money:sub(1,3)..'.'..Money:sub(4,5)..'K'
    elseif Money:len() == 7 then
        Final = Money:sub(1,1)..'.'..Money:sub(2,3)..'M'
    elseif Money:len() == 8 then
        Final = Money:sub(1,2)..'.'..Money:sub(3,4)..'M'
    elseif Money:len() == 9 then
        Final = Money:sub(1,3)..'.'..Money:sub(4,5)..'M'
    elseif Money:len() == 10 then
        Final = Money:sub(1,1)..'.'..Money:sub(2,3)..'B'
    else
        Final = Money
    end
    saymsg(">> "..tostring(Final).." <<")
end
