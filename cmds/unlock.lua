return function()
    local plr = game:service"Players".LocalPlayer
    plr.Character.HumanoidRootPart.Anchored = false
    
    if workspace:FindFirstChild("AirlockPart") then
        workspace:FindFirstChild("AirlockPart"):Destroy()
    end
    
    saymsg("unlocked")
end
