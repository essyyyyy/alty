return function(...)
    local data = ProccessArgs(...)
    local player = game:service"Players".LocalPlayer
    
    -- Check if player is in the original alts list
    local isAlt = false
    for i, altId in pairs(Alts) do
        if altId == player.UserId then
            isAlt = true
            break
                    end
                end
    
    if not isAlt then
        saymsg("unauthorized")
        return
    end
    
        local lib = {
            admin = "-871,-33,-662",
            bank = "-377,21,-361",
            club = "-266,0,-428",
            train = "600,47,-117",
        }
    
    -- Find target player (works with any username, not just host)
    local target = nil
        if data[2]:lower() == 'host' then
        target = game:service"Players":GetPlayerByUserId(Settings['host'])
    else
        -- Use FindPlr to search by username or display name
        target = FindPlr(data[2])
    end
    
    if target == false or not target then
        saymsg("player not found")
        return
    end
    
    if not target.Character then
        saymsg("target no char")
        return
    end
    
    if not player.Character then
        saymsg("no char")
        return
    end
    
    saymsg("tp started")
    
    local OldPos = player.Character.HumanoidRootPart.Position
                player.Character.HumanoidRootPart.Anchored = false
    
    -- Teleport loop to get behind target and knock them down
    repeat
        -- Check for stop command
        if getgenv().STOPACTIONS then
            saymsg("tp stopped")
            _G.TeleportUtils.teleportToPosition(OldPos)
            -- Unequip combat tool
            if player.Character:FindFirstChild("Combat") then
                player.Character:FindFirstChild("Combat").Parent = player.Backpack
            end
            return
        end
        
        -- Check if combat tool exists
                    local combat = player.Character:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
        if not combat then
            saymsg("no combat")
            return
        end
        
        -- Equip combat tool if not equipped
                    if player.Backpack:FindFirstChild("Combat") then
                        player.Backpack:FindFirstChild("Combat").Parent = player.Character
            wait(0.1) -- Wait for tool to equip
        end
        
        -- Check if combat is now equipped
        if not player.Character:FindFirstChild("Combat") then
            saymsg("combat equip failed")
            return
        end
        
        -- Teleport behind target (consistently behind, not bouncing around)
        local targetCFrame = target.Character.HumanoidRootPart.CFrame
        local behindTarget = targetCFrame * CFrame.new(0, 0, -3) -- 3 studs behind, same Y level
        _G.TeleportUtils.teleportToPosition(behindTarget.Position)
        
        -- Make alt face the target normally (like shiftlock/aimbot)
        local targetPos = target.Character.HumanoidRootPart.Position
        local altPos = player.Character.HumanoidRootPart.Position
        local lookVector = (Vector3.new(targetPos.X, altPos.Y, targetPos.Z) - altPos).Unit
        player.Character.HumanoidRootPart.CFrame = CFrame.new(altPos, altPos + lookVector)
        
        -- Attack (no second teleport - stay consistently behind)
                    player.Character:FindFirstChild("Combat"):Activate()
        wait(0.1)
                until target.Character.BodyEffects:FindFirstChild("K.O").Value == true      
    
                if target.Character.BodyEffects:FindFirstChild("K.O").Value == true then
        -- Grab the knocked out target
                    repeat
            -- Check for stop command during grabbing
            if getgenv().STOPACTIONS then
                saymsg("tp stopped")
                _G.TeleportUtils.teleportToPosition(OldPos)
                -- Unequip combat tool
                if player.Character:FindFirstChild("Combat") then
                    player.Character:FindFirstChild("Combat").Parent = player.Backpack
                end
                return
            end
            
                        if target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                            break
                        end
                        local x,y,z = target.Character.UpperTorso.Position.X,target.Character.UpperTorso.Position.Y,target.Character.UpperTorso.Position.Z
            _G.TeleportUtils.teleportToCoords(x, y + 1.3, z)
                        if not target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                            game:service"ReplicatedStorage".MainEvent:FireServer("Grabbing",false)
                        end
                        wait(1)
                    until target.Character:FindFirstChild("GRABBING_CONSTRAINT")
        
        -- Teleport to destination
                    local x,y,z = nil,nil,nil
                    x,y,z=lib[data[3]:lower()]:split(",")[1],lib[data[3]:lower()]:split(",")[2],lib[data[3]:lower()]:split(",")[3]
                    if data[3]:lower() == 'host' then
                        local a = game:service"Players":GetPlayerByUserId(Settings['host'])
            x,y,z = a.Character.HumanoidRootPart.Position.X,a.Character.HumanoidRootPart.Position.Y,a.Character.HumanoidRootPart.Position.Z
                    else
                        local c = lib[data[3]:lower()] or false
                        if c == false then
                            local a = game:service"Players":GetPlayerByUserId(Settings['host'])
                x,y,z = a.Character.HumanoidRootPart.Position.X,a.Character.HumanoidRootPart.Position.Y,a.Character.HumanoidRootPart.Position.Z
                        end
                    end
        _G.TeleportUtils.teleportToCoords(x, y, z)
                    wait(1)
                    game:service"ReplicatedStorage".MainEvent:FireServer("Grabbing",false)
                    wait(1)
        _G.TeleportUtils.teleportToPosition(OldPos)
        
        -- Only unequip combat tool
        if player.Character:FindFirstChild("Combat") then
            player.Character:FindFirstChild("Combat").Parent = player.Backpack
                end
        
        saymsg("tp done")
        else
        saymsg("knock failed")
        
        -- Only unequip combat tool even if failed
        if player.Character:FindFirstChild("Combat") then
            player.Character:FindFirstChild("Combat").Parent = player.Backpack
        end
    end
end
