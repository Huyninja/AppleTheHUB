getgenv().NoSunDmg = false;
getgenv().killaura1 = false;
getgenv().killaura2 = false;
getgenv().killaura3 = false;
getgenv().killaura4 = false;
getgenv().killaura5 = false;
getgenv().warfans = false;
getgenv().infblock = false;
getgenv().autodung = false;
getgenv().autoloot = false;
getgenv().GodMode1 = false;
getgenv().GodMode2 = false;
getgenv().GodMode3 = false;
getgenv().GodMode4 = false;
getgenv().GodMode5 = false;
getgenv().GodMode6 = false;
getgenv().GodMode7 = false;
getgenv().GodMode7 = false;
getgenv().GodMode8 = false;
getgenv().GodMode10 = false;
getgenv().GodMode11 = false;
getgenv().GodMode12 = false;
getgenv().GodMode13 = false;
getgenv().GodMode14 = false;
getgenv().noclipfarm = false;
getgenv().reducelag1 = false;
getgenv().reducelag2 = false;
getgenv().reducelag3 = false;
getgenv().antiidle = false;
getgenv().AutoOrb = false;
getgenv().skillz = false;
getgenv().skillx = false;
getgenv().skillc = false;
getgenv().skillv = false;
getgenv().skillb = false;
getgenv().skilln = false;
getgenv().whitescreen = false;

local client = game:GetService("Players").LocalPlayer;
local ReplStor = game:GetService("ReplicatedStorage");
local LP = game.Players.LocalPlayer;

--clan perks
function clan(name)
    task.spawn(function()
        local localplayer = game:GetService("Players").LocalPlayer
        local clanValue = name
        game:GetService("ReplicatedStorage").Player_Data[localplayer.Name].Clan.Value = clanValue
    end)
end

--server hop
local HttpService, TPService = game:GetService("HttpService"), game:GetService("TeleportService")
local ServersToTP = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" ..
    game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
function rejoin()
    for _, s in pairs(ServersToTP.data) do
        if s.playing ~= s.maxPlayers then
            TPService:TeleportToPlaceInstance(game.PlaceId, s.id)
        end
    end
end

--auto rejoin when crash
game.Players.PlayerRemoving:Connect(function(player)
    if player.Name == game.Players.LocalPlayer.Name and AutoRejoin then
        local ts = game:GetService("TeleportService")
        ts:Teleport(game.PlaceId)
        autoload()
    end
end)

repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')

local lp, po, ts = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay,
    game:GetService('TeleportService')


--whitescreen
local rn = game:GetService("RunService")

--anti idle
repeat wait() until game:IsLoaded()
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

--anti kick
loadstring(game:HttpGet("https://raw.githubusercontent.com/Huyninja/AppleHUB/main/antikick.lua", true))()

repeat wait() until game:IsLoaded()
local skill_module = require(game:GetService("ReplicatedStorage").Modules.Server["Skills_Modules_Handler"])

hookfunction(skill_module.Kick, function()
    return nil
end);

local anti_cheat1 = game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]["Client_Global_utility"]
local anti_cheat2 = game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]
    ["client_global_delete_script"]

hookfunction(anti_cheat1.GetPropertyChangedSignal, function()
    return
end)

hookfunction(anti_cheat2.GetPropertyChangedSignal, function()
    return
end)

anti_cheat1.Disabled = true
anti_cheat2.Disabled = true

--auto use skill
local vim = game:service("VirtualInputManager")

function skill1()
    spawn(function()
        while task.wait() do
            if skillz then
                task.wait(2)
                vim:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
            end
        end
    end)
end

function skill2()
    spawn(function()
        while task.wait() do
            if skillx then
                task.wait(2)
                vim:SendKeyEvent(true, Enum.KeyCode.X, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.X, false, game)
            end
        end
    end)
end

function skill3()
    spawn(function()
        while task.wait() do
            if skillc then
                task.wait(2)
                vim:SendKeyEvent(true, Enum.KeyCode.C, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.C, false, game)
            end
        end
    end)
end

function skill4()
    spawn(function()
        while task.wait() do
            if skillv then
                task.wait(2)
                vim:SendKeyEvent(true, Enum.KeyCode.V, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.V, false, game)
            end
        end
    end)
end

