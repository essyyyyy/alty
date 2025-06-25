local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local tweening = false
local tweenSpeed = 100000 -- studs per second
local offsetY = 5 -- offset to avoid clipping into floor

-- Initialize global variables
if not _G.AirlockHeight then
    _G.AirlockHeight = -2
end
if not _G.IsAirlocked then
    _G.IsAirlocked = false
end

-- Function to unlock player
local function unlockPlayer()
    local player = Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.Anchored = false
        _G.IsAirlocked = false
    end
    
    -- Remove airlock part
    if workspace:FindFirstChild("AirlockPart") then
        workspace:FindFirstChild("AirlockPart"):Destroy()
    end
end

-- Function to re-lock player at airlock height
local function relockPlayer()
    if _G.IsAirlocked and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        wait(0.1)
        
        -- Find the airlock platform
        local airlockPart = workspace:FindFirstChild("AirlockPart")
        if airlockPart then
            -- Position character on the platform surface
            local platformSurface = airlockPart.Position + Vector3.new(0, airlockPart.Size.Y/2 + 0.1, 0)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(platformSurface)
        else
            -- Fallback to old method if platform not found
            local airlockPos = Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, _G.AirlockHeight, 0)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(airlockPos + Vector3.new(0, 2.5, 0))
        end
        
        wait(0.25)
        Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
end

-- Function to teleport to a specific position using tweening
local function teleportToPosition(targetPosition)
    if tweening then return end
    
    -- Check and unlock underground mode before teleporting
    unlockPlayer()
    
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Move slightly above surface to avoid clipping
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

-- Function to teleport to a player using tweening
local function teleportToPlayer(targetPlayer, offset)
    if tweening then return end
    
    -- Check and unlock underground mode before teleporting
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

-- Function to teleport to coordinates using tweening
local function teleportToCoords(x, y, z)
    -- Check and unlock underground mode before teleporting
    unlockPlayer()
    
    local targetPosition = Vector3.new(x, y, z)
    teleportToPosition(targetPosition)
end

-- Make functions globally available
_G.TeleportUtils = {
    teleportToPosition = teleportToPosition,
    teleportToPlayer = teleportToPlayer,
    teleportToCoords = teleportToCoords
}

return _G.TeleportUtils 