return function()
    pcall(function() game:service"RunService":UnbindFromRenderStep("DROP_FUNCTION") end)
    pcall(function() game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION") end )

    if _G.IsTrackingPlayer then
        _G.IsTrackingPlayer = false
        saymsg("stopped")
    end

    if _G.IsVibing then
        local plr = game:service"Players".LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local DanceNames = {"Dance_1","Dance_2"}
            for i,v in pairs(DanceNames) do
                for j, k in pairs(plr.Character.Humanoid:GetPlayingAnimationTracks()) do
                    if k.Name == v then
                        k:Stop()
                    end
                end
            end
        end
        _G.IsVibing = false
        saymsg("Vibe stopped")
    end

    _G.IsDropping = false
    
    if _G.updateDroppingStatus then
        _G.updateDroppingStatus()
    end

    getgenv().STOPACTIONS = true
    getgenv().LOOPDESTROY_ACTIVE = false
    wait(5)
    getgenv().STOPACTIONS = false
end
