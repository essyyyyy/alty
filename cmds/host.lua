return function(...)
    local data = ProccessArgs(...)
    local player = game:service"Players".LocalPlayer
    
    if data[2]:lower() == "line" then
        local g = 4
        local function ReverseRotation(x)
            return x-(x*2)
        end
        local function CreateSet()
            local k = {}
            local g = 4
            for i=1,20 do
                local c = ReverseRotation(g)
                local f = ReverseRotation(c)
                g = g + 4
                table.insert(k,f)
                table.insert(k,c)
            end
            return k
        end
        local Alts_ = ReSort(Alts)
        local BaseAnchor = game:service"Players":GetPlayerByUserId(Settings['host'])
        local Set = CreateSet()
        for i=1,40 do
            if Alts_[i] == player.UserId then
                local targetPosition = BaseAnchor.Character.HumanoidRootPart.Position + Vector3.new(Set[i], 0, 0)
                _G.TeleportUtils.teleportToPosition(targetPosition)
                break
            end
        end
    elseif data[2]:lower() == "form" then
        local FormSettings = {
            StartX = 23,
            CurrentX = 23,
            XMultiplier = -5,
            StartZ = 4,
            CurrentZ = 4,
            ZMultiplier = 5,
            MaxPerRow = 10,
            CurrentPerRow = 10,
        }
        
        local function CreateSet()
            local Cords = {}
            for i=1,40 do
                local C = tostring(FormSettings['CurrentX'])..",0,"..tostring(FormSettings['CurrentZ'])
                Cords[i] = C
                FormSettings['CurrentX'] = FormSettings['CurrentX'] + FormSettings['XMultiplier']
                if i == FormSettings['CurrentPerRow'] then
                    FormSettings['CurrentPerRow'] = FormSettings['CurrentPerRow'] + FormSettings['MaxPerRow']
                    FormSettings['CurrentX'] = FormSettings['StartX']
                    FormSettings['CurrentZ'] = FormSettings['CurrentZ'] + FormSettings['ZMultiplier']
                end
            end
            
            return Cords
        end

        local Cords = CreateSet()
        local NewAlts = ReSort(Alts)
        local BaseAnchor = game:service"Players":GetPlayerByUserId(Settings['host'])
        for i,v in pairs(NewAlts) do
            local cords = Cords[i]
            local x,y,z = cords:split(",")[1],cords:split(",")[2],cords:split(",")[3]
            if v == player.UserId then
                local targetPosition = BaseAnchor.Character.HumanoidRootPart.Position + Vector3.new(x, y, z)
                _G.TeleportUtils.teleportToPosition(targetPosition)
                break
            end
        end
    elseif data[2]:lower() == "moneyheart" then
        if ReSort(Alts)[1] == player.UserId then
            local Cords = {"15,0,0","19,0,2.3","23,0,4.6","27,0,6.9","29,0,11","30.5,0,16.6","29.5,0,22.1","27,0,27.6","22,0,33.1","17,0,35","12,0,33.4","7,0,30","2,0,25.6","-3,0,21.2","-8,0,16.8","-13,0,12.4","-18,0,7","-23,0,3","-29,0,0","19,0,-2.3","23,0,-4.6","27,0,-6.9","29,0,-11","30.5,0,-16.6","29.5,0,-22.1","27,0,-27.6","22,0,-33.1","17,0,-35","12,0,-33.4","7,0,-30","2,0,-25.6","-3,0,-21.2","-8,0,-16.8","-13,0,-12.4","-18,0,-7","-23,0,-3"}--,"45,0,0","45,0,16.6","45,0,-16.6"}
            for i,v in pairs(workspace:GetChildren()) do if v.Name:find("temp") then v:Destroy() end end
            
            for i,v in pairs(Cords) do
                local x,y,z = v:split(",")[1],v:split(",")[2],v:split(",")[3]
                local Part = Instance.new("Part",workspace)
                Part.Name = "temp"
                Part.Size = Vector3.new(1,5,1)
                Part.Transparency = 1
                Part.CanCollide = false
                Part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(x, y, z)
                Part.CFrame = CFrame.new(Part.Position,player.Character.HumanoidRootPart.Position)
                Part.Anchored = true
            end
            
            local OldAmt = player.DataFolder.Currency.Value
            for _, k in pairs(workspace:GetChildren()) do
                if k.Name == "temp" then
                    repeat
                        local targetPosition = k.Position + Vector3.new(0, 0, -2)
                        _G.TeleportUtils.teleportToPosition(targetPosition)
                        wait(0.25)
                        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",100)
                    until OldAmt ~= player.DataFolder.Currency.Value
                    MIN = MIN + 1
                    OldAmt = player.DataFolder.Currency.Value
                end
            end
        end
    end
end