function skill5()
    spawn(function()
        while task.wait() do
            if skillb then
                task.wait(2)
                vim:SendKeyEvent(true, Enum.KeyCode.B, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.B, false, game)
            end
        end
    end)
end

function skill6()
    spawn(function()
        while task.wait() do
            if skilln then
                task.wait(2)
                vim:SendKeyEvent(true, Enum.KeyCode.N, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.N, false, game)
            end
        end
    end)
end

--auto orbs
getgenv().Time = 5;

spawn(function()
    while task.wait() do
        if AutoOrb then
            for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                if v:IsA("Model") and v.Name == "StaminaRegen" then
                    do
                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end
                end
            end
            wait(1)
            for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                if v:IsA("Model") and v.Name == "DoublePoints" then
                    do
                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end
                end
            end
            wait(1)
            for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                if v:IsA("Model") and v.Name == "InstaKill" then
                    do
                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end
                end
            end
            wait(1)
            for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                if v:IsA("Model") and v.Name == "HealthRegen" then
                    do
                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end
                end
            end
            wait(1)
            for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                if v:IsA("Model") and v.Name == "BloodMoney" then
                    do
                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end
                end
            end
            wait(Time)
        end
    end
end)

--remove texture
function reveffect()
    spawn(function()
        while task.wait() do
            pcall(function()
                if reducelag1 then
                    for _, v in pairs(game.Workspace.Debree:GetDescendants()) do
                        if v.Name == "Damage_Folder" then
                            v:Destroy()
                        end
                    end
                    for _, v in pairs(game.Workspace.Debree:GetDescendants()) do
                        if v.Name == "bleedfolder" then
                            v:Destroy()
                        end
                    end
                end
            end)
        end
    end)
end

function revparticles()
    spawn(function()
        while task.wait() do
            pcall(function()
                if reducelag2 then
                    for _, v in pairs(game.ReplicatedStorage.Assets:GetDescendants()) do
                        if v.Name == "Particles" then
                            v:Destroy()
                        end
                    end
                    for _, v in pairs(game.ReplicatedStorage.Assets:GetDescendants()) do
                        if v.Name == "Death_Effect" then
                            v:Destroy()
                        end
                    end
                    for _, v in pairs(game.Players:GetDescendants()) do
                        if v.Name == "Pop_Ups" then
                            v:Destroy()
                        end
                    end
                    wait(86400)
                end
            end)
        end
    end)
end

function revtexture()
    if reducelag3 then
        local decalsYeeted = true
        local workspace = game.Workspace
        local lighting = game.Lighting
        local terrain = workspace.Terrain

        -- Improve performance by setting hidden properties only once
        local lightingTechnology = 2
        local decorationEnabled = false
        sethiddenproperty(lighting, "Technology", lightingTechnology)
        sethiddenproperty(terrain, "Decoration", decorationEnabled)

        -- Use table instead of separate settings
        local terrainSettings = {
            WaterWaveSize = 0,
            WaterWaveSpeed = 0,
            WaterReflectance = 0,
            WaterTransparency = 0,
        }
        for setting, value in pairs(terrainSettings) do
            terrain[setting] = value
        end

        lighting.GlobalShadows = 0
        lighting.FogEnd = 9e9
        lighting.Brightness = 0
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        -- Consolidate common operations into functions for better readability and maintainability
        local function handleBasePart(part)
            part.Material = Enum.Material.Plastic
            part.Reflectance = 0
        end

        local function handleDecalOrTexture(decalOrTexture)
            if decalsYeeted then
                decalOrTexture.Transparency = 1
            end
        end

        local function handleParticleEmitterOrTrail(emitterOrTrail)
            emitterOrTrail.Lifetime = NumberRange.new(0)
        end

        local function handleExplosion(explosion)
            explosion.BlastPressure = 1
            explosion.BlastRadius = 1
        end

        local function handleMeshPart(meshPart)
            if decalsYeeted then
                meshPart.Material = Enum.Material.Plastic
                meshPart.Reflectance = 0
                meshPart.TextureID = 10385902758728957
            end
        end

        local function handleSpecialMesh(specialMesh)
            if decalsYeeted then
                specialMesh.TextureId = 0
            end
        end

        local function handleShirtGraphic(shirtGraphic)
            if decalsYeeted then
                shirtGraphic.Graphic = ""
            end
        end

        local function handleClothing(clothing)
            if decalsYeeted then
                if clothing:IsA("Shirt") then
                    clothing.ShirtTemplate = ""
                elseif clothing:IsA("Pants") then
                    clothing.PantsTemplate = ""
                end
            end
        end

        -- Handle existing descendants
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("BasePart") and not descendant:IsA("MeshPart") then
                handleBasePart(descendant)
            elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
                handleDecalOrTexture(descendant)
            elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                handleParticleEmitterOrTrail(descendant)
            elseif descendant:IsA("Explosion") then
                handleExplosion(descendant)
            elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
                descendant.Enabled = false
            elseif descendant:IsA("MeshPart") then
                handleMeshPart(descendant)
            elseif descendant:IsA("SpecialMesh") then
                handleSpecialMesh(descendant)
            elseif descendant:IsA("ShirtGraphic") then
                handleShirtGraphic(descendant)
            elseif descendant:IsA("Shirt") or descendant:IsA("Pants") then
                handleClothing(descendant)
            end
        end

        -- Handle new descendants
        workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") and not descendant:IsA("MeshPart") then
                handleBasePart(descendant)
            elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
                handleDecalOrTexture(descendant)
            elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                handleParticleEmitterOrTrail(descendant)
            elseif descendant:IsA("Explosion") then
                handleExplosion(descendant)
            elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
                descendant.Enabled = false
            elseif descendant:IsA("MeshPart") then
                handleMeshPart(descendant)
            elseif descendant:IsA("SpecialMesh") then
                handleSpecialMesh(descendant)
            elseif descendant:IsA("ShirtGraphic") then
                handleShirtGraphic(descendant)
            elseif descendant:IsA("Shirt") or descendant:IsA("Pants") then
                handleClothing(descendant)
            end
        end)
    end
