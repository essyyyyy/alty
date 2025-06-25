return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    local DanceNames = {"Dance_1","Dance_2"}
    local function StopDance()
        for i,v in pairs(DanceNames) do
            for j, k in pairs(plr.Character.Humanoid:GetPlayingAnimationTracks()) do
                if k.Name == v then
                    k:Stop()
                end
            end
        end
    end
    local function PlayDance(name, id)
        local Dance = Instance.new("Animation")
        Dance.Parent = plr.Character
        Dance.Name = name
        Dance.AnimationId = id
        plr.Character.Humanoid:LoadAnimation(Dance):Play()
    end
    if tostring(data[2]):lower() == "1" then
        StopDance()
        PlayDance("Dance_1","rbxassetid://3189773368")
    elseif tostring(data[2]):lower() == "2" then
        StopDance()
        PlayDance("Dance_1","rbxassetid://3189776546")
    elseif tostring(data[2]):lower() == "stop" then
        StopDance()
    end
end
