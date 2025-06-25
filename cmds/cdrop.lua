local goal, cur = 0, 0
local finished = false -- Flag to prevent multiple "finished" messages

workspace.Ignored.Drop.ChildAdded:Connect(function(child)
    if child.Parent.Name == "Drop" then
        repeat wait(0.001) until child.Parent ~= nil
        local g = child.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
        cur = cur + tonumber(g)
        if cur >= goal and not finished then
            finished = true -- Set flag to prevent multiple messages
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
            saymsg("finished")
        end
        if getgenv().LOOPDESTROY_ACTIVE == true then
            child:Destroy()
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
    cur = 0
    goal = tonumber(converted)
    finished = false -- Reset flag when starting new drop

    saymsg("Started...")
    game:service"RunService":BindToRenderStep("CDROP_FUNCTION",1,function()
        -- Check if stop command was called
        if getgenv().STOPACTIONS then
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
            saymsg("Stopped by /stop command")
            return
        end
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",15000)
    end)
end