end

-- inf block
function autoblock()
    spawn(function()
        while task.wait() do
            if infblock then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild(
                    "Handle_Initiate_S"):FireServer("add_blocking",
                    "Players.PlayerScripts.Skills_Modules.Combat.Combat//Block", 83826.68492449999,
                    game:GetService("ReplicatedStorage"):WaitForChild("PlayerValues"),
                    93)
                task.wait(0.2)
                ReplStor.Remotes.To_Server.Handle_Initiate_S:InvokeServer("remove_blocking",
                    ReplStor.PlayerValues)
                task.wait()
            elseif not infblock then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:InvokeServer("remove_blocking",
                    ReplStor.PlayerValues)
            end
        end
    end)
end

--auto loot
function loot()
    spawn(function()
        while autoloot do
            for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                if v.Name == "Loot_Chest" then
                    for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do
                        v["Add_To_Inventory"]:InvokeServer(c.Name)
                    end
                end
            end
            task.wait(0.12)
        end
    end)
end

--autodung
local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,
            Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
        Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,
            Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end

function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance / tweenspeed, Enum.EasingStyle.Linear),
        { CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1, 1, 1), math.rad(0)) })
    TweenInfo:Play()
    function TweenFunc:Cancel()
        TweenInfo:Cancel()
        return false
    end

    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
        TweenInfo:Cancel()
        return false
    end
    return TweenFunc
end

getgenv().tweenspeed = 250

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().ADFarmMethod == "Above" then
                FarmModes2 = CFrame.new(0, getgenv().getgenv().ADfarmdistance, 0) *
                    CFrame.Angles(math.rad(-90), 0, 0)
            elseif getgenv().ADFarmMethod == "Below" then
                FarmModes2 = CFrame.new(0, -getgenv().ADfarmdistance, 0) * CFrame.Angles(math.rad(90), 0, 0)
            elseif getgenv().ADFarmMethod == "Behind" then
                FarmModes2 = CFrame.new(0, 0, getgenv().ADfarmdistance)
            elseif getgenv().ADFarmMethod == "Ahead" then
                FarmModes2 = CFrame.new(0, 0, -getgenv().ADfarmdistance)
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().autodung then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall3.Velocity = Vector3.new(0, 0, 0)
                    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                local distance = GetDistance(v:GetModelCFrame() * FarmModes2)
                                repeat
                                    task.wait()
                                    if distance < 10 then
                                        if TweenFa then
                                            TweenFa:Cancel()
                                            wait(0.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes2
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes2)
                                    end
                                until not getgenv().autodung or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    task.wait(1)
                else
                    if autodung == false then
                        antifall3:Destroy()
                        antifall3.Velocity = Vector3.new()
                        antifall3.MaxForce = Vector3.new()
                    end
                end
            end
        end)
    end
