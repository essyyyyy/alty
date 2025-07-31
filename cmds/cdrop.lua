local goal, cur = 0, 0
local finished = false

local function calculateTotalDropped()
    local total = 0
    for _, drop in pairs(workspace.Ignored.Drop:GetChildren()) do
        if drop:IsA("Part") and drop.Name == "MoneyDrop" then
            local amountText = drop.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
            total = total + tonumber(amountText)
        end
    end
    return total
end

workspace.Ignored.Drop.ChildAdded:Connect(function(child)
    if child.Parent and child.Parent.Name == "Drop" then
        repeat wait(0.001) until child.Parent ~= nil
        local g = child.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
        cur = cur + tonumber(g)
        
        if cur >= goal and not finished then
            finished = true
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
            
            _G.IsDropping = false
            if _G.updateDroppingStatus then
                _G.updateDroppingStatus()
            end
            
            saymsg("finished")
        end
        
        if getgenv().LOOPDESTROY_ACTIVE == true then
            child:Destroy()
        end
    end
end)

workspace.Ignored.Drop.ChildRemoved:Connect(function(child)
    if child:IsA("Part") and child.Name == "MoneyDrop" then
        cur = calculateTotalDropped()
        
        if cur >= goal and not finished then
            finished = true
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
            
            _G.IsDropping = false
            if _G.updateDroppingStatus then
                _G.updateDroppingStatus()
            end
            
            saymsg("finished")
        end
    end
end)

return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    
    local function Convert(arg)
        local int = tonumber
        local signs = {
			k = int(10e2),
			m = int(10e5),
			b = int(10e8),
			t = int(10e11)
		}
        for item in next, signs do
            if arg:lower():find(item:lower()) then
                local _convert_ = int(signs[item])
                local new = arg:lower():gsub(item,"")
                return new*_convert_
            end
        end
        if not tonumber(arg) then
            return false
        end
        return tonumber(arg)
    end

    local converted = Convert(data[2])
    if converted == false then return end
    
    cur = calculateTotalDropped()
    goal = tonumber(converted)
    finished = false

    _G.IsDropping = true
    
    if _G.updateDroppingStatus then
        _G.updateDroppingStatus()
    end

    saymsg("Started... Current: " .. cur .. " Goal: " .. goal)
    game:service"RunService":BindToRenderStep("CDROP_FUNCTION",1,function()
        if getgenv().STOPACTIONS then
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
            
            _G.IsDropping = false
            if _G.updateDroppingStatus then
                _G.updateDroppingStatus()
            end
            
            saymsg("Stopped by /stop command")
            return
        end

        if cur >= goal and not finished then
            finished = true
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
                
            _G.IsDropping = false
            if _G.updateDroppingStatus then
                _G.updateDroppingStatus()
            end
            
            saymsg("finished")
            return
        end
        
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",15000)
    end)
end
