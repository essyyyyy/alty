return function()
    local plr = game:service"Players".LocalPlayer
    plr.Character.HumanoidRootPart.Anchored = false
    
    -- Remove airlock part
    if workspace:FindFirstChild("AirlockPart") then
        workspace:FindFirstChild("AirlockPart"):Destroy()
    end
    
    saymsg("unlocked")
end