end)

--killaura
getgenv().KAtime = 2.5

function Fist1()
    task.spawn(function()
        while task.wait() do
            if killaura1 then
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("fist_combat",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(KAtime)
            end
        end
    end)
end

function Fans1()
    task.spawn(function()
        while task.wait() do
            if killaura2 then
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "fans_combat_slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(KAtime)
            end
        end
    end)
end

function Scythe1()
    task.spawn(function()
        while task.wait() do
            if killaura3 then
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Scythe_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(KAtime)
            end
        end
    end)
end

function Claw1()
    task.spawn(function()
        while task.wait() do
            if killaura4 then
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "claw_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(KAtime)
            end
        end
    end)
end

function Sword1()
    task.spawn(function()
        while task.wait() do
            if killaura5 then
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919,
                    "ground_slash")
                task.wait(0.12)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "Sword_Combat_Slash",
                    client,
                    client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge,
                    "ground_slash")
                task.wait(KAtime)
            end
        end
    end)
end

--wardrums
function Wardrums()
    spawn(function()
        while warfans do
            ReplStor:WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(true)
            wait(19)
        end
    end)
end

-- god mode
spawn(function()
    while task.wait() do
        repeat
            if GodMode1 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "akaza_bda_compass_needle", 1)
                task.wait()
            end
        until getgenv().GodMode1 == false
    end
end)

spawn(function()
    while task.wait() do
        repeat
            if GodMode2 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "ice_demon_art_bodhisatva", 1)
                task.wait()
            end
        until getgenv().GodMode2 == false
    end
end)

spawn(function()
    while task.wait() do
        repeat
            if GodMode3 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "scythe_asteroid_reap", 1)
                task.wait()
            end
        until getgenv().GodMode3 == false
    end
end)

spawn(function()
    while task.wait() do
        repeat
            if GodMode4 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "explosive_demon_art_blood_burst", 1)
                task.wait()
            end
        until not getgenv().GodMode4
    end
end)

spawn(function()
    while task.wait() do
        repeat
            if GodMode5 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "dream_bda_flesh_monster", 1)
                task.wait()
            end
        until not getgenv().GodMode5
    end
end)

spawn(function()
    while task.wait() do
        if GodMode6 then
            game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)
            task.wait(1)
        elseif not GodMode6 then
            game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(false)
            task.wait(1)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode7 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S
                    :FireServer("skil_ting_asd", client, "swamp_bda_swamp_domain", 1)
                task.wait()
            end
        until not GodMode7
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode8 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "flame_breathing_flaming_eruption", 1)
                task.wait()
            end
        until not GodMode8
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode9 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client, "Water_fall_basin",
                    1)
                task.wait()
            end
        until not GodMode9
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode10 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "Wind_breathing_black_wind_mountain_mist", 1)
                task.wait()
            end
        until not GodMode10
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode11 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "insect_breathing_dance_of_the_centipede", 1)
                task.wait()
            end
        until not GodMode11
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode12 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "sound_breathing_smoke_screen", 1)
                task.wait()
            end
        until not GodMode12
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode13 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "Beast_breathing_devouring_slash", 1)
                task.wait()
            end
        until not GodMode13
    end
end)

task.spawn(function()
    while task.wait() do
        repeat
            if GodMode14 then
                ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                    "snow_breathing_illusory_Storm", 1)
                task.wait()
            end
        until not GodMode14
    end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Apple HUB | Project Slayers",
    LoadingTitle = "Apple HUB",
    LoadingSubtitle = "by Huyninja",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Apple HUB"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Apple HUB | Project Slayers",
        Subtitle = "Apple HUB key system",
        Note = "Join AppleHUB Discord for Key",
        FileName = "AppleKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = { "Apple" }
    }
})
local MainTab = Window:CreateTab("MainTab", 4483362458)

MainTab:CreateSection("Kill Aura")

