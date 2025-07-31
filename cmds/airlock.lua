return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    
    local isAlt = false
    for i, altId in pairs(getgenv().Alts) do
        if altId == plr.UserId then
            isAlt = true
            break
        end
    end
    
    if not isAlt then
        saymsg("unauthorized")
        return
    end
    
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
        saymsg("no char")
        return
    end
    
    local height = 2
    
    if data and data[2] and data[2] ~= "" then
        local parsedHeight = tonumber(data[2])
        if parsedHeight then
            height = parsedHeight
        end
    end
    
    saymsg("height: " .. height)
    
    if workspace:FindFirstChild("AirlockPart") then
        workspace:FindFirstChild("AirlockPart"):Destroy()
    end
    
    local Part = Instance.new("Part",workspace)
    Part.Name = "AirlockPart"
    Part.Size = Vector3.new(4,1.2,4)
    Part.Transparency = 1
    
    local airlockPosition = plr.Character.HumanoidRootPart.Position + Vector3.new(0, height, 0)
    Part.Position = airlockPosition
    Part.Anchored = true
    
    local platformSurface = Part.Position + Vector3.new(0, Part.Size.Y/2 + 0.1, 0)
    _G.TeleportUtils.teleportToPosition(platformSurface)
    
    wait(0.25)
    plr.Character.HumanoidRootPart.Anchored = true
    
    _G.AirlockHeight = height
    _G.IsAirlocked = true
    
    saymsg("airlock on")
end
