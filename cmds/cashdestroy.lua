local Destroying = false
workspace.Ignored.Drop.ChildAdded:Connect(function(child)
    if child.Parent.Name == "Drop" then
        repeat wait(0.001) until child.Parent ~= nil
        wait(2)
        if Destroying == true then
            child:Destroy()
        end
    end
end)

return function(...)
    local data = ProccessArgs(...)
    
    if data[2]:lower() == "on" then
        if Destroying then
            saymsg("cash destroy already on.")
            return
        end
        Destroying = true
        saymsg("cash destroy on.")
        
        while Destroying do
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name == "MoneyDrop" or obj.Name == "Money" then
                    if (game:service"Players".LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude < 50 then
                        obj:Destroy()
                    end
                end
            end
            wait(0.1)
        end
        
    elseif data[2]:lower() == "off" then
        if not Destroying then
            saymsg("cash destroy already off.")
            return
        end
        Destroying = false
        saymsg("cash destroy off.")
    else
        saymsg("Usage: -cashdestroy on/off")
    end
end