MainTab:CreateToggle({
    Name = "Fist KillAura",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(state)
        Fist1()
        while true do
            getgenv().killaura1 = state;
            task.wait(KAtime)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Warfans KillAura",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(state)
        Fans1()
        while true do
            getgenv().killaura2 = state;
            task.wait(KAtime)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Scythe KillAura",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(state)
        Scythe1()
        while true do
            getgenv().killaura3 = state;
            task.wait(KAtime)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Claw KillAura",
    CurrentValue = false,
    Flag = "Toggle4",
    Callback = function(state)
        Claw1()
        while true do
            getgenv().killaura4 = state;
            task.wait(KAtime)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Sword KillAura",
    CurrentValue = false,
    Flag = "Toggle5",
    Callback = function(state)
        Sword1()
        while true do
            getgenv().killaura5 = state;
            task.wait(KAtime)
        end
    end,
})

MainTab:CreateSlider({
    Name = "KillAura Time",
    Range = { 2, 5 },
    Increment = 0.5,
    Suffix = "Secs",
    CurrentValue = 2.5,
    Flag = "Slider4",
    Callback = function(state)
        getgenv().KAtime = state
    end,
})

MainTab:CreateSection("GKA")

local running = false

local firing = false

MainTab:CreateToggle({
    Name = "ArrowGKA Bypass(Use this first)",
    CurrentValue = false,
    Flag = "Toggle48",
    Callback = function(state)
        if state then
            firing = state      -- Update the firing state

            if firing then      -- Start the loop only if firing is true
                while firing do -- Loop while firing is true
                    local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                    ReplStor.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", client,
                        "arrow_knock_back",
                        5)
                    task.wait(11)
                end
            end
        end
    end
})

MainTab:CreateToggle({
    Name = 'Arrow (Mobs)',
    CurrentValue = false,
    Flag = "Toggle52",
    Callback = function(state)
        running = state
        if running then
            while running do
                local success, error = pcall(function()
                    local hitCounter = {}
                    for i, v in next, workspace.Mobs:GetDescendants() do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            local modelId = v:GetFullName()
                            if not hitCounter[modelId] then
                                hitCounter[modelId] = 0
                            end
                            if hitCounter[modelId] < 2 then
                                local humanoid = v:FindFirstChildOfClass("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server
                                        .Handle_Initiate_S_
                                    Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage",
                                        game.Players.LocalPlayer.Character, v.HumanoidRootPart.CFrame, v, 500, 500)
                                    hitCounter[modelId] = hitCounter[modelId] + 1
                                else
                                    print("Model with health 0:", modelId)
                                end
                            end

                            -- Check if we hit two mobs/models
                            local hitCount = 0
                            for _, count in pairs(hitCounter) do
                                hitCount = hitCount + count
                            end
                            if hitCount >= 2 then
                                break
                            end
                        end
                    end
                end)
                wait()
            end
        end
    end
})

MainTab:CreateToggle({
    Name = 'Arrow (Bosses)',
    CurrentValue = false,
    Flag = "Toggle54",
    Callback = function(state)
        running = state
        if running then
            while running do
                local success, error = pcall(function()
                    local hitCounter = {}
                    for i, v in next, workspace.Mobs.Bosses:GetDescendants() do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            local modelId = v:GetFullName()
                            if not hitCounter[modelId] then
                                hitCounter[modelId] = 0
                            end
                            if hitCounter[modelId] < 2 then
                                local humanoid = v:FindFirstChildOfClass("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server
                                        .Handle_Initiate_S_
                                    Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage",
                                        game.Players.LocalPlayer.Character, v.HumanoidRootPart.CFrame, v, 500, 500)
                                    hitCounter[modelId] = hitCounter[modelId] + 1
                                else
                                    print("Model with health 0:", modelId)
                                end
                            end

                            -- Check if we hit two mobs/models
                            local hitCount = 0
                            for _, count in pairs(hitCounter) do
                                hitCount = hitCount + count
                            end
                            if hitCount >= 2 then
                                break
                            end
                        end
                    end
                end)
                wait()
            end
        end
    end
})

local firing1 = false

MainTab:CreateToggle({
    Name = "Bypass THUNDER KA [USE THIS FIRST]",
    CurrentValue = false,
    Flag = "Bypass GKA",
    Callback = function(state)
        firing1 = state
        if firing1 then
            while firing1 do
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(
                    "skil_ting_asd",
                    game:GetService("Players").LocalPlayer, "Thunderbreathingrapidslashes", 5)
                wait(14)
            end
        end
    end
})

local TKA = false

