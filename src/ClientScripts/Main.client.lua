local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local StartKnit = require(ReplicatedStorage.Client.StartKnitClient)
local StartMatter = require(ReplicatedStorage.Shared.StartMatter)
local Components = require(ReplicatedStorage.Client.Components)

local Character = Components.Character
local Camera = Components.Camera

local client = Players.LocalPlayer

StartKnit()
local world = StartMatter(ReplicatedStorage.Client.Systems)

client.CharacterAdded:Connect(function(char)
    char:WaitForChild('Humanoid')

    world:spawn(
        Character {
            Instance = char,
        },
        Camera {
            Instance = workspace.CurrentCamera,
        }
    )
end)
