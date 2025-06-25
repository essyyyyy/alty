--// Main code, made by remorse

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = game:service"Players".LocalPlayer
local ws = workspace

local ishost = player.UserId == Settings['host']
if not ishost then
    settings().Physics.PhysicsEnvironmentalThrottle = 1
    settings().Rendering.QualityLevel = 'Level01'
    UserSettings():GetService("UserGameSettings").MasterVolume = 0
    
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then
            v.Material = Enum.Material.Pavement
            v.Transparency = 1
        elseif v:IsA("Decal") then
            v:Destroy()
        elseif v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("MeshPart") then
            v.TextureID = 0
            v.Transparency = 1
        elseif v.Name == "Terrian" then
            v.WaterReflectace = 1
            v.WaterTransparency = 1
        elseif v:IsA("SpotLight") then
            v.Range = 0
            v.Enabled = false
        elseif v:IsA("WedgePart") then
            v.Transparency = 1
        elseif v:IsA("UnionOperation") then
            v.Transparency = 1
        end
    end
    
    -- Only create the fullscreen GUI if disable_gui is false
    if not Settings['disable_gui'] then
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local TopFrame = Instance.new("Frame")
    local CenterFrame = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")

    ScreenGui.Parent = game:service"CoreGui"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "UltraHider10000000"

    -- Drop shadow
    DropShadow.Name = "DropShadow"
    DropShadow.Parent = ScreenGui
    DropShadow.BackgroundTransparency = 1
    DropShadow.Image = "rbxassetid://1316045217"
    DropShadow.ImageTransparency = 0.4
    DropShadow.Size = UDim2.new(0, 480, 0, 370)
    DropShadow.Position = UDim2.new(0.5, -240, 0.5, -185)
    DropShadow.ZIndex = 0

    -- Main background frame
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(24, 26, 32)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 440, 0, 330)
    MainFrame.ZIndex = 1
    MainFrame.BorderSizePixel = 0

    UICorner.CornerRadius = UDim.new(0, 18)
    UICorner.Parent = MainFrame

    UIStroke.Parent = MainFrame
    UIStroke.Color = Color3.fromRGB(60, 70, 90)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.2

    -- Top frame for username and status
    TopFrame.Parent = MainFrame
    TopFrame.AnchorPoint = Vector2.new(0.5, 0)
    TopFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    TopFrame.Position = UDim2.new(0.5, 0, 0, 18)
    TopFrame.Size = UDim2.new(0, 400, 0, 70)
    TopFrame.BorderSizePixel = 0
    local TopCorner = Instance.new("UICorner", TopFrame)
    TopCorner.CornerRadius = UDim.new(0, 12)

    -- Username (big and bold)
    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Parent = TopFrame
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Position = UDim2.new(0, 0, 0, 0)
    UsernameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    UsernameLabel.Font = Enum.Font.GothamBold
    UsernameLabel.Text = "@username"
    UsernameLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
    UsernameLabel.TextSize = 28
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Center
    UsernameLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Dropping status pill
    local DroppingPill = Instance.new("Frame")
    DroppingPill.Parent = TopFrame
    DroppingPill.AnchorPoint = Vector2.new(1, 0)
    DroppingPill.Position = UDim2.new(1, -16, 0, 12)
    DroppingPill.Size = UDim2.new(0, 80, 0, 28)
    DroppingPill.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    DroppingPill.BorderSizePixel = 0
    local PillCorner = Instance.new("UICorner", DroppingPill)
    PillCorner.CornerRadius = UDim.new(1, 14)
    local PillLabel = Instance.new("TextLabel")
    PillLabel.Parent = DroppingPill
    PillLabel.BackgroundTransparency = 1
    PillLabel.Size = UDim2.new(1, 0, 1, 0)
    PillLabel.Font = Enum.Font.GothamBold
    PillLabel.Text = "Dropping: False"
    PillLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    PillLabel.TextSize = 16
    PillLabel.TextXAlignment = Enum.TextXAlignment.Center
    PillLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Dropped amount
    local DroppedLabel = Instance.new("TextLabel")
    DroppedLabel.Parent = TopFrame
    DroppedLabel.BackgroundTransparency = 1
    DroppedLabel.Position = UDim2.new(0, 16, 0.5, 0)
    DroppedLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    DroppedLabel.Font = Enum.Font.Gotham
    DroppedLabel.Text = "Dropped: $???"
    DroppedLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
    DroppedLabel.TextSize = 20
    DroppedLabel.TextXAlignment = Enum.TextXAlignment.Left
    DroppedLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Elapsed time
    local RuntimeLabel = Instance.new("TextLabel")
    RuntimeLabel.Parent = TopFrame
    RuntimeLabel.BackgroundTransparency = 1
    RuntimeLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    RuntimeLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    RuntimeLabel.Font = Enum.Font.Gotham
    RuntimeLabel.Text = "Elapsed: 00:00:00"
    RuntimeLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
    RuntimeLabel.TextSize = 20
    RuntimeLabel.TextXAlignment = Enum.TextXAlignment.Right
    RuntimeLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Center frame for balance and alt info
    CenterFrame.Parent = MainFrame
    CenterFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    CenterFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    CenterFrame.Position = UDim2.new(0.5, 0, 0.62, 0)
    CenterFrame.Size = UDim2.new(0, 400, 0, 120)
    CenterFrame.BorderSizePixel = 0
    local CenterCorner = Instance.new("UICorner", CenterFrame)
    CenterCorner.CornerRadius = UDim.new(0, 12)

    -- Total Balance
    local BalanceLabel = Instance.new("TextLabel")
    BalanceLabel.Parent = CenterFrame
    BalanceLabel.BackgroundTransparency = 1
    BalanceLabel.Position = UDim2.new(0, 16, 0, 10)
    BalanceLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    BalanceLabel.Font = Enum.Font.GothamBold
    BalanceLabel.Text = "Total Balance: $???"
    BalanceLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
    BalanceLabel.TextSize = 22
    BalanceLabel.TextXAlignment = Enum.TextXAlignment.Left
    BalanceLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Alt number
    local AltNumberLabel = Instance.new("TextLabel")
    AltNumberLabel.Parent = CenterFrame
    AltNumberLabel.BackgroundTransparency = 1
    AltNumberLabel.Position = UDim2.new(0.5, 0, 0, 10)
    AltNumberLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    AltNumberLabel.Font = Enum.Font.Gotham
    AltNumberLabel.Text = "Alt: 1"
    AltNumberLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
    AltNumberLabel.TextSize = 20
    AltNumberLabel.TextXAlignment = Enum.TextXAlignment.Right
    AltNumberLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Wallet
    local WalletLabel = Instance.new("TextLabel")
    WalletLabel.Parent = CenterFrame
    WalletLabel.BackgroundTransparency = 1
    WalletLabel.Position = UDim2.new(0, 16, 0.5, 0)
    WalletLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    WalletLabel.Font = Enum.Font.Gotham
    WalletLabel.Text = "Wallet: $0"
    WalletLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WalletLabel.TextSize = 18
    WalletLabel.TextXAlignment = Enum.TextXAlignment.Left
    WalletLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- User ID
    local UserIDLabel = Instance.new("TextLabel")
    UserIDLabel.Parent = CenterFrame
    UserIDLabel.BackgroundTransparency = 1
    UserIDLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    UserIDLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    UserIDLabel.Font = Enum.Font.Gotham
    UserIDLabel.Text = "ID: ???"
    UserIDLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
    UserIDLabel.TextSize = 18
    UserIDLabel.TextXAlignment = Enum.TextXAlignment.Right
    UserIDLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Bottom: script title and discord
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 0, 1, -38)
    TitleLabel.Size = UDim2.new(1, 0, 0, 28)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "debs alt ctrl"
    TitleLabel.TextColor3 = Color3.fromRGB(100, 180, 255)
    TitleLabel.TextSize = 22
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.TextYAlignment = Enum.TextYAlignment.Center

    local DiscordLabel = Instance.new("TextLabel")
    DiscordLabel.Parent = MainFrame
    DiscordLabel.BackgroundTransparency = 1
    DiscordLabel.Position = UDim2.new(0, 0, 1, -16)
    DiscordLabel.Size = UDim2.new(1, 0, 0, 16)
    DiscordLabel.Font = Enum.Font.Gotham
    DiscordLabel.Text = ".gg/kcfknE6aq9"
    DiscordLabel.TextColor3 = Color3.fromRGB(100, 180, 255)
    DiscordLabel.TextSize = 14
    DiscordLabel.TextXAlignment = Enum.TextXAlignment.Center
    DiscordLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Runtime tracking
    local startTime = tick()
    local function updateRuntime()
        local elapsed = tick() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        RuntimeLabel.Text = string.format("Runtime: %02d:%02d:%02d", hours, minutes, seconds)
    end
    
    -- Update runtime every second
    spawn(function()
        while true do
            wait(1)
            updateRuntime()
        end
    end)
    
    -- Find alt number
    local function updateAltNumber()
        for i, altId in pairs(Alts) do
            if altId == player.UserId then
                AltNumberLabel.Text = "ALT NUMBER: " .. tostring(i)
                break
            end
        end
    end
    
    -- Update username and user ID
    local function updateUserInfo()
        UsernameLabel.Text = "Username: " .. player.Name
        UserIDLabel.Text = "User ID: " .. tostring(player.UserId)
    end
        
    -- Wallet money display functionality
    local function updateWalletDisplay()
        local success, walletAmount = pcall(function()
            local dataFolder = player:WaitForChild("DataFolder")
            local currency = dataFolder:WaitForChild("Currency")
            return currency.Value
        end)
        
        if success then
            WalletLabel.Text = "Wallet: $" .. tostring(walletAmount)
        else
            WalletLabel.Text = "Wallet: $0"
        end
    end
        
    -- Update all info initially
    updateAltNumber()
    updateUserInfo()
    updateWalletDisplay()
        
    -- Update wallet display when currency changes
    local success, _ = pcall(function()
        local dataFolder = player:WaitForChild("DataFolder")
        local currency = dataFolder:WaitForChild("Currency")
        
        currency:GetPropertyChangedSignal("Value"):Connect(function()
            updateWalletDisplay()
        end)
    end)
    
    -- Automatic player join/leave monitoring
    game:service"Players".PlayerAdded:Connect(function(joinedPlayer)
        if joinedPlayer and joinedPlayer.Name then
            saymsg(joinedPlayer.Name .. " joined.")
            if JoinedLabel then
                JoinedLabel.Text = "Last User Joined: " .. joinedPlayer.Name
            end
        end
    end)
    
    game:service"Players".PlayerRemoving:Connect(function(leftPlayer)
        if leftPlayer and leftPlayer.Name then
            saymsg(leftPlayer.Name .. " left.")
            if DroppedLabel then
                DroppedLabel.Text = "Last User Left: " .. leftPlayer.Name
            end
        end
    end)
    
    -- Anti-sit system (active 24/7)
    local function fullyPreventSitting(char)
        local humanoid = char:WaitForChild("Humanoid")
        local hrp = char:WaitForChild("HumanoidRootPart")

        -- Force anti-sit constantly
        game:service"RunService".Stepped:Connect(function()
            if humanoid.Sit then
                humanoid.Sit = false
                hrp.Velocity = Vector3.new(0, 50, 0) -- burst upward
            end

            -- Destroy any seat welds instantly
            for _, weld in ipairs(char:GetDescendants()) do
                if weld:IsA("Weld") and weld.Name == "SeatWeld" then
                    weld:Destroy()
                    hrp.Velocity = Vector3.new(0, 50, 0)
                end
            end

            -- Actively break seat contact if still touching
            local seat = humanoid.SeatPart
            if seat then
                humanoid.Sit = false
                humanoid.SeatPart = nil
                hrp.CFrame = hrp.CFrame + Vector3.new(0, 5, 0)
            end
        end)
    end

    -- Apply to current + future characters
    if player.Character then
        fullyPreventSitting(player.Character)
    end
    player.CharacterAdded:Connect(fullyPreventSitting)
    
    -- Attempt to resize Roblox window (may not work due to security)
    local function tryResizeWindow()
        pcall(function()
            -- Try to set window size (this usually doesn't work in Roblox)
            game:GetService("UserInputService").WindowSizeChanged:Connect(function()
                -- This is just a placeholder - actual window resizing isn't possible from scripts
            end)
        end)
    end
    
    tryResizeWindow()
    end
    
    -- Low money monitoring system
    local function checkLowMoney()
        for _, altId in pairs(Alts) do
            local altPlayer = game:service"Players":GetPlayerByUserId(altId)
            if altPlayer then
                local success, money = pcall(function()
                    local dataFolder = altPlayer:WaitForChild("DataFolder")
                    local currency = dataFolder:WaitForChild("Currency")
                    return currency.Value
                end)
                
                if success and money < 15000 then
                    saymsg(altPlayer.Name .. " low money: $" .. tostring(money))
                end
            end
        end
    end
    
    -- Check low money every 30 seconds
    spawn(function()
        while true do
            wait(30)
            checkLowMoney()
        end
    end)
    
    pcall(function() setfpscap(Settings['fps']) end)
end

--// Alt control stuff
local PackageLoader = "https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/cmds/"
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/module.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/anticheat.lua"))() end)

-- Load teleport utilities
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/teleport_utils.lua"))() end)

local player = game:service"Players".LocalPlayer
local LoadedPackages, LoadedFunctions = {}, {}

local function LoadPackage(name)
    local meta = LoadedPackages[tostring(name:lower())] or false
    if meta ~= false then
        return "already loaded"
    end
    LoadedPackages[tostring(name:lower())] = true   
    
    -- Use game:HttpGet instead of request function
    local success, data = pcall(function()
        return game:HttpGet(PackageLoader..""..name:lower()..".lua")
    end)
    
    if not success or not data then
        return "none"
    end
    
    -- Load the function safely
    local success2, func = pcall(function()
        return loadstring(data)()
    end)
    
    if not success2 or not func then
        return "none"
    end
    
    LoadedFunctions[tostring(name:lower())] = func
    return "loaded"
end

local function cmds(msg, plr)
    if ishost == false then
        msg = msg:lower()
        local prefix = tostring(Settings['prefix'])
        if tostring(msg):find(tostring(prefix:lower())) and not tostring(msg):find(" ") then
            local que = msg:gsub(prefix,"")
            local data = LoadPackage(que)
            if data ~= "none" and LoadedFunctions[que] then
                pcall(function()
                LoadedFunctions[que]()
                end)
            end
        else
            local org = msg
            msg = msg:split(" ")
            if tostring(msg[1]):find(tostring(prefix:lower())) then
                local que = msg[1]:gsub(prefix,"")
                local data = LoadPackage(que)
                if data ~= "none" and LoadedFunctions[que] then
                    pcall(function()
                    LoadedFunctions[que](msg)
                    end)
                end
            end
        end
    end
end

game:service"Players".LocalPlayer.Idled:connect(function()
	game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Updated chat system for new Roblox chat
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

-- Try the new TextChatService first, fallback to old system if needed
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    -- New chat system
    TextChatService.OnIncomingMessage = function(message)
        local user = message.TextSource.UserId
        local msg = message.Text
        local player = Players:GetPlayerByUserId(user)
        if player and user == Settings['host'] then
            cmds(msg, user)
        end
    end
else
    -- Fallback to old chat system (if still available)
    pcall(function()
game:service"ReplicatedStorage".DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) 
    local user = data.FromSpeaker
    local msg = data.Message
    if game:service"Players":FindFirstChild(user).UserId == Settings['host'] then
        cmds(msg, game:service"Players":FindFirstChild(user).UserId)
    end
end)
    end)
end

print("executed lololo")
