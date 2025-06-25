return function()
    game:service"RunService":BindToRenderStep("DROP_FUNCTION",1,function()
        -- Check if stop command was called
        if getgenv().STOPACTIONS then
            game:service"RunService":UnbindFromRenderStep("DROP_FUNCTION")
            saymsg("Drop stopped by /stop command")
            return
        end
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",15000)
    end)
end
