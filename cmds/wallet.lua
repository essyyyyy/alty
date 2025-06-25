return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    
    if data[2] == "on" then
        local wallet = plr.Backpack:FindFirstChild("[Wallet]")
        if wallet then
            wallet.Parent = plr.Character
            saymsg("wallet on")
        else
            saymsg("no wallet:(")
        end
    elseif data[2] == "hide" then
        local wallet = plr.Character:FindFirstChild("[Wallet]")
        if wallet then
            wallet.Parent = plr.Backpack
            saymsg("wallet off")
        else
            saymsg("no wallet:(")
        end
    end
end