MainTab:CreateToggle({
    Name = "Thunder KA",
    CurrentValue = false,
    FLag = "Thunder GKA",
    Callback = function(state)
        TKA = state
        while TKA do
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(
                "ricespiritdamage", game:GetService("Players").LocalPlayer.Character,
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame, 300)
            wait(0.85)
        end
    end
})

MainTab:CreateSection("Farm Setting")

MainTab:CreateButton {
    Name = "Mob Remove Block",
    CurrentValue = false,
    Flag = "Toggle57",
    Callback = function()
        game.Workspace.Mobs.DescendantAdded:Connect(function(c)
            if c.Name == "Blocking" then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild(
                    "Handle_Initiate_S"):FireServer("remove_blocking", c.Parent)
            end
        end)
    end
}

MainTab:CreateToggle({
    Name = "AutoLoot",
    CurrentValue = false,
    Flag = "Toggle6",
    Callback = function(state)
        loot()
        while true do
            getgenv().autoloot = state;
            task.wait(1)
        end
    end
})

MainTab:CreateToggle({
    Name = "Inf Block",
    Flag = "Toggle45",
    CurrentValue = false,
    Callback = function(state)
        getgenv().infblock = state,
            autoblock()
    end
})

MainTab:CreateSlider({
    Name = "Tween Speed",
    Range = { 50, 500 },
    Increment = 50,
    Suffix = "Speed",
    CurrentValue = 150,
    Flag = "Slider1",
    Callback = function(state)
        getgenv().tweenspeed = state
    end,
})

MainTab:CreateSection("Auto Use Skill")

MainTab:CreateToggle({
    Name = "Skill Z",
    CurrentValue = false,
    Flag = "Toggle37",
    Callback = function(state)
        getgenv().skillz = state
        skill1()
    end
})

MainTab:CreateToggle({
    Name = "Skill X",
    CurrentValue = false,
    Flag = "Toggle38",
    Callback = function(state)
        getgenv().skillx = state
        skill2()
    end
})

MainTab:CreateToggle({
    Name = "Skill C",
    CurrentValue = false,
    Flag = "Toggle39",
    Callback = function(state)
        getgenv().skillc = state
        skill3()
    end
})

MainTab:CreateToggle({
    Name = "Skill V",
    CurrentValue = false,
    Flag = "Toggle40",
    Callback = function(state)
        getgenv().skillv = state
        skill4()
    end
})

MainTab:CreateToggle({
    Name = "Skill B",
    CurrentValue = false,
    Flag = "Toggle41",
    Callback = function(state)
        getgenv().skillb = state
        skill5()
    end
})

MainTab:CreateToggle({
    Name = "Skill N",
    CurrentValue = false,
    Flag = "Toggle42",
    Callback = function(state)
        getgenv().skilln = state
        skill6()
    end
})

local Godmode = Window:CreateTab("GodMode", 4483362458)

Godmode:CreateSection("Universal GodMode")

Godmode:CreateToggle({
    Name = "ScytheGM(Mas28+)",
    CurrentValue = false,
    Flag = "Toggle8",
    Callback = function(state)
        getgenv().GodMode3 = state;
    end
})

Godmode:CreateToggle({
    Name = "KamadoGM(Kamado Only)",
    CurrentValue = false,
    Flag = "Toggle43",
    Callback = function(state)
        getgenv().GodMode6 = state
    end
})

Godmode:CreateToggle({
    Name = 'Semi God Mode (ALL RACES)',
    CurrentValue = false,     -- Default value (true / false)
    Flag = "Toggle50",
    Callback = function(state)
        if state then
            game:GetService("ReplicatedStorage").Remotes.regeneration_breathing_remote:FireServer(true)
        else
            game:GetService("ReplicatedStorage").Remotes.regeneration_breathing_remote:FireServer(false)
        end
    end
})

Godmode:CreateSection("Demon Only")

Godmode:CreateToggle({
    Name = "IceBDAGM(Mas57+)",
    CurrentValue = false,
    Flag = "Toggle9",
    Callback = function(state)
        getgenv().GodMode2 = state
    end
})

Godmode:CreateToggle({
    Name = "ShockwaveGM(Mas50+)",
    CurrentValue = false,
    Flag = "Toggle10",
    Callback = function(state)
        getgenv().GodMode1 = state
    end
})

