return function(...)
    local data = ProccessArgs(...)
    local player = game:service"Players".LocalPlayer
    
    local isAlt = false
    for i, altId in pairs(Alts) do
        if altId == player.UserId then
            isAlt = true
            break
        end
    end
    
    if not isAlt then
        saymsg("not authorized alt.")
        return
    end
    
    if not data[2] then
        saymsg("Usage: -face north/south/east/west [player]")
        return
    end
    
    local direction = data[2]:lower()
    local targetPlayer = nil
    local isTracking = false

    if _G.IsTrackingPlayer then
        _G.IsTrackingPlayer = false
        wait(0.2)
    end
    
    if direction == "north" or direction == "south" or direction == "east" or direction == "west" then
        if data[3] then
            targetPlayer = FindPlr(data[3])
            if not targetPlayer then
                saymsg("player not found.")
                return
            end
        end
    else
        targetPlayer = FindPlr(direction)
        if not targetPlayer then
            saymsg("player not found.")
            return
        end
        direction = "player"
        isTracking = true
    end
    
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        saymsg("character not found.")
        return
    end
    
    local hrp = player.Character.HumanoidRootPart
    
    if direction == "north" then
        local currentPos = hrp.Position
        hrp.CFrame = CFrame.new(currentPos, currentPos + Vector3.new(0, 0, -1))
        saymsg("facing north.")
    elseif direction == "south" then
        local currentPos = hrp.Position
        hrp.CFrame = CFrame.new(currentPos, currentPos + Vector3.new(0, 0, 1))
        saymsg("facing south.")
    elseif direction == "east" then
        local currentPos = hrp.Position
        hrp.CFrame = CFrame.new(currentPos, currentPos + Vector3.new(1, 0, 0))
        saymsg("facing east.")
    elseif direction == "west" then
        local currentPos = hrp.Position
        hrp.CFrame = CFrame.new(currentPos, currentPos + Vector3.new(-1, 0, 0))
        saymsg("facing west.")
    elseif direction == "player" and targetPlayer and isTracking then
        saymsg("tracking " .. targetPlayer.Name .. ".")
        
        _G.IsTrackingPlayer = true
        
        spawn(function()
            while targetPlayer and targetPlayer.Parent and player.Character and player.Character.Parent and _G.IsTrackingPlayer do
                if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and 
                   player.Character:FindFirstChild("HumanoidRootPart") then
                    
                    local currentPos = player.Character.HumanoidRootPart.Position
                    local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                    local lookVector = (Vector3.new(targetPos.X, currentPos.Y, targetPos.Z) - currentPos).Unit
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos, currentPos + lookVector)
                end
                wait(0.1)
            end
            if _G.IsTrackingPlayer then
                saymsg("stopped tracking " .. (targetPlayer and targetPlayer.Name or "player") .. ".")
            end
            _G.IsTrackingPlayer = false
        end)
    else
        saymsg("Usage: -face north/south/east/west [player]")
        return
    end
end 