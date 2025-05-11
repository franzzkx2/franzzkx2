local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({Name = "Toys Trading Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "ToysFarm"})

local autoFarm = false
local autoUpgrade = false
local player = game.Players.LocalPlayer

function startAutoFarm()
    while autoFarm do
        pcall(function()
            game:GetService("ReplicatedStorage").Events.PickAndDrop.SellRE:FireServer()
        end)
        task.wait(1)
    end
end

function startAutoUpgrade()
    while autoUpgrade do
        pcall(function()
            game:GetService("ReplicatedStorage").Events.UpgradeRE:FireServer()
        end)
        task.wait(2)
    end
end

local FarmTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

FarmTab:AddToggle({
    Name = "Auto Sell (Farm)",
    Default = false,
    Callback = function(Value)
        autoFarm = Value
        if Value then
            startAutoFarm()
        end
    end
})

local UpgradeTab = Window:MakeTab({
    Name = "Auto Upgrade",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

UpgradeTab:AddToggle({
    Name = "Auto Upgrade",
    Default = false,
    Callback = function(Value)
        autoUpgrade = Value
        if Value then
            startAutoUpgrade()
        end
    end
})

OrionLib:Init()