Godmode:CreateToggle({
    Name = "DreamGM(Mas59+)",
    CurrentValue = false,
    Flag = "Toggle26",
    Callback = function(state)
        getgenv().GodMode5 = state
    end
})

Godmode:CreateToggle({
    Name = "BloodGM(Mas45+)",
    CurrentValue = false,
    Flag = "Toggle27",
    Callback = function(state)
        getgenv().GodMode4 = state
    end
})

Godmode:CreateToggle({
    Name = "Swamp(Mas60+)",
    CurrentValue = false,
    Flag = "Toggle28",
    Callback = function(state)
        getgenv().GodMode7 = state
    end
})

Godmode:CreateSection("Human Only")

Godmode:CreateToggle({
    Name = "FlameGM(Mas32+)",
    CurrentValue = false,
    Flag = "Toggle29",
    Callback = function(state)
        getgenv().GodMode8 = state
    end
})

Godmode:CreateToggle({
    Name = "WaterGM(Mas31+)",
    CurrentValue = false,
    Flag = "Toggle30",
    Callback = function(state)
        getgenv().GodMode9 = state
    end
})

Godmode:CreateToggle({
    Name = "WindGM(Mas30+)",
    CurrentValue = false,
    Flag = "Toggle31",
    Callback = function(state)
        getgenv().GodMode10 = state
    end
})

Godmode:CreateToggle({
    Name = "InsectGM(Mas28+)",
    CurrentValue = false,
    Flag = "Toggle32",
    Callback = function(state)
        getgenv().GodMode11 = state
    end
})

Godmode:CreateToggle({
    Name = "SoundGM(Mas50+)",
    CurrentValue = false,
    Flag = "Toggle33",
    Callback = function(state)
        getgenv().GodMode12 = state
    end
})

Godmode:CreateToggle({
    Name = "BeastGM(Mas40+)",
    CurrentValue = false,
    Flag = "Toggle34",
    Callback = function(state)
        getgenv().GodMode13 = state
    end
})

Godmode:CreateToggle({
    Name = "SnowGM(Mas30+)",
    CurrentValue = false,
    Flag = "Toggle35",
    Callback = function(state)
        getgenv().GodMode14 = state
    end
})

local Misc = Window:CreateTab("Other", 4483362458)

Misc:CreateSection("Misc")

Misc:CreateInput({
    Name = "Select Clan",
    PlaceholderText = "Clan",
    NumbersOnly = false,
    CharacterLimit = 15,
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        local clanValue = v
        clan(clanValue)
    end
})

Misc:CreateButton({
    Name = "Rejoin Server",
    Interact = "Click",
    Flag = "Button7",
    Callback = function(state)
        repeat
            ts:Teleport(game.PlaceId)
            wait(2)
        until false
    end
})

Misc:CreateButton({
    Name = "Noclip",
    Interact = "Click",
    Flag = 'Button5',
    Callback = function(state)
        game:GetService("RunService").Stepped:Connect(function()
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end)
    end
})

Misc:CreateButton({
    Name = "Remove Texture",
    CurrentValue = false,
    Interact = "Click",
    Flag = "Button6",
    Callback = function(state)
        getgenv().reducelag3 = true
        revtexture()
    end
})

Misc:CreateButton({
    Name = "Remove Particles",
    CurrentValue = false,
    Interact = "Click",
    Flag = "Button6",
    Callback = function(state)
        getgenv().reducelag2 = true
        revparticles()
    end
})

Misc:CreateButton({
    Name = "Remove DmgText",
    Interact = "Click",
    Flag = "Button6",
    Callback = function(state)
        getgenv().reducelag1 = true
        reveffect()
    end
})

Misc:CreateToggle({
    Name = "White Screen(FPS boost)",
    CurrentValue = false,
    Flag = "Toggle47",
    Callback = function(state)
        if state == true then
            rn:Set3dRenderingEnabled(false)
        elseif state == false then
            rn:Set3dRenderingEnabled(true)
        end
    end
})

Misc:CreateToggle({
    Name = "WarDrums(Damage, Speed)",
    CurrentValue = false,
    Flag = "Toggle12",
    Callback = function(state)
        getgenv().warfans = state;
        Wardrums()
    end,
})

Misc:CreateToggle({
    Name = "Auto Farm Soul",
    CurrentValue = false,
    Flag = "Toggle13",
    Callback = function(state)
        getgenv().eatsoul = state;
        eatthedamnsoul()
    end,
})

