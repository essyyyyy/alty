
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
    
    if not Settings['disable_gui'] then
    local ScreenGui = Instance.new("ScreenGui")
    local Blackout = Instance.new("Frame")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local TopFrame = Instance.new("Frame")
    local CenterFrame = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")
    
    ScreenGui.Parent = game:service"CoreGui"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "UltraHider10000000"
    
    Blackout.Name = "Blackout"
    Blackout.Parent = ScreenGui
    Blackout.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Blackout.BackgroundTransparency = 0
    Blackout.Size = UDim2.new(1, 0, 1, 65)
    Blackout.Position = UDim2.new(0, 0, 0, -65)
    Blackout.ZIndex = 0

    DropShadow.Name = "DropShadow"
    DropShadow.Parent = ScreenGui
    DropShadow.BackgroundTransparency = 1
    DropShadow.Image = "rbxassetid://1316045217"
    DropShadow.ImageTransparency = 0.4
    DropShadow.Size = UDim2.new(0, 480, 0, 370)
    DropShadow.Position = UDim2.new(0.5, -240, 0.5, -185)
    DropShadow.ZIndex = 1

    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(24, 26, 32)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 440, 0, 330)
    MainFrame.ZIndex = 2
    MainFrame.BorderSizePixel = 0

    UICorner.CornerRadius = UDim.new(0, 18)
    UICorner.Parent = MainFrame

    UIStroke.Parent = MainFrame
    UIStroke.Color = Color3.fromRGB(60, 70, 90)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.2

    TopFrame.Parent = MainFrame
    TopFrame.AnchorPoint = Vector2.new(0.5, 0)
    TopFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    TopFrame.Position = UDim2.new(0.5, 0, 0, 18)
    TopFrame.Size = UDim2.new(0, 400, 0, 70)
    TopFrame.BorderSizePixel = 0
    local TopCorner = Instance.new("UICorner", TopFrame)
    TopCorner.CornerRadius = UDim.new(0, 12)

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

    CenterFrame.Parent = MainFrame
    CenterFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    CenterFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    CenterFrame.Position = UDim2.new(0.5, 0, 0.62, 0)
    CenterFrame.Size = UDim2.new(0, 400, 0, 120)
    CenterFrame.BorderSizePixel = 0
    local CenterCorner = Instance.new("UICorner", CenterFrame)
    CenterCorner.CornerRadius = UDim.new(0, 12)

    local WalletLabel = Instance.new("TextLabel")
    WalletLabel.Parent = CenterFrame
    WalletLabel.BackgroundTransparency = 1
    WalletLabel.Position = UDim2.new(0, 16, 0.5, 0)
    WalletLabel.Size = UDim2.new(0.5, -32, 0.5, 0)
    WalletLabel.Font = Enum.Font.GothamBold
    WalletLabel.Text = "Wallet: $0"
    WalletLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WalletLabel.TextSize = 22
    WalletLabel.TextXAlignment = Enum.TextXAlignment.Left
    WalletLabel.TextYAlignment = Enum.TextYAlignment.Center

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

    local DroppingPill = Instance.new("Frame")
    DroppingPill.Parent = CenterFrame
    DroppingPill.AnchorPoint = Vector2.new(0, 0)
    DroppingPill.Position = UDim2.new(0, 16, 0, 10)
    DroppingPill.Size = UDim2.new(0, 140, 0, 45)
    DroppingPill.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    DroppingPill.BorderSizePixel = 0
    DroppingPill.ZIndex = 3
    local PillCorner = Instance.new("UICorner", DroppingPill)
    PillCorner.CornerRadius = UDim.new(1, 22)
    local PillLabel = Instance.new("TextLabel")
    PillLabel.Parent = DroppingPill
    PillLabel.BackgroundTransparency = 1
    PillLabel.Size = UDim2.new(1, 0, 1, 0)
    PillLabel.Font = Enum.Font.GothamBold
    PillLabel.Text = "Dropping: False"
    PillLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    PillLabel.TextSize = 20
    PillLabel.TextXAlignment = Enum.TextXAlignment.Center
    PillLabel.TextYAlignment = Enum.TextYAlignment.Center

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 0, 1, -38)
    TitleLabel.Size = UDim2.new(1, 0, 0, 28)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "64k's alt ctrl"
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
    DiscordLabel.Text = ".gg/pcZKGYaV8x"
    DiscordLabel.TextColor3 = Color3.fromRGB(100, 180, 255)
    DiscordLabel.TextSize = 14
    DiscordLabel.TextXAlignment = Enum.TextXAlignment.Center
    DiscordLabel.TextYAlignment = Enum.TextYAlignment.Center

    local startTime = tick()
    local function updateRuntime()
        local elapsed = tick() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        RuntimeLabel.Text = string.format("Runtime: %02d:%02d:%02d", hours, minutes, seconds)
    end
    
    _G.IsDropping = false
    _G.updateDroppingStatus = function()
        if _G.IsDropping then
            PillLabel.Text = "Dropping: True"
            PillLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
            DroppingPill.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
        else
            PillLabel.Text = "Dropping: False"
            PillLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            DroppingPill.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
    
    spawn(function()
        while true do
            wait(1)
            updateRuntime()
        end
    end)
    
    local function updateAltNumber()
        for i, altId in pairs(Alts) do
            if altId == player.UserId then
                AltNumberLabel.Text = "ALT NUMBER: " .. tostring(i)
                break
            end
        end
    end
    
    local function updateUserInfo()
        UsernameLabel.Text = "Username: " .. player.Name
        UserIDLabel.Text = "User ID: " .. tostring(player.UserId)
    end
        
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
        
    updateAltNumber()
    updateUserInfo()
    updateWalletDisplay()
        
    local success, _ = pcall(function()
        local dataFolder = player:WaitForChild("DataFolder")
        local currency = dataFolder:WaitForChild("Currency")
        
        currency:GetPropertyChangedSignal("Value"):Connect(function()
            updateWalletDisplay()
        end)
    end)
    
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
    
    local function fullyPreventSitting(char)
        local humanoid = char:WaitForChild("Humanoid")
        local hrp = char:WaitForChild("HumanoidRootPart")

        game:service"RunService".Stepped:Connect(function()
            if humanoid.Sit then
                humanoid.Sit = false
                hrp.Velocity = Vector3.new(0, 50, 0)
            end

            for _, weld in ipairs(char:GetDescendants()) do
                if weld:IsA("Weld") and weld.Name == "SeatWeld" then
                    weld:Destroy()
                    hrp.Velocity = Vector3.new(0, 50, 0)
                end
            end

            local seat = humanoid.SeatPart
            if seat then
                humanoid.Sit = false
                humanoid.SeatPart = nil
                hrp.CFrame = hrp.CFrame + Vector3.new(0, 5, 0)
            end
        end)
    end

    if player.Character then
        fullyPreventSitting(player.Character)
    end
    player.CharacterAdded:Connect(fullyPreventSitting)
    
    local function tryResizeWindow()
        pcall(function()
            game:GetService("UserInputService").WindowSizeChanged:Connect(function()
            end)
        end)
    end
    
    tryResizeWindow()
    
    _G.updateDroppingStatus()
    
    local totalDropped = 0
    local function updateDroppedDisplay()
        local currentDropped = 0
        for _, drop in pairs(workspace.Ignored.Drop:GetChildren()) do
            if drop:IsA("Part") and drop.Name == "MoneyDrop" then
                local amountText = drop.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
                currentDropped = currentDropped + tonumber(amountText)
            end
        end
        
        local formatted = ""
        local amountStr = tostring(currentDropped)
        if amountStr:len() == 4 then
            formatted = amountStr:sub(1,1)..'.'..amountStr:sub(2,2)..'K'
        elseif amountStr:len() == 5 then
            formatted = amountStr:sub(1,2)..'.'..amountStr:sub(3,4)..'K'
        elseif amountStr:len() == 6 then
            formatted = amountStr:sub(1,3)..'.'..amountStr:sub(4,5)..'K'
        elseif amountStr:len() == 7 then
            formatted = amountStr:sub(1,1)..'.'..amountStr:sub(2,3)..'M'
        elseif amountStr:len() == 8 then
            formatted = amountStr:sub(1,2)..'.'..amountStr:sub(3,4)..'M'
        elseif amountStr:len() == 9 then
            formatted = amountStr:sub(1,3)..'.'..amountStr:sub(4,5)..'M'
        elseif amountStr:len() == 10 then
            formatted = amountStr:sub(1,1)..'.'..amountStr:sub(2,3)..'B'
        else
            formatted = amountStr
        end
        
        DroppedLabel.Text = "Dropped: $" .. formatted
    end
    
    workspace.Ignored.Drop.ChildAdded:Connect(function(child)
        if child:IsA("Part") and child.Name == "MoneyDrop" then
            wait(0.1)
            updateDroppedDisplay()
        end
    end)
    
    workspace.Ignored.Drop.ChildRemoved:Connect(function(child)
        if child:IsA("Part") and child.Name == "MoneyDrop" then
            updateDroppedDisplay()
        end
    end)
    
    updateDroppedDisplay()
    
    local function optimizeForMaxPerformance()
        _G.SendNotifications = false
        _G.ConsoleLogs = false
        
        _G.Settings = {
            Players = {
                ["Ignore Me"] = true,
                ["Ignore Others"] = true,
                ["Ignore Tools"] = true
            },
            Meshes = {
                NoMesh = true,
                NoTexture = true,
                Destroy = true
            },
            Images = {
                Invisible = true,
                Destroy = true
            },
            Explosions = {
                Smaller = true,
                Invisible = true,
                Destroy = true
            },
            Particles = {
                Invisible = true,
                Destroy = true
            },
            TextLabels = {
                LowerQuality = true,
                Invisible = true,
                Destroy = true
            },
            MeshParts = {
                LowerQuality = true,
                Invisible = true,
                NoTexture = true,
                NoMesh = true,
                Destroy = true
            },
            Other = {
                ["FPS Cap"] = true,
                ["No Camera Effects"] = true,
                ["No Clothes"] = true,
                ["Low Water Graphics"] = true,
                ["No Shadows"] = true,
                ["Low Rendering"] = true,
                ["Low Quality Parts"] = true,
                ["Low Quality Models"] = true,
                ["Reset Materials"] = true,
                ["Lower Quality MeshParts"] = true,
                ClearNilInstances = true
            }
        }
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
                v:Destroy()
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("PostEffect") then
                v.Enabled = false
                v:Destroy()
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Explosion") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Clothing") or v:IsA("SurfaceAppearance") or v:IsA("BaseWrap") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("MeshPart") then
                v.RenderFidelity = 2
                v.Reflectance = 0
                v.Material = Enum.Material.Plastic
                v.TextureID = ""
                v.MeshId = ""
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Model") then
                v.LevelOfDetail = 1
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("TextLabel") and v:IsDescendantOf(workspace) then
                v.Font = Enum.Font.SourceSans
                v.TextScaled = false
                v.RichText = false
                v.TextSize = 14
                v.Visible = false
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("DataModelMesh") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("FaceInstance") then
                v.Transparency = 1
                v.Shiny = 1
            end
        end
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ShirtGraphic") then
                v.Graphic = ""
            end
        end
        
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
            if sethiddenproperty then
                sethiddenproperty(terrain, "Decoration", false)
            end
        end
        
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.FogEnd = 9e9
        lighting.ShadowSoftness = 0
        if sethiddenproperty then
            sethiddenproperty(lighting, "Technology", 2)
        end
        
        settings().Rendering.QualityLevel = 1
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
        
        local materialService = game:GetService("MaterialService")
        for _, v in pairs(materialService:GetChildren()) do
            v:Destroy()
        end
        materialService.Use2022Materials = false
        

        
        if getnilinstances then
            for _, v in pairs(getnilinstances()) do
                pcall(v.Destroy, v)
            end
        end
        
        game.DescendantAdded:Connect(function(instance)
            if instance:IsA("ParticleEmitter") or instance:IsA("Trail") or instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Sparkles") then
                instance.Enabled = false
                instance:Destroy()
            elseif instance:IsA("PostEffect") then
                instance.Enabled = false
                instance:Destroy()
            elseif instance:IsA("Explosion") then
                instance:Destroy()
            elseif instance:IsA("Clothing") or instance:IsA("SurfaceAppearance") or instance:IsA("BaseWrap") then
                instance:Destroy()
            elseif instance:IsA("DataModelMesh") then
                instance:Destroy()
            elseif instance:IsA("FaceInstance") then
                instance.Transparency = 1
                instance.Shiny = 1
            elseif instance:IsA("ShirtGraphic") then
                instance.Graphic = ""
            elseif instance:IsA("BasePart") and not instance:IsA("MeshPart") then
                instance.Material = Enum.Material.Plastic
                instance.Reflectance = 0
            elseif instance:IsA("MeshPart") then
                instance.RenderFidelity = 2
                instance.Reflectance = 0
                instance.Material = Enum.Material.Plastic
                instance.TextureID = ""
                instance.MeshId = ""
            elseif instance:IsA("Model") then
                instance.LevelOfDetail = 1
            elseif instance:IsA("TextLabel") and instance:IsDescendantOf(workspace) then
                instance.Font = Enum.Font.SourceSans
                instance.TextScaled = false
                instance.RichText = false
                instance.TextSize = 14
                instance.Visible = false
            end
        end)
    end
    
    optimizeForMaxPerformance()
    
    local function antiSeat()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            if humanoid.Sit then
                humanoid.Jump = true
            end
        end
    end
    
    spawn(function()
        while true do
            antiSeat()
            wait(1)
        end
    end)
    
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
    
    spawn(function()
        while true do
            wait(30)
            checkLowMoney()
        end
    end)
    
    pcall(function() setfpscap(Settings['fps']) end)
end

local PackageLoader = "https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/cmds/"
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/module.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/anticheat.lua"))() end)

pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/teleport_utils.lua"))() end)

local player = game:service"Players".LocalPlayer
local LoadedPackages, LoadedFunctions = {}, {}

local function LoadPackage(name)
    local meta = LoadedPackages[tostring(name:lower())] or false
    if meta ~= false then
        return "already loaded"
    end
    LoadedPackages[tostring(name:lower())] = true   
    
    local success, data = pcall(function()
        return game:HttpGet(PackageLoader..""..name:lower()..".lua")
    end)
    
    if not success or not data then
        return "none"
    end
    
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

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    TextChatService.OnIncomingMessage = function(message)
        local user = message.TextSource.UserId
        local msg = message.Text
        local player = Players:GetPlayerByUserId(user)
        if player and user == Settings['host'] then
            cmds(msg, user)
        end
    end
else
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
end
print("executed lololo")
