local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local InitMatter = require(ReplicatedStorage.Shared.InitMatter)
local Components = require(ReplicatedStorage.Client.Components)

local Character = Components.Character
local Camera = Components.Camera

local client = Players.LocalPlayer

local world = InitMatter(ReplicatedStorage.Client.Systems)

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
