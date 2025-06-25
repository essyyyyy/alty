return function()
    local player = game:service"Players".LocalPlayer
    
    -- Check if player is in the original alts list
    local isAlt = false
    for i, altId in pairs(getgenv().Alts) do
        if altId == player.UserId then
            isAlt = true
            break
        end
    end
    
    if not isAlt then
        saymsg("not authorized alt.")
        return
    end
    
    if not player.Character then
        saymsg("nvm gng ur cooked")
        return
    end
    
    local origin_spot = player.Character.HumanoidRootPart.Position
    saymsg("ok bet")
    
    -- Method 1: Try BreakJoints first (faster)
    if player.Character then
        player.Character:BreakJoints()
        saymsg("lets hope this works..")
    end
    
    -- Method 2: Force LoadCharacter as backup (more reliable)
    wait(0.5)
    if player.Character then
        player:LoadCharacter()
        saymsg("uhhh idk chat..")
    end
    
    -- Wait for respawn
    wait(3)
    
    -- Return to original location
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if _G.TeleportUtils and _G.TeleportUtils.teleportToPosition then
            _G.TeleportUtils.teleportToPosition(origin_spot)
            saymsg("respawned:P")
        else
            saymsg("uhh tp error?..")
        end
    else
        saymsg("cooked")
    end
end
