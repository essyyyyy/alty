return function()
    local player = game:service"Players".LocalPlayer
    
    -- Check if player is in the original alts list
    local isAlt = false
    local altIndex = 0
    for i, altId in pairs(getgenv().Alts) do
        if altId == player.UserId then
            isAlt = true
            altIndex = i
            break
        end
    end
    
    if not isAlt then
        saymsg("unauthorized")
        return
    end
    
    if not player.Character then
        saymsg("no char")
        return
    end
    
    -- Get local wallet data
    local walletAmount = 0
    local success, result = pcall(function()
        local dataFolder = player:WaitForChild("DataFolder")
        local currency = dataFolder:WaitForChild("Currency")
        return currency.Value
    end)
    
    if success then
        walletAmount = result
        saymsg("alt " .. tostring(altIndex) .. ": $" .. tostring(walletAmount))
    else
        saymsg("alt " .. tostring(altIndex) .. ": error")
        return
    end
    
    -- Grab wallet (hold the [Wallet] tool)
    local walletEquipped = false
    pcall(function()
        local wallet = player.Backpack:FindFirstChild("[Wallet]")
        if wallet then
            wallet.Parent = player.Character
            walletEquipped = true
        end
    end)
    
    if walletEquipped then
        wait(0.1)
    end
    
    -- Only the first alt calculates the total from all alts
    if altIndex == 1 then
        
        local totalMoney = 0
        local onlineAlts = 0
        local offlineAlts = 0
        local errorAlts = 0
        
        -- Convert alt UserIDs to usernames and check their wallet data
        for altNum, altId in pairs(getgenv().Alts) do
            local success2, altUsername = pcall(function()
                return game:service"Players":GetNameFromUserIdAsync(altId)
            end)
            
            if success2 then
                local altPlayer = game:service"Players":FindFirstChild(altUsername)
                if altPlayer then
                    -- Alt is online, get their wallet data
                    local success3, altMoney = pcall(function()
                        local dataFolder = altPlayer:WaitForChild("DataFolder")
                        local currency = dataFolder:WaitForChild("Currency")
                        return currency.Value
                    end)
                    
                    if success3 then
                        totalMoney = totalMoney + altMoney
                        onlineAlts = onlineAlts + 1
                    else
                        errorAlts = errorAlts + 1
                    end
                else
                    -- Alt is offline
                    offlineAlts = offlineAlts + 1
                end
            else
                errorAlts = errorAlts + 1
            end
            
            wait(0.1) -- Small delay to prevent spam
        end
        
        -- Consolidated output
        saymsg("online: " .. tostring(onlineAlts))
        if errorAlts > 0 then
            saymsg("errors: " .. tostring(errorAlts))
        end
        saymsg("total: $" .. tostring(totalMoney))
    end
end 