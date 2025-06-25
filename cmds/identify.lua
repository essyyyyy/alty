return function()
    local plr = game:service"Players".LocalPlayer

    for _, v in pairs(getgenv().Alts) do
        if tonumber(v) == plr.UserId then
            saymsg("I'm alt "..tostring(_))
        end
    end
end
