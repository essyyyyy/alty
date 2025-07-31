local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local tweening = false
local tweenSpeed = 100000
local offsetY = 5

if not _G.AirlockHeight then
    _G.AirlockHeight = -2
end
if not _G.IsAirlocked then
    _G.IsAirlocked = false
end

local function unlockPlayer()
    local player = Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.Anchored = false
        _G.IsAirlocked = false
    end
    
    if workspace:FindFirstChild("AirlockPart") then
        workspace:FindFirstChild("AirlockPart"):Destroy()
    end
end

local function relockPlayer()
    if _G.IsAirlocked and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        wait(0.1)
        
        local airlockPart = workspace:FindFirstChild("AirlockPart")
        if airlockPart then
            local platformSurface = airlockPart.Position + Vector3.new(0, airlockPart.Size.Y/2 + 0.1, 0)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(platformSurface)
        else
            local airlockPos = Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, _G.AirlockHeight, 0)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(airlockPos + Vector3.new(0, 2.5, 0))
        end
        
        wait(0.25)
        Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
end

local function teleportToPosition(targetPosition)
    if tweening then return end
    
    unlockPlayer()
    
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local targetAbove = targetPosition + Vector3.new(0, offsetY, 0)
    
    local distance = (humanoidRootPart.Position - targetAbove).Magnitude
    local tweenTime = distance / tweenSpeed
    
    local tween = TweenService:Create(
        humanoidRootPart,
        TweenInfo.new(tweenTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {CFrame = CFrame.new(targetAbove)}
    )
    
    tweening = true
    tween:Play()
    tween.Completed:Wait()
    tweening = false
    
    relockPlayer()
end

local function teleportToPlayer(targetPlayer, offset)
    if tweening then return end
    
    unlockPlayer()
    
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        local finalPosition = offset and (targetPosition + offset) or targetPosition
        
        teleportToPosition(finalPosition)
    end
end

local function teleportToCoords(x, y, z)
    unlockPlayer()
    
    local targetPosition = Vector3.new(x, y, z)
    teleportToPosition(targetPosition)
end

_G.TeleportUtils = {
    teleportToPosition = teleportToPosition,
    teleportToPlayer = teleportToPlayer,
    teleportToCoords = teleportToCoords
}

return _G.TeleportUtils 