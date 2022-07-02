local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local StartKnit = require(ReplicatedStorage.Client.StartKnitClient)
local StartMatter = require(ReplicatedStorage.Shared.StartMatter)
local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player
local Camera = Components.Camera

local client = Players.LocalPlayer

StartKnit()

local world = StartMatter(ReplicatedStorage.Client.Systems)

world:spawn(
    Player {
        Instance = client,
    },
    Camera {
        Instance = workspace.CurrentCamera,
    }
)