Misc:CreateToggle({
    Name = "No Sun Dmg",
    CurrentValue = false,
    Flag = "Toggle14",
    Callback = function(state)
        getgenv().NoSunDmg = state;
        client.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = getgenv().NoSunDmg
    end
})

Misc:CreateToggle({
    Name = 'InfStamina',
    CurrentValue = false,
    Flag = "Toggle49",     -- Default value (true / false)
    Callback = function(state)
        if state then
            getgenv().infstuff = true
            while getgenv().infstuff do
                task.wait()
                getrenv()._G:Stamina(-100)
            end
        else
            getgenv().infstuff = false
        end
    end
})

Misc:CreateToggle({
    Name = "infBreath",
    CurrentValue = false,
    Flag = "Toggle48",
    Callback = function(state)
        if state then
            getgenv().infstuff = true
            while getgenv().infstuff do
                task.wait()
                getrenv()._G:Breath(-100)
            end
        else
            getgenv().infstuff = false
        end
    end
})

local server = Window:CreateTab("TP", 4483362458)

server:CreateButton({
    Name = "Rejoin Server",
    Interact = "Click",
    Flag = "Button7",
    Callback = function()
        repeat
            ts:Teleport(game.PlaceId)
            wait(2)
        until false
    end
})

server:CreateButton({
    Name = "Map 1",
    Interact = "Click",
    Flag = "Button8",
    Callback = function()
        game:GetService('TeleportService'):Teleport(6152116144)
    end
})

server:CreateButton({
    Name = "Map 2",
    Interact = "Click",
    Flag = "Button9",
    Callback = function()
        game:GetService('TeleportService'):Teleport(11468159863)
    end
})

server:CreateButton({
    Name = "Trading",
    Interact = "Click",
    Flag = "Button10",
    Callback = function()
        game:GetService('TeleportService'):Teleport(13489082242)
    end
})

server:CreateButton({
    Name = "Hub",
    Interact = "Click",
    Flag = "Button11",
    Callback = function()
        game:GetService('TeleportService'):Teleport(9321822839)
    end
})

server:CreateButton({
    Name = "Menu",
    Interact = "Click",
    Flag = "Button12",
    Callback = function()
        game:GetService('TeleportService'):Teleport(5956785391)
    end
})

local Dungeon = Window:CreateTab("Dungeon", 4483362458)

getgenv().ADFarmMethod = "Above"
Dungeon:CreateToggle({
    Name = "Farm Method(Above)",
    CurrentValue = false,
    Flag = "Toggle",
    Callback = function(state)
        getgenv().ADFarmMethod = "Above";
    end
})

Dungeon:CreateToggle({
    Name = "Farm Method(Below)",
    CurrentValue = false,
    Flag = "Toggle",
    Callback = function(state)
        getgenv().ADFarmMethod = "Below";
    end
})

Dungeon:CreateToggle({
    Name = "Farm Method(Behind)",
    CurrentValue = false,
    Flag = "Toggle",
    Callback = function(state)
        getgenv().ADFarmMethod = "Behind";
    end
})

Dungeon:CreateToggle({
    Name = "Farm Method(Ahead)",
    CurrentValue = false,
    Flag = "Toggle",
    Callback = function(state)
        getgenv().ADFarmMethod = "Ahead";
    end
})

getgenv().ADfarmdistance = 5
Dungeon:CreateSlider({
    Name = "Farm Distance",
    Range = { 0, 100 },
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 5,
    Flag = "Slider6",
    Callback = function(self)
        getgenv().ADfarmdistance = self
    end,
})

Dungeon:CreateToggle({
    Name = "Auto Farm Dungeon",
    CurrentValue = false,
    Flag = "Toggle16",
    Callback = function(state)
        getgenv().autodung = state;
    end
})

Dungeon:CreateSlider({
    Name = "Auto Orb Timer",
    Range = { 1, 10 },
    Increment = 1,
    Suffix = "Second",
    CurrentValue = 5,
    Flag = "Slider7",
    Callback = function(state)
        getgenv().Time = state
    end,
})

Dungeon:CreateToggle({
    Name = "Auto Orb",
    CurrentValue = false,
    Flag = "Toggle17",
    Callback = function(state)
        getgenv().AutoOrb = state
    end
})