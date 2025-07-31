return function()
    _G.IsDropping = true
    
    if _G.updateDroppingStatus then
        _G.updateDroppingStatus()
    end
    
    saymsg("drop started.")
    game:service"RunService":BindToRenderStep("DROP_FUNCTION",1,function()
        if getgenv().STOPACTIONS then
            game:service"RunService":UnbindFromRenderStep("DROP_FUNCTION")
            
            _G.IsDropping = false
            if _G.updateDroppingStatus then
                _G.updateDroppingStatus()
            end
            
            saymsg("Drop stopped by /stop command")
            return
        end
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",15000)
    end)
end
