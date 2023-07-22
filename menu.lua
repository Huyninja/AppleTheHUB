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

local Section = MainTab:CreateSection("Main")

MainTab:CreateButton({
    Name = "Auto Daily Spin",
    Interact = "Click",
    Flag = "Button1",
    Callback = function()
        daily()
    end
})

MainTab:CreateButton({
    Name = "Clan Spin for Mythic/Supreme",
    Interact = "Click",
    Flag = "Button2",
    Callback = function()
        mythsup()
    end
})

MainTab:CreateButton({
    Name = "Clan Spin for Supreme",
    Interact = "Click",
    Flag = "Button3",
    Callback = function()
        supreme()
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

function daily()
    task.spawn(function ()
        while task.wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
        end
    end)
end

function supreme()
    task.spawn(function ()
        local clan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan
        local wanted = { "Kamado", "Agatsuma", "Rengoku", "Uzui" }

        repeat
            wait(0.001)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin",
                game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, clan)
        until table.find(wanted, clan.Value)
    end)
end

function mythsup()
    task.spawn(function ()
        local clan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan
        local wanted = { "Kamado", "Agatsuma", "Rengoku", "Uzui", "Soyama", "Tokito", "Tomioka", "Hashibira" }

        repeat
            wait(0.001)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin",
                game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, clan)
        until table.find(wanted, clan.Value)
    end)
end
